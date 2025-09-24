%Module(name=point, language="C++")


/* Declaration of the Point class */
class Point {
    %TypeHeaderCode
    #include "point.h"
    %End

    public:
        /* Constructor */
        Point(int x = 0, int y = 0);

        /* Getter for x */
        int getX() const;

        /* Getter for y */
        int getY() const;

        /* Setter for x */
        void setX(int x);

        /* Setter for y */
        void setY(int y);

        Point operator+(const Point& other) const;
};
