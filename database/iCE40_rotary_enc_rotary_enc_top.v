`include "rotary_enc.v"

//
//          ------------------
//    GND --|              A |-- D14
//          |     ROTARY     |
//          |     ENCODER    |-- GND
//          |                |
//    B16 --| BTN          B |-- D15
//          ------------------
//

module rotary_enc_top (
    input CLK_i,
    input RSTn_i,
    input B16_i,    // push button of rotary enc.
    input D14_i,    // rotary_1
    input D15_i,    // rotary_2
    output [7:0] LED_o
    );

    wire rot_dir, rot_event;

    rotary_decoder my_rotary_decoder(
        .CLK_i(CLK_i),
        .rot_1_i(~D14_i),
        .rot_2_i(~D15_i),
        .rot_dir_o(rot_dir),
        .rot_event_o(rot_event)
        );


    // shift a bit left and right depending on rot_dir

    reg [7:0] counter = 0;

    always @(posedge CLK_i) begin
        if(rot_event) begin
            if(counter == 0)
                counter <= rot_dir ? 8'b00000001 : 8'b10000000;
            else
                counter <= rot_dir ? counter<<1 : counter>>1;
        end
        if(~RSTn_i | ~B16_i)
            counter <= 0;
    end

    assign LED_o[7:0] = counter[7:0];

endmodule // rotary_enc_top
