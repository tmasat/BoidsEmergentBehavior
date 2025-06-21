//
//  Renderer.swift
//  BoidsEmergentBehavior
//
//  Created by Tugberk Masat on 21.06.2025.
//

import Metal
import MetalKit
import simd

class Renderer: NSObject {
    let device: MTLDevice
    var renderPipelineState: MTLRenderPipelineState!
    var vertexBuffer: MTLBuffer!
    
    let boidCount = 512
    var boids: [Boid] = []
    
    init(device: MTLDevice) {
        self.device = device
        super.init()
        buildBoids()
    }
    
    private func buildBoids() {
        for _ in 0..<boidCount {
            let boid = Boid(
                position: float2(Float.random(in: 0...1000), Float.random(in: 0...1000)),
                velocity: float2(Float.random(in: -1...1), Float.random(in: -1...1))
            )
            boids.append(boid)
        }
        vertexBuffer = device.makeBuffer(bytes: boids, length: MemoryLayout<Boid>.stride * boidCount, options: .storageModeShared)
    }
    
    private func buildPipelines() {
        // Basic pipeline setup
    }
    
    func draw(in view: MTKView) {
        // Basic drawing
    }
}
