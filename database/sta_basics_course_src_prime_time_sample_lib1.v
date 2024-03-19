//
// Copyright 2021 Tomas Brabec
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
//     
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//


// Modified from Mathew Bolin's "OSU DIGITAL CELL LIBRARY DOCUMENTATION", Rev.6 (12/05/2005)
// http://www2.ece.ohio-state.edu/~bibyk/ee683/BolinM_part2_timing.pdf

`timescale 1ns/1ps

`celldefine
module bufx1( A, Y );
input A;
output Y;

buf u(Y, A);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine

`celldefine
module bufx4( A, Y );
input A;
output Y;

buf u(Y, A);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


`celldefine
module invx1( A, Y );
input A;
output Y;

not u(Y, A);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


`celldefine
module invx2( A, Y );
input A;
output Y;

not u(Y, A);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


`celldefine
module invx4( A, Y );
input A;
output Y;

not u(Y, A);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


`celldefine
module nand2x1( A, B, Y );
input A, B;
output Y;

nand u(Y, A, B);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
    ( B => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


`celldefine
module nor2x1( A, B, Y );
input A, B;
output Y;

nor u(Y, A, B);

specify
    specparam td = 0.0;
    ( A => Y ) = ( td, td );
    ( B => Y ) = ( td, td );
endspecify
endmodule
`endcelldefine


primitive udp_dff (out, in, clk, clr_, set_, NOTIFIER);
output out;
input in, clk, clr_, set_, NOTIFIER;
reg out;
table
// |----------------------------------- in
// | |-------------------------------- clk
// | | |---------------------------- clr_
// | | | |------------------------ set_
// | | | | |-------------------- NOT
// | | | | | |-------------- Qt
// | | | | | | |-------- Qt+1
// | | | | | | |
// | | | | | | |
// | | | | | | |
// | | | | | | |
   0 r ? 1 ? : ? : 0 ; // clock in 0
   1 r 1 ? ? : ? : 1 ; // clock in 1
   1 * 1 ? ? : 1 : 1 ; // reduce pessimism
   0 * ? 1 ? : 0 : 0 ; // reduce pessimism
   ? f ? ? ? : ? : - ; // no changes on negedge clk
   * b ? ? ? : ? : - ; // no changes when in switches
   ? ? ? 0 ? : ? : 1 ; // set output
   ? b 1 * ? : 1 : 1 ; // cover all transistions on set_
   1 x 1 * ? : 1 : 1 ; // cover all transistions on set_
   ? ? 0 1 ? : ? : 0 ; // reset output
   ? b * 1 ? : 0 : 0 ; // cover all transistions on clr_
   0 x * 1 ? : 0 : 0 ; // cover all transistions on clr_
   ? ? ? ? * : ? : x ; // any notifier changed
endtable
endprimitive


`celldefine
module dffrx1 ( CK, RB, D, Q );
   output Q;
   input  CK, D, RB;

   wire      dly_Q;
   reg       notifier;

   udp_dff dff(dly_Q, D, CK, RB, 1'b1, notifier);
   buf uq(Q, dly_Q);

   specify
      if (CK) ( RB => Q ) = ( 0.0, 0.0 );
      if (RB) ( CK => Q ) = ( 0.1, 0.1 );
      $width     (negedge RB, 0.0, 0, notifier);
      $width     (negedge CK &&& RB==1'b1, 0.0, 0, notifier);
      $width     (posedge CK &&& RB==1'b1, 0.0, 0, notifier);
      $setuphold (posedge CK &&& RB==1'b1, posedge D, 0.0, 0.0, notifier);
      $setuphold (posedge CK &&& RB==1'b1, negedge D, 0.0, 0.0, notifier);
      $recrem    (posedge RB, posedge CK &&& D==1'b1, 0.0, 0.0, notifier);
   endspecify
endmodule
`endcelldefine
