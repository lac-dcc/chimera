// This program was cloned from: https://github.com/brabect1/sta_basics_course
// License: Creative Commons Attribution 4.0 International

/*
* Copyright 2019 Tomas Brabec
* 
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* 
*     http://www.apache.org/licenses/LICENSE-2.0
*     
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

module circ05(clk,a,b,c,u,v);
input clk;
input a,b,c;
output u,v;
wire b0,c0;
wire n1,n2,n3,n4,n5,n6,n7,n8;
wire ck1, ck2, ck3;
bufx1 C1(.A(clk),.Y(ck1));
bufx1 C2(.A(clk),.Y(ck2));
bufx1 C3(.A(ck2),.Y(ck3));
dffrx1 FF1(.CK(clk),.D(a),.RB(1'b1),.Q(n1));
invx4 G1(.A(n1),.Y(n2));
bufx1 G2(.A(b),.Y(b0));
bufx4 G3(.A(c),.Y(c0));
nand2x1 G4(.A(b0),.B(c0),.Y(n3));
invx1 G8(.A(n3),.Y(u));
dffrx1 FF2(.CK(ck1),.D(b0),.RB(1'b1),.Q(n4));
nand2x1 G5(.A(n3),.B(n4),.Y(n5));
nand2x1 G6(.A(n5),.B(n1),.Y(n6));
dffrx1 FF3(.CK(ck2),.D(n6),.RB(1'b1),.Q(n8));
nand2x1 G7(.A(n2),.B(n8),.Y(n7));
dffrx1 FF4(.CK(ck3),.D(n7),.RB(1'b1),.Q(v));
endmodule
