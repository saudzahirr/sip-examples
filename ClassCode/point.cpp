#include "point.h"

// Constructor
Point::Point(int x, int y) : x(x), y(y) {}

// Getters
int Point::getX() const {
    return x;
}

int Point::getY() const {
    return y;
}

// Setters
void Point::setX(int x) {
    this->x = x;
}

void Point::setY(int y) {
    this->y = y;
}

// Binary Operator
Point Point::operator+(const Point& other) const {
    return Point(x + other.x, y + other.y);
}
