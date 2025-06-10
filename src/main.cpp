#include <raylib.h>

#include "colors/Rgb.hpp"
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

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(catpuccin::Lavender.opaque());
        EndDrawing();
    }

    CloseWindow();
}
