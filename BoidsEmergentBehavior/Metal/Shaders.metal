#include <metal_stdlib>
using namespace metal;

struct Boid {
    float2 position;
    float2 velocity;
};

vertex float4 vertex_shader(const device Boid* boids [[buffer(0)]],
                           uint vid [[vertex_id]]) {
    return float4(boids[vid].position, 0.0, 1.0);
}

fragment float4 fragment_shader() {
    return float4(1.0, 1.0, 1.0, 1.0);
}
