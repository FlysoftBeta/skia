struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
fn main(_stageOut: ptr<function, FSOut>) {
  {
    var a: mat4x4<f32> = mat4x4<f32>(6.0, 0.0, 0.0, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0.0, 6.0);
    let _skTemp0 = mat2x3<f32>(7.0, 0.0, 0.0, 0.0, 7.0, 0.0);
    var b: mat4x4<f32> = mat4x4<f32>(_skTemp0[0][0], _skTemp0[0][1], _skTemp0[0][2], 0.0, _skTemp0[1][0], _skTemp0[1][1], _skTemp0[1][2], 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0);
    (*_stageOut).sk_FragColor.x = f32(select(1, 0, all(a[1] == b[1])));
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  main(&_stageOut);
  return _stageOut;
}
