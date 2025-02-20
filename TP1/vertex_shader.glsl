#version 330 core

// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertices_position_modelspace;
layout(location = 1) in vec2 vertexUV;

//TODO create uniform transformations matrices Model View Projection
uniform mat4 MVP;

uniform sampler2D heightmap;
uniform float heightScale;

// Values that stay constant for the whole mesh.
out vec2 UV;

void main(){
        float altitude = texture(heightmap,vertexUV).r * heightScale;
        vec3 relief = vec3(vertices_position_modelspace.x,altitude,vertices_position_modelspace.z);

        // TODO : Output position of the vertex, in clip space : MVP * position
        gl_Position = MVP * vec4(relief,1);
        UV = vertexUV; // Transmettre les UV

}

