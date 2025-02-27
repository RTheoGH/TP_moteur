#version 330 core

in vec2 UV;
// Ouput data
out vec3 color;

uniform sampler2D myTextureSamplerGRASS;
uniform sampler2D myTextureSamplerROCK;
uniform sampler2D myTextureSamplerSNOW;
uniform sampler2D heightmap;

void main(){

        float altitude = texture(heightmap,UV).r * 10.0;

        vec3 grassColor = texture(myTextureSamplerGRASS,UV).rgb;
        vec3 rockColor = texture(myTextureSamplerROCK,UV).rgb;
        vec3 snowColor = texture(myTextureSamplerSNOW,UV).rgb;

        vec3 blendedColor = mix(grassColor,rockColor,smoothstep(1.5,2.5,altitude));
        blendedColor = mix(blendedColor,snowColor,smoothstep(5.0,6.0,altitude));

        color = blendedColor;

        // DEBUG
        // color =vec3(0.4,0.2,0.2);
        // color =vec3(UV,1.0);
        // color = texture(myTextureSamplerGRASS,UV).rgb;
        // color = texture(myTextureSamplerROCK,UV).rgb;
        // color = texture(myTextureSamplerSNOW,UV).rgb;
}