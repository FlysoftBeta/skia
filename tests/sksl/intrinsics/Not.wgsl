struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
  @builtin(position) sk_FragCoord: vec4<f32>,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
struct _GlobalUniforms {
  colorGreen: vec4<f32>,
  colorRed: vec4<f32>,
};
@binding(0) @group(0) var<uniform> _globalUniforms: _GlobalUniforms;
fn main(_skParam0: vec2<f32>) -> vec4<f32> {
  let coords = _skParam0;
  {
    var inputVal: vec4<bool> = vec4<bool>(_globalUniforms.colorGreen);
    var expected: vec4<bool> = vec4<bool>(true, false, true, false);
    return select(_globalUniforms.colorRed, _globalUniforms.colorGreen, vec4<bool>(((((all(!inputVal.xy == expected.xy) && all(!inputVal.xyz == expected.xyz)) && all(!inputVal == expected)) && all(vec2<bool>(true, false) == expected.xy)) && all(vec3<bool>(true, false, true) == expected.xyz)) && all(vec4<bool>(true, false, true, false) == expected)));
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  _stageOut.sk_FragColor = main(_stageIn.sk_FragCoord.xy);
  return _stageOut;
}
