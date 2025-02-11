struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
  @builtin(position) sk_FragCoord: vec4<f32>,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
struct _GlobalUniforms {
  testInputs: vec4<f32>,
  colorGreen: vec4<f32>,
  colorRed: vec4<f32>,
};
@binding(0) @group(0) var<uniform> _globalUniforms: _GlobalUniforms;
fn main(_skParam0: vec2<f32>) -> vec4<f32> {
  let coords = _skParam0;
  {
    const constGreen: vec4<f32> = vec4<f32>(0.0, 1.0, 0.0, 1.0);
    var expectedA: vec4<f32> = vec4<f32>(0.0, 0.0, 1.0, 1.0);
    var expectedB: vec4<f32> = vec4<f32>(1.0, 1.0, 0.0, 0.0);
    let _skTemp0 = step(0.5, _globalUniforms.testInputs.x);
    let _skTemp1 = step(vec2<f32>(0.5), _globalUniforms.testInputs.xy);
    let _skTemp2 = step(vec3<f32>(0.5), _globalUniforms.testInputs.xyz);
    let _skTemp3 = step(vec4<f32>(0.5), _globalUniforms.testInputs);
    let _skTemp4 = step(_globalUniforms.testInputs.x, 0.0);
    let _skTemp5 = step(_globalUniforms.testInputs.xy, vec2<f32>(0.0, 1.0));
    let _skTemp6 = step(_globalUniforms.testInputs.xyz, vec3<f32>(0.0, 1.0, 0.0));
    let _skTemp7 = step(_globalUniforms.testInputs, constGreen);
    return select(_globalUniforms.colorRed, _globalUniforms.colorGreen, vec4<bool>(((((((((((((((_skTemp0 == expectedA.x && all(_skTemp1 == expectedA.xy)) && all(_skTemp2 == expectedA.xyz)) && all(_skTemp3 == expectedA)) && 0.0 == expectedA.x) && all(vec2<f32>(0.0) == expectedA.xy)) && all(vec3<f32>(0.0, 0.0, 1.0) == expectedA.xyz)) && all(vec4<f32>(0.0, 0.0, 1.0, 1.0) == expectedA)) && _skTemp4 == expectedB.x) && all(_skTemp5 == expectedB.xy)) && all(_skTemp6 == expectedB.xyz)) && all(_skTemp7 == expectedB)) && 1.0 == expectedB.x) && all(vec2<f32>(1.0) == expectedB.xy)) && all(vec3<f32>(1.0, 1.0, 0.0) == expectedB.xyz)) && all(vec4<f32>(1.0, 1.0, 0.0, 0.0) == expectedB)));
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  _stageOut.sk_FragColor = main(_stageIn.sk_FragCoord.xy);
  return _stageOut;
}
