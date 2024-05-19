// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
	 input           MAX10_CLK1_50,
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    wire [7:0] x_bus, y_bus, z_bus;   
    wire carry_in_wire, carry_out_wire;
    
    assign reset = KEY[1];
    assign clock = MAX10_CLK1_50;

    //argument selector
    assign load_x =  SW[9] & ~KEY[0] ? 1'b1 : 1'b0;
    assign load_y = ~SW[9] & ~KEY[0] ? 1'b1 : 1'b0;
    
    //x synchronization
    register 
    # ( .WIDTH(8) )
    x_register (
        .clock   ( clock   ),
        .reset   ( reset   ),
        .load    ( load_x  ),
        .data_in ( SW[8:1] ),
        .data_out( x_bus   )
    );
    
    //y synchronization
    register 
    # ( .WIDTH(8) )
    y_register (
        .clock   ( clock   ),
        .reset   ( reset   ),
        .load    ( load_y  ),
        .data_in ( SW[8:1] ),
        .data_out( y_bus   )
    );
    
    //carry in synchronization
    unit_delay
    # ( .WIDTH( 1 ) )
    carry_in_register (
        .clock   ( clock         ),
        .data_in ( SW[ 0 ]       ),
        .data_out( carry_in_wire )
    );
    
    //adder
    prefix_adder
    #( .LEVELS(3), .WIDTH(8) )
    PA_dut
    (
        .carry_in ( carry_in_wire  ),
        .x        ( x_bus          ),
        .y        ( y_bus          ),
        .z        ( z_bus          ),
        .carry_out( carry_out_wire )
    );
    
    //adder result synchronization
    unit_delay
    # ( .WIDTH( 8 ) )
    z_register (
        .clock   ( clock     ),
        .data_in ( z_bus     ),
        .data_out( LEDR[7:0] )
    );
    
    //carry out synchronization
    unit_delay
    # ( .WIDTH( 1 ) )
    carry_out_register (
        .clock   ( clock          ),
        .data_in ( carry_out_wire ),
        .data_out( LEDR[9]        )
    ); 
        
    assign LEDR[8] = 0;
    
endmodule