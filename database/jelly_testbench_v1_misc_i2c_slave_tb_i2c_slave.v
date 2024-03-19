
`timescale 1ns / 1ps
`default_nettype none


module tb_i2c_slave();
    localparam RATE = 1000.0/100.0;
    
    initial begin
        $dumpfile("tb_i2c_slave.vcd");
        $dumpvars(0, tb_i2c_slave);
        
//      #200000;
//          $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    wire    i2c_scl;
    wire    i2c_sda;
    
    pullup(i2c_scl);
    pullup(i2c_sda);
    
    
    
    wire    i2c_scl_i;
    wire    i2c_scl_t;
    wire    i2c_sda_i;
    wire    i2c_sda_t;
    
    wire            bus_en;
    wire            bus_start;
    wire            bus_rw;
    wire    [7:0]   bus_wdata;
    wire    [7:0]   bus_rdata;
    
    jelly_i2c_slave
            #(
                .DIVIDER_WIDTH  (6),
                .DIVIDER_COUNT  (63)
            )
        i_i2c_slave
            (
                .reset          (reset),
                .clk            (clk),
                
                .addr           (7'h50),
                
                .i2c_scl_i      (i2c_scl_i),
                .i2c_scl_t      (i2c_scl_t),
                .i2c_sda_i      (i2c_sda_i),
                .i2c_sda_t      (i2c_sda_t),
                
                .bus_en         (bus_en),
                .bus_start      (bus_start),
                .bus_rw         (bus_rw),
                .bus_wdata      (bus_wdata),
                .bus_rdata      (bus_rdata)
            );
    
    reg     [6:0]   reg_edid_addr;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_edid_addr <= 0;
        end
        else begin
            if ( bus_en && !bus_start ) begin
                if ( bus_rw == 1'b0 ) begin
                    reg_edid_addr <= bus_wdata;
                end
                else begin
                    reg_edid_addr <= reg_edid_addr + 1;
                end
            end
            
        end
    end
    
    edid_rom
        i_edid_rom
            (
                .clk        (clk),
                .en         (1'b1),
                .addr       (reg_edid_addr),
                .dout       (bus_rdata)
            );
    
    
    IOBUF   iobuf_scl (.IO(i2c_scl), .O(i2c_scl_i), .I(1'b0), .T(i2c_scl_t));
    IOBUF   iobuf_sda (.IO(i2c_sda), .O(i2c_sda_i), .I(1'b0), .T(i2c_sda_t));
    
    
    
    reg     reg_scl = 1'b1;
    reg     reg_sda = 1'b1;
    assign i2c_scl = reg_scl ? 1'bz : 1'b0;
    assign i2c_sda = reg_sda ? 1'bz : 1'b0;
    
    initial begin
            reg_scl = 1'b1;
            reg_sda = 1'b1;
        #100000
        
            // start condition
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b0;
        
            // d7
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d6
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d5
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d4
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d3
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d2
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d1
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d0 (rw)
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // ack
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
        
        
        
        #10000
        
            // d7
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d6
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d5
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d4
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d3
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d2
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d1
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d0
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // ack
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // stop condition
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_sda = 1'b1;
        
        
        ///////////////////////
        
                    // start condition
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b0;
        
            // d7
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d6
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d5
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d4
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d3
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d2
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d1
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d0 (rw)
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // ack
        #10000
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
        
        
        #10000
        
            // d7
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d6
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d5
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d4
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d3
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d2
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d1
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d0
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // ack
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
        
        
            // d7
            reg_sda = 1'b1;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d6
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d5
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
            
            // d4
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d3
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d2
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d1
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;

            // d0
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
            // ack
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_scl = 1'b0;
        
        
            // stop condition
        #10000
            reg_sda = 1'b0;
        #10000
            reg_scl = 1'b1;
        #10000
            reg_sda = 1'b1;
    
        
        
        #100000
            $finish;
    end
    
    
endmodule


`default_nettype wire


// end of file
