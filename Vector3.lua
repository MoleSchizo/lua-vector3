local Vector3 = {}
Vector3.__index = Vector3

function Vector3:new(x, y, z)
    local obj = {}
    setmetatable(obj, Vector3)
    obj.x = x or 0
    obj.y = y or 0
    obj.z = z or 0
    return obj
end

function Vector3.__add(a, b)
    return Vector3:new(a.x + b.x, a.y + b.y, a.z + b.z)
end

function Vector3.__sub(a, b)
    return Vector3:new(a.x - b.x, a.y - b.y, a.z - b.z)
end

function Vector3:dot(b)
    return self.x * b.x + self.y * b.y + self.z * b.z
end

function Vector3:cross(b)
    return Vector3:new(
        self.y * b.z - self.z * b.y,
        self.z * b.x - self.x * b.z,
        self.x * b.y - self.y * b.x
    )
end

function Vector3:magnitude()
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function Vector3:normalize()
    local mag = self:magnitude()
    if mag > 0 then
        self.x = self.x / mag
        self.y = self.y / mag
        self.z = self.z / mag
    end
end

return Vector3
