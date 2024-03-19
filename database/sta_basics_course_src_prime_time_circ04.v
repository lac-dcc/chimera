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

module circ04(clk,a,b,y);
input clk;
input a,b;
output y;
wire c1,c2,c3;
wire n0,n1,n2,n3;
bufx1 B1(.A(clk),.Y(c1));
bufx1 B2(.A(c1),.Y(c2));
bufx1 B3(.A(c2),.Y(c3));
dffrx1 FF1(.CK(clk),.D(a),.RB(1'b1),.Q(n0));
nand2x1 G1(.A(n0),.B(b),.Y(n1));
invx4 G2(.A(n0),.Y(n2));
nand2x1 G3(.A(n1),.B(n2),.Y(n3));
dffrx1 FF2(.CK(c3),.D(n3),.RB(1'b1),.Q(y));
endmodule
