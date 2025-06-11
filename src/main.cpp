#include <optional>
#include <raylib.h>

#include "colors/ColorMap.hpp"
#include "ints.hpp"

struct IntVec {
    int x;
    int y;
};

struct Grid {
    static constexpr i32 tileSize = 32;
    static constexpr i32 width = 30;
    static constexpr i32 height = 20;

    class Index {
       public:
        using Int = i32;

        static std::optional<Index> fromVec(IntVec v) {
            if (v.x < 0 || v.x >= Grid::width) {
                return {};
            }
            if (v.y < 0 || v.y >= Grid::height) {
                return {};
            }

            return {v.x + Grid::width * v.y};
        }

       private:
        Int self;
    };
};

int main() {
    InitWindow(Grid::width * Grid::tileSize, Grid::height * Grid::tileSize,
               "Swoosh");
    SetTargetFPS(60);

    const ColorMap cmap = ColorMap::Viridis();

    while (!WindowShouldClose()) {
        BeginDrawing();
        for (i32 x = 0; x < Grid::width; ++x) {
            for (i32 y = 0; y < Grid::height; ++y) {
                const float progression = static_cast<float>(x + y) /
                                          (Grid::height + Grid::width - 2);
                DrawRectangle(x * Grid::tileSize, y * Grid::tileSize,
                              Grid::tileSize, Grid::tileSize,
                              cmap.get(progression).opaque());
            }
        }
        DrawFPS(0, 0);
        EndDrawing();
    }

    CloseWindow();
}
