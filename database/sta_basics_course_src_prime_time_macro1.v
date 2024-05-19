// This program was cloned from: https://github.com/brabect1/sta_basics_course
// License: Creative Commons Attribution 4.0 International

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

`celldefine
module macro1( A, B, C, Y );
input A, B, C;
output Y;
reg notifier;

assign Y = A & B;

specify
    (A => Y) = (0.0, 0.0);
    (B => Y) = (0.0, 0.0);
    (C => Y) = (0.0, 0.0);

	$setuphold(negedge A, negedge B, 0.0, 0.0, notifier);
	$setuphold(posedge A, posedge B, 0.0, 0.0, notifier);
	$setuphold(posedge A, posedge C, 0.0, 0.0, notifier);
	$setuphold(negedge C, negedge A, 0.0, 0.0, notifier);

endspecify

endmodule
`endcelldefine
