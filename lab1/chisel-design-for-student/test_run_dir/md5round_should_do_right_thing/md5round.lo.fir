circuit md5round :
  module md5round :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32>
    input io_b : UInt<32>
    input io_c : UInt<32>
    input io_d : UInt<32>
    input io_m : UInt<32>
    input io_s : UInt<5>
    input io_t : UInt<32>
    input io_r : UInt<2>
    output io_next_a : UInt<32>

    node _T = eq(UInt<1>("h0"), io_r) @[md5round.scala 27:3]
    node _res_T = and(io_b, io_c) @[md5round.scala 20:40]
    node _res_T_1 = not(io_b) @[md5round.scala 20:49]
    node _res_T_2 = and(_res_T_1, io_d) @[md5round.scala 20:60]
    node _res_T_3 = or(_res_T, _res_T_2) @[md5round.scala 20:45]
    node _res_T_4 = add(io_a, _res_T_3) @[md5round.scala 29:16]
    node _res_T_5 = tail(_res_T_4, 1) @[md5round.scala 29:16]
    node _res_T_6 = add(_res_T_5, io_m) @[md5round.scala 29:34]
    node _res_T_7 = tail(_res_T_6, 1) @[md5round.scala 29:34]
    node _res_T_8 = add(_res_T_7, io_t) @[md5round.scala 29:39]
    node _res_T_9 = tail(_res_T_8, 1) @[md5round.scala 29:39]
    node _T_1 = eq(UInt<1>("h1"), io_r) @[md5round.scala 27:3]
    node _res_T_10 = and(io_b, io_d) @[md5round.scala 21:40]
    node _res_T_11 = not(io_d) @[md5round.scala 21:49]
    node _res_T_12 = and(_res_T_11, io_c) @[md5round.scala 21:60]
    node _res_T_13 = or(_res_T_10, _res_T_12) @[md5round.scala 21:45]
    node _res_T_14 = add(io_a, _res_T_13) @[md5round.scala 32:16]
    node _res_T_15 = tail(_res_T_14, 1) @[md5round.scala 32:16]
    node _res_T_16 = add(_res_T_15, io_m) @[md5round.scala 32:34]
    node _res_T_17 = tail(_res_T_16, 1) @[md5round.scala 32:34]
    node _res_T_18 = add(_res_T_17, io_t) @[md5round.scala 32:39]
    node _res_T_19 = tail(_res_T_18, 1) @[md5round.scala 32:39]
    node _T_2 = eq(UInt<2>("h2"), io_r) @[md5round.scala 27:3]
    node _res_T_20 = xor(io_b, io_c) @[md5round.scala 22:39]
    node _res_T_21 = xor(_res_T_20, io_d) @[md5round.scala 22:43]
    node _res_T_22 = add(io_a, _res_T_21) @[md5round.scala 35:16]
    node _res_T_23 = tail(_res_T_22, 1) @[md5round.scala 35:16]
    node _res_T_24 = add(_res_T_23, io_m) @[md5round.scala 35:34]
    node _res_T_25 = tail(_res_T_24, 1) @[md5round.scala 35:34]
    node _res_T_26 = add(_res_T_25, io_t) @[md5round.scala 35:39]
    node _res_T_27 = tail(_res_T_26, 1) @[md5round.scala 35:39]
    node _T_3 = eq(UInt<2>("h3"), io_r) @[md5round.scala 27:3]
    node _res_T_28 = not(io_d) @[md5round.scala 23:44]
    node _res_T_29 = or(_res_T_28, io_b) @[md5round.scala 23:55]
    node _res_T_30 = xor(io_c, _res_T_29) @[md5round.scala 23:40]
    node _res_T_31 = add(io_a, _res_T_30) @[md5round.scala 39:16]
    node _res_T_32 = tail(_res_T_31, 1) @[md5round.scala 39:16]
    node _res_T_33 = add(_res_T_32, io_m) @[md5round.scala 39:34]
    node _res_T_34 = tail(_res_T_33, 1) @[md5round.scala 39:34]
    node _res_T_35 = add(_res_T_34, io_t) @[md5round.scala 39:39]
    node _res_T_36 = tail(_res_T_35, 1) @[md5round.scala 39:39]
    node _GEN_0 = mux(_T_3, _res_T_36, UInt<1>("h0")) @[md5round.scala 27:3 39:10 25:6]
    node _GEN_1 = mux(_T_2, _res_T_27, _GEN_0) @[md5round.scala 27:3 35:10]
    node _GEN_2 = mux(_T_1, _res_T_19, _GEN_1) @[md5round.scala 27:3 32:10]
    node _GEN_3 = mux(_T, _res_T_9, _GEN_2) @[md5round.scala 27:3 29:10]
    node res = _GEN_3 @[md5round.scala 24:15]
    node _left_T = dshl(res, io_s) @[md5round.scala 45:14]
    node _right_T = sub(UInt<6>("h20"), io_s) @[md5round.scala 47:25]
    node _right_T_1 = tail(_right_T, 1) @[md5round.scala 47:25]
    node _right_T_2 = dshr(res, _right_T_1) @[md5round.scala 47:16]
    node left = bits(_left_T, 31, 0) @[md5round.scala 42:16 45:7]
    node right = _right_T_2 @[md5round.scala 43:17 47:8]
    node _io_next_a_T = or(left, right) @[md5round.scala 49:25]
    node _io_next_a_T_1 = add(io_b, _io_next_a_T) @[md5round.scala 49:18]
    node _io_next_a_T_2 = tail(_io_next_a_T_1, 1) @[md5round.scala 49:18]
    io_next_a <= _io_next_a_T_2 @[md5round.scala 49:12]
