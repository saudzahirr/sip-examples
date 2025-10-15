import point  # type: ignore

p1 = point.Point(1, 2)
p2 = point.Point(4, 6)

p = p1 + p2

print(f"x Coordinate: {p.getX()}")

print(f"y Coordinate: {p.getY()}")
