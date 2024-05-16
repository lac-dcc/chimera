//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

module airi5c_splitter
(
    input   [31:0]  float_in,

    output  [23:0]  man,
    output  [7:0]   Exp,
    output          sgn,

    output          zero,
    output          inf,
    output          sNaN,
    output          qNaN,
    output          denormal
);
    wire    hidden_bit;
    wire    max_exp;
    wire    man_NZ;
    wire    NaN;
    
    assign  sgn         = float_in[31];
    assign  Exp         = float_in[30:23];
    assign  man[22:0]   = float_in[22:0];

    assign  hidden_bit  = |Exp;
    // 1 if exponent is the highes possible (unbiased: 255, biased: 128 or inf)
    assign  max_exp     = &Exp;
    // 1 if the mantissa is unequal to zero
    assign  man_NZ      = |man[22:0];
    // 1 if the input is either sNaN or qNaN
    assign  NaN         = max_exp && man_NZ;

    assign  man[23]     = hidden_bit;
    assign  denormal    = !hidden_bit;
    assign  zero        = !hidden_bit && !man_NZ;
    assign  inf         = !man_NZ && max_exp;
    assign  sNaN        = !float_in[22] && NaN;
    assign  qNaN        = float_in[22] && NaN;

endmodule