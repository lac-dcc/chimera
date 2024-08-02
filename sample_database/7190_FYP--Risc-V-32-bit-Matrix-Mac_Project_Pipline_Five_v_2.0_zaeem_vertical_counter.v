// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

module vertical_counter (
    input clk_25MHz,
    input enable_V_counter,
    output reg [15:0] V_count_value =0
);
    always@(posedge clk_25MHz )begin
        //keep counting until 525
    if(enable_V_counter == 1'b1)begin    
        if(V_count_value < 524)
            V_count_value <= V_count_value +1;

        else V_count_value <=0; //reset vertical Counter
    end

    end

endmodule