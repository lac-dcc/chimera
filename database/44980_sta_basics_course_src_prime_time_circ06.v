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

module circ06(clk1,clk2,a,y);
input clk1;
input clk2;
input a;
output y;
wire n1,n2;
dffrx1 FF1(.CK(clk1),.D(a),.RB(1'b1),.Q(n1));
invx1 G1(.A(n1),.Y(n2));
dffrx1 FF2(.CK(clk2),.D(n2),.RB(1'b1),.Q(y));
dffnrx1 FF3(.CKN(clk2),.D(n2),.RB(1'b1),.Q(y));
endmodule
