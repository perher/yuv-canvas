precision lowp float;

uniform sampler2D uTextureY;
uniform sampler2D uTextureCb;
uniform sampler2D uTextureCr;
varying vec2 vLumaPosition;
varying vec2 vChromaPosition;
void main() {
   // Y, Cb, and Cr planes are uploaded as LUMINANCE textures.
   float fY = texture2D(uTextureY, vLumaPosition).x - 0.0625;
   float fCb = texture2D(uTextureCb, vChromaPosition).x - 0.5;
   float fCr = texture2D(uTextureCr, vChromaPosition).x - 0.5;

   // Premultipy the Y...
   float fYmul = fY * 1.1643828125;

   // And convert that to RGB!
   gl_FragColor = vec4(
     fYmul + 1.8330672 * fCr,
     fYmul - 0.2180455 * fCb - 0.5448967 * fCr,
     fYmul + 2.1599184 * fCb,
     1
   );
}
