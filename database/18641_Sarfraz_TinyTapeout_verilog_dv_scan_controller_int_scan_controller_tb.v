// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

// change module name to something that suits your project
module scan_controller_tb;
    initial begin
        // change to suit your project
        $dumpfile ("scan_controller_tb.vcd");
        $dumpvars (0, scan_controller_tb);
        #1;
    end

    reg clk;
    reg RSTB;
    reg power1, power2;
    reg power3, power4;

    wire gpio;
    wire [37:0] mprj_io;

    ///// convenience signals that match what the cocotb test modules are looking for
    // change to suit your project. Here's how we can make some nicer named signals for inputs & outputs

    // outputs
    wire [7:0] outputs = mprj_io[36:29];
    wire ready = mprj_io[37];
    wire slow_clk = mprj_io[10];
    wire fw_ready = mprj_io[7];

    // inputs
    wire [7:0] inputs;
    wire [1:0] driver_sel;
    wire [8:0] active_sel;
    wire set_clk_div;
    assign mprj_io[28:21] = inputs;
    assign mprj_io[9:8] = driver_sel;
    assign mprj_io[20:12] = active_sel;
    assign mprj_io[11] = set_clk_div;
    

    wire flash_csb;
    wire flash_clk;
    wire flash_io0;
    wire flash_io1;

    wire VDD3V3 = power1;
    wire VDD1V8 = power2;
    wire USER_VDD3V3 = power3;
    wire USER_VDD1V8 = power4;
    wire VSS = 1'b0;

    caravel uut (
        .vddio    (VDD3V3),
        .vssio    (VSS),
        .vdda     (VDD3V3),
        .vssa     (VSS),
        .vccd     (VDD1V8),
        .vssd     (VSS),
        .vdda1    (USER_VDD3V3),
        .vdda2    (USER_VDD3V3),
        .vssa1    (VSS),
        .vssa2    (VSS),
        .vccd1    (USER_VDD1V8),
        .vccd2    (USER_VDD1V8),
        .vssd1    (VSS),
        .vssd2    (VSS),
        .clock    (clk),
        .gpio     (gpio),
        .mprj_io  (mprj_io),
        .flash_csb(flash_csb),
        .flash_clk(flash_clk),
        .flash_io0(flash_io0),
        .flash_io1(flash_io1),
        .resetb   (RSTB)
    );

    spiflash #(
        // change the hex file to match your project
        .FILENAME("scan_controller.hex")
    ) spiflash (
        .csb(flash_csb),
        .clk(flash_clk),
        .io0(flash_io0),
        .io1(flash_io1),
        .io2(),         // not used
        .io3()          // not used
    );

endmodule
`default_nettype wire
