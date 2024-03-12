// decode the input from a rotary encoder
// See http://www.eng.utah.edu/%7Ecs3710/xilinx-docs/examples/s3esk_rotary_encoder_interface.pdf
//

module rotary_decoder(
    input CLK_i,
    input rot_1_i,        // rotary encoder input 1
    input rot_2_i,        // rotary encoder input 2
    output rot_dir_o,     // rotary encoder direction
    output rot_event_o    // rotary encoder event
    );

    // debounce
    wire [1:0] rot_in = {rot_1_i, rot_2_i};
    reg rot_1, rot_2;
    reg rot_1_delay;

    always @(posedge CLK_i) begin
        case (rot_in)
            'b00: rot_1 <= 0;
            'b01: rot_2 <= 0;
            'b10: rot_2 <= 1;
            'b11: rot_1 <= 1;
        endcase

    end

    // decode the (now debounced) rotary input into rot_dir and rot_event
    // rot_dir = 1 means right rotations, and
    // rot_event will go high for one cycle if a rotation occurs
    reg rot_dir, rot_event;

    always @(posedge CLK_i) begin
        rot_1_delay <= rot_1;

        if(rot_1 & ~rot_1_delay) begin
            rot_event <= 1;
            rot_dir <= rot_2;
        end
        else begin
            rot_event <= 0;
        end
    end

    assign rot_dir_o = rot_dir;
    assign rot_event_o = rot_event;

endmodule
