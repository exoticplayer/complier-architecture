import chisel3._
import chisel3.util._
class md5round extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val c = Input(UInt(32.W))
    val d = Input(UInt(32.W))
    val m = Input(UInt(32.W))
    val s = Input(UInt(5.W))
    val t = Input(UInt(32.W))
    val r = Input(UInt(2.W))
    val next_a = Output(UInt(32.W))
  })
  // TODO: add code for calculating single round
//  #define F(x, y, z) ((x & y) | ((~x) & z))
//  #define G(x, y, z) ((x & z) | (y & (~z)))
//  #define H(x, y, z) (x ^ y ^ z)
//  #define I(x, y, z) (y ^ (x | (~z)))
  def F(x:UInt,y:UInt,z:UInt):UInt={(x & y) | ((~x).asUInt & z)}
  def G(x:UInt,y:UInt,z:UInt):UInt={(x & z) | ((~z).asUInt & y)}
  def H(x:UInt,y:UInt,z:UInt):UInt={x ^ y ^ z}
  def I(x:UInt,y:UInt,z:UInt):UInt={ y ^ ((~z).asUInt | x)}
  val res=Wire(UInt(32.W))
  res:=0.U
  switch(io.r)
  {
    is(0.U){
      res:=io.a+F(io.b,io.c,io.d)+io.m+io.t
    }
    is(1.U) {
      res:=io.a+G(io.b,io.c,io.d)+io.m+io.t
    }
    is(2.U){
      res:=io.a+H(io.b,io.c,io.d)+io.m+io.t

    }
    is(3.U){
      res:=io.a+I(io.b,io.c,io.d)+io.m+io.t
    }
  }
  val left=Wire(UInt(32.W))
  val right=Wire(UInt(32.W))
//  val mid=Wire(UInt(32.W))
  left:=(res << io.s)
//  mid:=(32.U - io.s)
  right:= (res >> (32.U - io.s))
//  right:=0.U
  io.next_a:=io.b+(left | right)
//  io.next_a相当于.c的r()的return值，是运行完成的新的值







}
