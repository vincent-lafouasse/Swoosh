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

    const ColorMap cmap = ColorMap::Catpuccin();

    static constexpr int nSteps = 100;
    static constexpr float stepWidth =
        static_cast<float>(Grid::width * Grid::tileSize) / nSteps;

    while (!WindowShouldClose()) {
        BeginDrawing();
        for (int i = 0; i < nSteps; ++i) {
            const float progression = static_cast<float>(i) / (nSteps - 1);
            const Rectangle rect = {
                .x = stepWidth * i,
                .y = 0.0f,
                .width = stepWidth,
                .height = static_cast<float>(Grid::tileSize * Grid::height),
            };
            DrawRectangleRec(rect, cmap.get(progression).opaque());
        }
        EndDrawing();
    }

    CloseWindow();
}
