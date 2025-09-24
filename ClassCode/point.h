#ifndef POINT_H
#define POINT_H

class Point {
    public:
        // Constructor
        Point(int x = 0, int y = 0);

        // Getters
        int getX() const;
        int getY() const;

        // Setters
        void setX(int x);
        void setY(int y);

        // Binary Operator
        Point operator+(const Point& other) const;

    private:
        int x;
        int y;
};

#endif // POINT_H
