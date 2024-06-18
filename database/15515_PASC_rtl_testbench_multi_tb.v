// This program was cloned from: https://github.com/jbush001/PASC
// License: Apache License 2.0

// 
// Copyright 2013 Jeff Bush
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

module multi_tb;

    wire output_enable;
    wire[3:0] output_core_id;
    wire[15:0] output_data_val;
    wire axi_we;
    wire[15:0] axi_addr;
    wire[15:0] axi_data;
    wire[15:0] axi_q;

    reg clk = 0;
    reg[1000:0] filename;

    assign axi_we = 1'h0;
    assign axi_addr = 16'h0;
    assign axi_data = 16'h0;

    pasc pasc(
        .clk(clk),
        .output_enable(output_enable),
        .output_core_id(output_core_id),
        .output_data_val(output_data_val),
        .axi_we(axi_we),
        .axi_addr(axi_addr),
        .axi_data(axi_data),
        .axi_q(axi_q));

    integer i;

    initial
    begin
        if ($value$plusargs("bin=%s", filename))
            $readmemh(filename, pasc.cluster.global_memory.data);
        else
        begin
            $display("error opening memory image");
            $finish;
        end

        $dumpfile("trace.lxt");
        $dumpvars;

        for (i = 0; i < 2000; i = i + 1)
        begin
            #5 clk = 0;
            if (output_enable)
                $display("output %04x", output_data_val);
            
            #5 clk = 1;
        end
    end

endmodule
