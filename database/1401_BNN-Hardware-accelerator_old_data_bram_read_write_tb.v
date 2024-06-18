// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

//~ `New testbench
`timescale  1ns / 1ps

module bram_read_write_tb;

    // axis_fifo_my Parameters
    parameter PERIOD                = 20                ;     
    parameter C_S_AXIS_TDATA_WIDTH  = 32                ;     
    parameter FIFO_SIZE             = 16                ;     
    parameter bit_num               = clogb2(FIFO_SIZE-1);
    parameter MAC_NUM             = 256                    ;
    parameter BRAM_ADDRESS_WIDTH  = 12                     ;     

    // axis_fifo_my Inputs
    reg   read_want                            = 0 ;
    reg   clk                          = 0 ;
    reg   rst_n                       = 0 ;
    reg   [C_S_AXIS_TDATA_WIDTH-1 : 0]  S_AXIS_TDATA = 0 ;    
    reg   [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0]  S_AXIS_TSTRB = 0 ;
    reg   S_AXIS_TLAST                         = 0 ;
    reg   S_AXIS_TVALID                        = 0 ;

    reg write_en=0;
    reg transfer_start=0;
    reg bram_control_add1=0;
    reg bram_control_add2=0;
    reg port_sel=0;

    // axis_fifo_my Outputs
    wire  [C_S_AXIS_TDATA_WIDTH-1 : 0]  data_out ;
    wire  out_valid                            ;
    wire  fifo_full                            ;
    wire  fifo_empty                           ;
    wire  [bit_num:0]  fifo_cnt                ;
    wire  S_AXIS_TREADY                        ;

    wire  [5*MAC_NUM-1:0]  weight_out          ;
    wire  [5*MAC_NUM-1:0]  weight_to_bram_A    ;
    wire  [5*MAC_NUM-1:0]  weight_to_bram_B    ;
    wire  [BRAM_ADDRESS_WIDTH-1:0]  bram_address_A ;        
    wire  [BRAM_ADDRESS_WIDTH-1:0]  bram_address_B ;        
    wire  bram_A_en                            ;
    wire  bram_B_en                            ;
    wire  bram_A_wen                           ;
    wire  bram_B_wen                           ;
    wire  weight_from_bram_valid               ;
    wire  axis_fifo_read                       ;

    wire   [5*MAC_NUM-1:0]  weight_from_bram_A   ;        
    wire   [5*MAC_NUM-1:0]  weight_from_bram_B   ;

    function integer clogb2 (input integer bit_depth);
	  begin
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
	      bit_depth = bit_depth >> 1;
	  end
	endfunction

    initial
    begin
        forever #(PERIOD/2)  clk=~clk;
    end

    initial begin
        $fsdbDumpfile("bram_read_write_wave1.fsdb");
        $fsdbDumpvars(0);   
    end

    initial
    begin
        #(PERIOD*2) rst_n  =  1;
        #(PERIOD*5);
        write_en=1;
        fifo_in(1);
        fifo_in(2);
        fifo_in(3);
        transfer_start=1;
        #(PERIOD*1);
        transfer_start=0;
        fifo_in(4);
        #(PERIOD*20);
        fifo_in(5);
        fifo_in(6);
        fifo_in(7);
        fifo_in(8);
        fifo_in(9);
        fifo_in(10);
        #(PERIOD*8);
        fifo_in(11);
        #(PERIOD*20);
        fifo_in(12);
        #(PERIOD*3);
        fifo_in(13);
        #(PERIOD*3);
        fifo_in(14);
        #(PERIOD*20);
        write_en=0;
        transfer_start=1;
        #(PERIOD*1);
        transfer_start=0;

        port_sel=0;
        wait(weight_from_bram_valid) 
        bram_control_add2=1;
        #(PERIOD*2)
        bram_control_add2=0;
        #(PERIOD*1)
        port_sel=1;
        #(PERIOD*1)

        port_sel=0;
        wait(weight_from_bram_valid) 
        bram_control_add2=1;
        #(PERIOD*2)
        bram_control_add2=0;
        #(PERIOD*1)
        port_sel=1;
        #(PERIOD*1)

        port_sel=0;
        wait(weight_from_bram_valid) 
        bram_control_add2=1;
        #(PERIOD*2)
        bram_control_add2=0;
        #(PERIOD*1)
        port_sel=1;
        #(PERIOD*1)

        port_sel=0;
        wait(weight_from_bram_valid) 
        bram_control_add2=1;
        #(PERIOD*2)
        bram_control_add2=0;
        #(PERIOD*1)
        port_sel=1;
        #(PERIOD*1)

        port_sel=0;
        wait(weight_from_bram_valid) 
        bram_control_add2=1;
        #(PERIOD*2)
        bram_control_add2=0;
        #(PERIOD*1)
        port_sel=1;
        #(PERIOD*1)



        #100000;
        $finish;
    end

    axis_fifo_my #(
        .C_S_AXIS_TDATA_WIDTH ( C_S_AXIS_TDATA_WIDTH ),
        .FIFO_SIZE            ( FIFO_SIZE            ),
        .bit_num              ( bit_num              ))
    u_axis_fifo_my (
        .read_want               ( axis_fifo_read                                   ),
        .S_AXIS_ACLK             ( clk                                              ),
        .S_AXIS_ARESETN          ( rst_n                                            ),
        .S_AXIS_TDATA            ( S_AXIS_TDATA    [C_S_AXIS_TDATA_WIDTH-1 : 0]     ),
        .S_AXIS_TSTRB            ( S_AXIS_TSTRB    [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] ),
        .S_AXIS_TLAST            ( S_AXIS_TLAST                                     ),
        .S_AXIS_TVALID           ( S_AXIS_TVALID                                    ),

        .data_out                ( data_out        [C_S_AXIS_TDATA_WIDTH-1 : 0]     ),
        .out_valid               ( out_valid                                        ),
        .fifo_full               ( fifo_full                                        ),
        .fifo_empty              ( fifo_empty                                       ),
        .fifo_cnt                ( fifo_cnt        [bit_num:0]                      ),
        .S_AXIS_TREADY           ( S_AXIS_TREADY                                    )
    );

    bram_control_test 
    #(
        .MAC_NUM            (MAC_NUM            ),
        .BRAM_ADDRESS_WIDTH (BRAM_ADDRESS_WIDTH ),
        .AXIS_FIFO_SIZE     (FIFO_SIZE          ),
        .bit_num            (bit_num            )
    )
    u_bram_control_test(
    	.clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .axi_in                 (data_out               ),
        .weight_from_bram_A     (weight_from_bram_A     ),
        .weight_from_bram_B     (weight_from_bram_B     ),
        .weight_out             (weight_out             ),
        .weight_to_bram_A       (weight_to_bram_A       ),
        .weight_to_bram_B       (weight_to_bram_B       ),
        .bram_address_A         (bram_address_A         ),
        .bram_address_B         (bram_address_B         ),
        .bram_A_en              (bram_A_en              ),
        .bram_B_en              (bram_B_en              ),
        .bram_A_wen             (bram_A_wen             ),
        .bram_B_wen             (bram_B_wen             ),
        .write_en               (write_en               ),//
        .axis_fifo_cnt          (fifo_cnt               ),
        .transfer_start         (transfer_start         ),//
        .bram_control_add1      (bram_control_add1      ),//
        .bram_control_add2      (bram_control_add2      ),//
        .port_sel               (port_sel               ),//
        .weight_from_bram_valid (weight_from_bram_valid ),
        .axis_fifo_read         (axis_fifo_read         )
    );


    design_1_wrapper u_BRAM(
        //control
        .BRAM_PORTA_0_clk        (clk                ),
        .BRAM_PORTB_0_clk        (clk                ),
        //data
        .BRAM_PORTA_0_dout       (weight_from_bram_A ),
        .BRAM_PORTB_0_dout       (weight_from_bram_B ),
        .BRAM_PORTA_0_din        (weight_to_bram_A   ),
        .BRAM_PORTB_0_din        (weight_to_bram_B   ),
        //BRAM control
        .BRAM_PORTA_0_addr       (bram_address_A     ),
        .BRAM_PORTB_0_addr       (bram_address_B     ),
        .BRAM_PORTA_0_en         (bram_A_en          ),
        .BRAM_PORTB_0_en         (bram_B_en          ),
        .BRAM_PORTA_0_we         (bram_A_wen         ),
        .BRAM_PORTB_0_we         (bram_B_wen         )
    );

    task fifo_in(input [31:0] data);begin    
        if(!fifo_full)begin
            S_AXIS_TVALID=1'd1; 
            S_AXIS_TDATA = data;
            #20
            S_AXIS_TVALID=1'd0; 
        end
        else begin
            $monitor($time,,"fifo is full");
        end

    end
    endtask 

    task fifo_read;begin
        read_want=1'd1;
        #20
        read_want=1'd0;
    end
    endtask

    task fifo_read_write(input [31:0] data);begin
        S_AXIS_TVALID=1'd1; 
        S_AXIS_TDATA = data;
        read_want=1'd1;
        #20
        S_AXIS_TVALID=1'd0;
        read_want=1'd0;
    end
    endtask
    
endmodule