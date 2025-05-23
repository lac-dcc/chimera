// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_P_V
`define SKY130_FD_SC_HVL__UDP_DFF_P_V

/**
 * udp_dff$P: Positive edge triggered D flip-flop (Q output UDP).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$P (
    Q  ,
    D  ,
    CLK
);

    output Q  ;
    input  D  ;
    input  CLK;

    reg Q;

    table
     //  D  CLK  :  Qt : Qt+1
         1  (01) :  ?  :  1    ; // clocked data
         0  (01) :  ?  :  0    ;
         1  (x1) :  1  :  1    ; // reducing pessimism
         0  (x1) :  0  :  0    ;
         0   x   :  0  :  0    ; // unkown CP, hold when D==Q==0
         1   x   :  1  :  1    ; // unkown CP, hold when D==Q==1
         ?  (?0) :  ?  :  -    ;
         *   b   :  ?  :  -    ; // ignore edges on data, unless CP=X
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_P_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_P_PP_PG_N_V
`define SKY130_FD_SC_HVL__UDP_DFF_P_PP_PG_N_V

/**
 * udp_dff$P_pp$PG$N: Positive edge triggered D flip-flop
 *                    (Q output UDP).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$P_pp$PG$N (
    Q       ,
    D       ,
    CLK     ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           CLK  NOTIFIER VPWR VGND :  Qt : Qt+1
                 1           (01)    ?      1    0   :  ?  :  1    ; // clocked data
                 0           (01)    ?      1    0   :  ?  :  0    ;
                 1           (x1)    ?      1    0   :  1  :  1    ; // reducing pessimism
                 0           (x1)    ?      1    0   :  0  :  0    ;
                 1           (0x)    ?      1    0   :  1  :  1    ;
                 0           (0x)    ?      1    0   :  0  :  0    ;
                 0            x      ?      1    0   :  0  :  0    ; // Hold when CLK=X and D=Q
                 1            x      ?      1    0   :  1  :  1    ; // Hold when CLK=X and D=Q
                 ?           (?0)    ?      1    0   :  ?  :  -    ;
                 *            b      ?      1    0   :  ?  :  -    ; // ignore edges on data
        // ['IfDef(functional)', '']                 ?            ?      *      1    0   :  ?  :  -    ;
        // ['Else', '']                 ?            ?      *      1    0   :  ?  :  x    ;
        // ['EndIfDef(functional)', '']                 ?            ?      ?      *    ?   :  ?  :  x    ; // any change on vpwr
                 ?            ?      ?      ?    *   :  ?  :  x    ; // any change on vgnd
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_P_PP_PG_N_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_PR_V
`define SKY130_FD_SC_HVL__UDP_DFF_PR_V

/**
 * udp_dff$PR: Positive edge triggered D flip-flop with active high
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$PR (
    Q    ,
    D    ,
    CLK  ,
    RESET
);

    output Q    ;
    input  D    ;
    input  CLK  ;
    input  RESET;

    reg Q;

    table
     //  D  CLK  RESET :  Qt : Qt+1
         *   b     0   :  ?  :  -    ; // data event, hold unless CP==x
         ?  (?0)   0   :  ?  :  -    ; // CP => 0, hold
         ?   b    (?0) :  ?  :  -    ; // R => 0, hold unless CP==x
         ?   ?     1   :  ?  :  0    ; // async reset
         0   r     ?   :  ?  :  0    ; // clock data on CP
         1   r     0   :  ?  :  1    ; // clock data on CP
         0  (x1)   ?   :  0  :  0    ; // possible CP, hold when D==Q==0
         1  (x1)   0   :  1  :  1    ; // possible CP, hold when D==Q==1
         0   x     ?   :  0  :  0    ; // unkown CP, hold when D==Q==0
         1   x     0   :  1  :  1    ; // unkown CP, hold when D==Q==1
         ?   b    (?x) :  0  :  0    ; // R=>x, hold when Q==0 unless CP==x
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_PR_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_PR_PP_PG_N_V
`define SKY130_FD_SC_HVL__UDP_DFF_PR_PP_PG_N_V

/**
 * udp_dff$PR_pp$PG$N: Positive edge triggered D flip-flop with active
 *                     high
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$PR_pp$PG$N (
    Q       ,
    D       ,
    CLK     ,
    RESET   ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  RESET   ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           CLK  RESET NOTIFIER VPWR VGND :  Qt : Qt+1
                 *            b     0      ?      1    0   :  ?  :  -    ; // data event, hold unless CP==x
                 ?           (?0)   0      ?      1    0   :  ?  :  -    ; // CP => 0, hold
                 ?            b    (?0)    ?      1    0   :  ?  :  -    ; // R => 0, hold unless CP==x
                 ?            ?     1      ?      1    0   :  ?  :  0    ; // async reset
                 0            r     ?      ?      1    0   :  ?  :  0    ; // clock data on CP
                 1            r     0      ?      1    0   :  ?  :  1    ; // clock data on CP
                 0           (x1)   ?      ?      1    0   :  0  :  0    ; // possible CP, hold when D==Q==0
                 1           (x1)   0      ?      1    0   :  1  :  1    ; // possible CP, hold when D==Q==1
                 0            x     ?      ?      1    0   :  0  :  0    ; // unkown CP, hold when D==Q==0
                 1            x     0      ?      1    0   :  1  :  1    ; // unkown CP, hold when D==Q==1
                 ?            b    (?x)    ?      1    0   :  0  :  0    ; // R=>x, hold when Q==0 unless CP==x
                 ?            f     x      ?      1    0   :  0  :  0    ; // JCWR reducing pessimism
        // ['IfDef(functional)', '']                 ?            ?     ?      *      1    0   :  ?  :  -    ; // ignore notifier
        // ['Else', '']                 ?            ?     ?      *      1    0   :  ?  :  x    ; // Q => X on any change on notifier
        // ['EndIfDef(functional)', '']                 ?            ?     ?      ?      *    ?   :  ?  :  x    ; // Q => X on any change on vpwr
                 ?            ?     ?      ?      ?    *   :  ?  :  x    ; // Q => X on any change on vgnd
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_PR_PP_PG_N_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_PS_V
`define SKY130_FD_SC_HVL__UDP_DFF_PS_V

/**
 * udp_dff$PS: Positive edge triggered D flip-flop with active high
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$PS (
    Q  ,
    D  ,
    CLK,
    SET
);

    output Q  ;
    input  D  ;
    input  CLK;
    input  SET;

    reg Q;

    table
     //  D  CLK  SET  :  Qt : Qt+1
         *   b    0   :  ?  :  -    ; // data event, hold unless CP==x
         ?  (?0)  0   :  ?  :  -    ; // CP => 0, hold
         ?   b   (?0) :  ?  :  -    ; // S => 0, hold unless CP==x
         ?   ?    1   :  ?  :  1    ; // async set
         0   r    0   :  ?  :  0    ; // clock data on CP
         1   r    ?   :  ?  :  1    ; // clock data on CP
         0  (x1)  0   :  0  :  0    ; // possible CP, hold when D==Q==0
         1  (x1)  ?   :  1  :  1    ; // possible CP, hold when D==Q==1
         0   x    0   :  0  :  0    ; // unkown CP, hold when D==Q==0
         1   x    ?   :  1  :  1    ; // unkown CP, hold when D==Q==1
         ?   b   (?x) :  1  :  1    ; // S=>x, hold when Q==1 unless CP==x
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_PS_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DFF_PS_PP_PG_N_V
`define SKY130_FD_SC_HVL__UDP_DFF_PS_PP_PG_N_V

/**
 * udp_dff$PS_pp$PG$N: Positive edge triggered D flip-flop with active
 *                     high
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dff$PS_pp$PG$N (
    Q       ,
    D       ,
    CLK     ,
    SET     ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  SET     ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           CLK  SET  NOTIFIER VPWR VGND :  Qt : Qt+1
                 *            b    0      ?      1    0   :  ?  :  -    ; // data event, hold unless CP==x
                 ?           (?0)  0      ?      1    0   :  ?  :  -    ; // CP => 0, hold
                 ?            b   (?0)    ?      1    0   :  ?  :  -    ; // S => 0, hold unless CP==x
                 ?            ?    1      ?      1    0   :  ?  :  1    ; // async set
                 0            r    0      ?      1    0   :  ?  :  0    ; // clock data on CP
                 1            r    ?      ?      1    0   :  ?  :  1    ; // clock data on CP
                 0           (x1)  0      ?      1    0   :  0  :  0    ; // possible CP, hold when D==Q==0
                 1           (x1)  ?      ?      1    0   :  1  :  1    ; // possible CP, hold when D==Q==1
                 0            x    0      ?      1    0   :  0  :  0    ; // unkown CP, hold when D==Q==0
                 1            x    ?      ?      1    0   :  1  :  1    ; // unkown CP, hold when D==Q==1
                 ?            b   (?x)    ?      1    0   :  1  :  1    ; // S=>x, hold when Q==1 unless CP==x
                 ?            f    x      ?      1    0   :  1  :  1    ; // JCWR reducing pessimism
        // ['IfDef(functional)', '']                 ?            ?    ?      *      1    0   :  ?  :  -    ; // ignore notifier
        // ['Else', '']                 ?            ?    ?      *      1    0   :  ?  :  x    ; // Q => X on any change on notifier
        // ['EndIfDef(functional)', '']                 ?            ?    ?      ?      *    ?   :  ?  :  x    ; // Q => X on any change on vpwr
                 ?            ?    ?      ?      ?    *   :  ?  :  x    ; // Q => X on any change on vgnd
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DFF_PS_PP_PG_N_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DLATCH_P_V
`define SKY130_FD_SC_HVL__UDP_DLATCH_P_V

/**
 * udp_dlatch$P: D-latch, gated standard drive / active high
 *               (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dlatch$P (
    Q   ,
    D   ,
    GATE
);

    output Q   ;
    input  D   ;
    input  GATE;

    reg Q;

    table
     //  D  GATE :  Qt : Qt+1
         ?   0   :  ?  :  -    ; // hold
         0   1   :  ?  :  0    ; // pass 0
         1   1   :  ?  :  1    ; // pass 1
         0   x   :  0  :  0    ; // reduce pessimism
         1   x   :  1  :  1    ; // reduce pessimism
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DLATCH_P_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DLATCH_P_PP_PG_N_V
`define SKY130_FD_SC_HVL__UDP_DLATCH_P_PP_PG_N_V

/**
 * udp_dlatch$P_pp$PG$N: D-latch, gated standard drive / active high
 *                       (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dlatch$P_pp$PG$N (
    Q       ,
    D       ,
    GATE    ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  GATE    ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           GATE NOTIFIER VPWR VGND : Qtn : Qtn+1
                 *            0      ?      1    0   :  ?  :   -    ;
                 ?           (?0)    ?      1    0   :  ?  :   -    ;
                 ?           (1x)    ?      1    0   :  ?  :   -    ;
                 0           (0x)    ?      1    0   :  0  :   0    ;
                 1           (0x)    ?      1    0   :  1  :   1    ;
                 0           (x1)    ?      1    0   :  ?  :   0    ;
                 1           (x1)    ?      1    0   :  ?  :   1    ;
                 0            1      ?      1    0   :  ?  :   0    ;
                 1            1      ?      1    0   :  ?  :   1    ;
                 0           (01)    ?      1    0   :  ?  :   0    ;
                 1           (01)    ?      1    0   :  ?  :   1    ;
                 1            x      ?      1    0   :  1  :   1    ; // Reducing pessimism.
                 0            x      ?      1    0   :  0  :   0    ;
        // ['IfDef(functional)', '']                 ?            ?      *      1    0   :  ?  :   -    ; // ignore notifier
        // ['Else', '']                 ?            ?      *      1    0   :  ?  :   x    ; // notifier
        // ['EndIfDef(functional)', '']                 ?            ?      ?      0    ?   :  ?  :   x    ; // vpwr != 1
                 ?            ?      ?      x    ?   :  ?  :   x    ; // vpwr != 1
                 ?            ?      ?      ?    1   :  ?  :   x    ; // vgnd != 0
                 ?            ?      ?      ?    x   :  ?  :   x    ; // vgnd != 0
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DLATCH_P_PP_PG_N_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DLATCH_PR_V
`define SKY130_FD_SC_HVL__UDP_DLATCH_PR_V

/**
 * udp_dlatch$PR: D-latch, gated clear direct / gate active high
 *                (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dlatch$PR (
    Q    ,
    D    ,
    GATE ,
    RESET
);

    output Q    ;
    input  D    ;
    input  GATE ;
    input  RESET;

    reg Q;

    table
     //  D  GATE RESET :  Qt : Qt+1
         ?   0     0   :  ?  :  -    ; // hold
         0   1     0   :  ?  :  0    ; // pass 0
         1   1     0   :  ?  :  1    ; // pass 1
         ?   ?     1   :  ?  :  0    ; // async reset
         0   1     ?   :  ?  :  0    ; // reduce pessimism
         0   x     0   :  0  :  0    ; // reduce pessimism
         1   x     0   :  1  :  1    ; // reduce pessimism
         ?   0     x   :  0  :  0    ; // reduce pessimism
         0   x     x   :  0  :  0    ; // reduce pessimism
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DLATCH_PR_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_DLATCH_PR_PP_PG_N_V
`define SKY130_FD_SC_HVL__UDP_DLATCH_PR_PP_PG_N_V

/**
 * udp_dlatch$PR_pp$PG$N: D-latch, gated clear direct / gate active
 *                        high (Q output UDP)
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_dlatch$PR_pp$PG$N (
    Q       ,
    D       ,
    GATE    ,
    RESET   ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  GATE    ;
    input  RESET   ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           GATE RESET NOTIFIER VPWR VGND :  Qt : Qt+1
                 *            0     0      ?      1    0   :  ?  :  -    ;
                 ?            ?     1      ?      1    0   :  ?  :  0    ; // asynchro clear
                 ?           (?0)   0      ?      1    0   :  ?  :  -    ; // Changed R=? to R=0 ; jek 08/14/06/
                 ?           (1x)   0      ?      1    0   :  ?  :  -    ; // Changed R=? to R=0 ; jek 08/14/06
                 0           (0x)   0      ?      1    0   :  0  :  0    ;
                 1           (0x)   0      ?      1    0   :  1  :  1    ;
                 0           (x1)   0      ?      1    0   :  ?  :  0    ;
                 1           (x1)   0      ?      1    0   :  ?  :  1    ;
                 0            1     0      ?      1    0   :  ?  :  0    ;
                 1            1     0      ?      1    0   :  ?  :  1    ;
                 0           (01)   0      ?      1    0   :  ?  :  0    ;
                 1           (01)   0      ?      1    0   :  ?  :  1    ;
                 ?            0    (?x)    ?      1    0   :  0  :  0    ; // Reducing pessimism.//AB
                 *            0     x      ?      1    0   :  0  :  0    ; // Reducing pessimism//AB
                 0           (?1)   x      ?      1    0   :  ?  :  0    ; // Reducing pessimism.
                (?0)          1     x      ?      1    0   :  ?  :  0    ; // Reducing pessimism.
                 0            1    (?x)    ?      1    0   :  ?  :  0    ; // Reducing pessimism.//AB
                 ?            0    (?0)    ?      1    0   :  ?  :  -    ; // ignore edge on clear
                 0            1    (?0)    ?      1    0   :  ?  :  0    ; // pessimism .
                 1            1    (?0)    ?      1    0   :  ?  :  1    ;
                 1            x     0      ?      1    0   :  1  :  1    ; // Reducing pessimism.
                 0            x     0      ?      1    0   :  0  :  0    ; // Reducing pessimism.
        // ['IfDef(functional)', '']                 ?            ?     ?      *      1    0   :  ?  :  -    ; // ignore notifier
        // ['Else', '']                 ?            ?     ?      *      1    0   :  ?  :  x    ; // notifier
        // ['EndIfDef(functional)', '']                 ?            ?     ?      ?      0    ?   :  ?  :  x    ; // vpwr != 1
                 ?            ?     ?      ?      x    ?   :  ?  :  x    ; // vpwr != 1
                 ?            ?     ?      ?      ?    1   :  ?  :  x    ; // vgnd != 0
                 ?            ?     ?      ?      ?    x   :  ?  :  x    ; // vgnd != 0
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_DLATCH_PR_PP_PG_N_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_ISOLATCHHV_PP_PLG_S_V
`define SKY130_FD_SC_HVL__UDP_ISOLATCHHV_PP_PLG_S_V

/**
 * udp_isolatchhv_pp$PLG$S: Power isolating latch (for HV). Includes
 *                          VPWR, LVPWR, and VGND power pins with
 *                          active high sleep pin (SLEEP).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_isolatchhv_pp$PLG$S (
    UDP_OUT,
    UDP_IN ,
    VPWR   ,
    LVPWR  ,
    VGND   ,
    SLEEP
);

    output UDP_OUT;
    input  UDP_IN ;
    input  VPWR   ;
    input  LVPWR  ;
    input  VGND   ;
    input  SLEEP  ;

    table
     // UDP_IN VPWR LVPWR VGND SLEEP : out
          0     1     1    0     b   :  0   ;
          1     1     1    0     0   :  1   ;
          b     1     ?    0     1   :  0   ;
          ?     1     0    0     1   :  0   ;
          x     1     1    0     1   :  x   ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_ISOLATCHHV_PP_PLG_S_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_MUX_2TO1_V
`define SKY130_FD_SC_HVL__UDP_MUX_2TO1_V

/**
 * udp_mux_2to1: Two to one multiplexer
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_mux_2to1 (
    X ,
    A0,
    A1,
    S
);

    output X ;
    input  A0;
    input  A1;
    input  S ;

    table
     //  A0  A1  S  :  X
         0   0   ?  :  0   ;
         1   1   ?  :  1   ;
         0   ?   0  :  0   ;
         1   ?   0  :  1   ;
         ?   0   1  :  0   ;
         ?   1   1  :  1   ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_MUX_2TO1_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_MUX_4TO2_V
`define SKY130_FD_SC_HVL__UDP_MUX_4TO2_V

/**
 * udp_mux_4to2: Four to one multiplexer with 2 select controls
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_mux_4to2 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

    table
     //  A0  A1  A2  A3  S0  S1 :  X
         0   ?   ?   ?   0   0  :  0   ;
         1   ?   ?   ?   0   0  :  1   ;
         ?   0   ?   ?   1   0  :  0   ;
         ?   1   ?   ?   1   0  :  1   ;
         ?   ?   0   ?   0   1  :  0   ;
         ?   ?   1   ?   0   1  :  1   ;
         ?   ?   ?   0   1   1  :  0   ;
         ?   ?   ?   1   1   1  :  1   ;
         0   0   0   0   ?   ?  :  0   ;
         1   1   1   1   ?   ?  :  1   ;
         0   0   ?   ?   ?   0  :  0   ;
         1   1   ?   ?   ?   0  :  1   ;
         ?   ?   0   0   ?   1  :  0   ;
         ?   ?   1   1   ?   1  :  1   ;
         0   ?   0   ?   0   ?  :  0   ;
         1   ?   1   ?   0   ?  :  1   ;
         ?   0   ?   0   1   ?  :  0   ;
         ?   1   ?   1   1   ?  :  1   ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_MUX_4TO2_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_G_V
`define SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_G_V

/**

 *   UDP_OUT :=x when VPWR!=1
 *   UDP_OUT :=UDP_IN when VPWR==1
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_pwrgood_pp$G (
    UDP_OUT,
    UDP_IN ,
    VGND
);

    output UDP_OUT;
    input  UDP_IN ;
    input  VGND   ;

    table
     // UDP_IN VPWR : UDP_OUT
          0     0   :    0     ;
          1     0   :    1     ;
          ?     1   :    x     ;
          ?     x   :    x     ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_G_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_V
`define SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_V

/**

 *   UDP_OUT :=x when VPWR!=1
 *   UDP_OUT :=UDP_IN when VPWR==1
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_pwrgood_pp$P (
    UDP_OUT,
    UDP_IN ,
    VPWR
);

    output UDP_OUT;
    input  UDP_IN ;
    input  VPWR   ;

    table
     // UDP_IN VPWR : UDP_OUT
          0     1   :    0     ;
          1     1   :    1     ;
          ?     0   :    x     ;
          ?     x   :    x     ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_V


//--------EOF---------

/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_PG_V
`define SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_PG_V

/**

 *   UDP_OUT :=x when VPWR!=1 or VGND!=0
 *   UDP_OUT :=UDP_IN when VPWR==1 and VGND==0
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hvl__udp_pwrgood_pp$PG (
    UDP_OUT,
    UDP_IN ,
    VPWR   ,
    VGND
);

    output UDP_OUT;
    input  UDP_IN ;
    input  VPWR   ;
    input  VGND   ;

    table
     // UDP_IN VPWR VGND : UDP_OUT
          0     1    0   :    0     ;
          1     1    0   :    1     ;
          1     0    0   :    x     ;
          1     1    1   :    x     ;
          1     x    0   :    x     ;
          1     1    x   :    x     ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_PG_V


//--------EOF---------

