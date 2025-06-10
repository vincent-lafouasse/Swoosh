#include <raylib.h>

#include "colors/ColorMap.hpp"
#include "ints.hpp"

struct Grid {
    static constexpr i32 tileSize = 32;
    static constexpr i32 width = 30;
    static constexpr i32 height = 20;
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
        EndDrawing();
    }

    CloseWindow();
}
