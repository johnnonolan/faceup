{affine, srt} = require './transforms'

# -- AFFINE
# affine mappings have a list of control points. the first two numbers are
# the x,y coords of a pixel on the overlay image. The next two numbers are
# a point on the destination image (expressed percentage, 0-100). You can
# use the various face.{eye_left,eye_right,nose,mouth_left,...} helpers.

module.exports =
  hipster: affine (face) -> [
    [138, 80, face.eye_left]
    [314, 80, face.eye_right]
  ]

  # hipster: srt (face) -> [
  #   [234.5, 72]
  #   face.width * 1.1 / 469
  #   face.roll
  #   @middle(face.eye_left, face.eye_right)
  # ]

  mustache: srt (face) -> [
    [249, 105]
    face.width / 491
    face.roll
    face.mouth_center
  ]

  sopa: srt (face) -> [
    [64, 19]
    face.width / 128
    face.roll
    face.mouth_center
  ]

  # The original mustachio algorithm
  mustache2: srt (face) -> [
    [249, 105]
    @distance(face.nose, face.mouth_center) / 105
    @angle(face.mouth_left, face.mouth_right)
    face.mouth_center
  ]

  clown: srt (face, photo) -> [
    [108, 111]
    face.width * 0.5 / 202
    0
    face.nose
  ]

  scumbag: affine (face) -> [
    [79, 129, face.eye_left]
    [137, 120, face.eye_right]
  ]

  jason: affine (face) -> [
    [95, 176, face.eye_left]
    [223, 208, face.eye_right]
    [131, 316, face.mouth_center]
  ]



  rohan: affine (face) -> [
    [49, 107, face.eye_left]
    [135, 107, face.eye_right]
    [88, 202, face.mouth_center]
  ]
