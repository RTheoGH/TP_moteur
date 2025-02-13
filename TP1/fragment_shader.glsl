#version 330 core

in vec2 UV;
// Ouput data
out vec3 color;

uniform sampler2D myTextureSampler;

void main(){

        // color =vec3(0.2,0.2,0.4);
        color = texture(myTextureSampler, UV).rgb;

}
