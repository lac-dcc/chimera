`default_nettype none
module phy_sequencer(input wire clock,
                     input wire reset,
                     output reg phy_resetn,
                     output reg mdio_scl,
                     output reg mdio_sda,
                     output reg phy_init_done);
                     
                     
    reg [10:0]  phy_timer;
    reg [10:0]  mdio_timer;
    reg [31:0] mdio_message;
    reg [31:0] mdio_shreg;
    reg [5:0] mdio_bitcnt;
    reg mdio_busy;
    reg mdio_send;
    
    localparam MDIO_IDLE   = 5'b00001,
                MDIO_PRE   = 5'b00010,
                MDIO_CLOCK = 5'b00100,
                MDIO_POST  = 5'b01000;
    
    reg [4:0] mdio_state = MDIO_IDLE;
    
    always @(posedge clock) begin
        if (reset) begin
            mdio_state = MDIO_IDLE;
            mdio_busy <= 1'b0;
            mdio_scl <= 1'b0;
            mdio_sda <= 1'b1;
        end else begin
            case (mdio_state) 
                MDIO_IDLE : begin
                    mdio_busy   <= 1'b0;
                    mdio_timer  <= 10'd128;
                    mdio_bitcnt <= 6'd32;
                    mdio_shreg  <= mdio_message;
                    if (mdio_send) begin
                        mdio_busy   <= 1'b1;
                        mdio_state  <= MDIO_PRE;
                    end
                end
                MDIO_PRE : begin
                    mdio_scl   <= 1'b0;
                    mdio_sda   <= mdio_shreg[31];
                    mdio_timer <= mdio_timer - 1'b1;
                    if (mdio_timer[10]) begin
                        mdio_bitcnt <= mdio_bitcnt - 1'b1;
                        mdio_state  <= MDIO_CLOCK;
                        mdio_timer  <= 10'd256;
                    end
                end
                MDIO_CLOCK : begin
                    mdio_scl   <= 1'b1;
                    mdio_timer <= mdio_timer - 1'b1;
                    if (mdio_timer[10]) begin
                        mdio_state  <= MDIO_POST;
                        mdio_timer  <= 10'd128;
                    end
                end
                MDIO_POST : begin
                    mdio_scl   <= 1'b0;
                    mdio_timer <= mdio_timer - 1'b1;
                    if (mdio_timer[10]) begin
                        mdio_shreg <= {mdio_shreg[30:0],1'b0};
                        mdio_timer  <= 10'd128;
                        if (mdio_bitcnt != 0) begin
                            mdio_state <= MDIO_PRE;
                        end else begin
                            mdio_sda   <= 1'b1;
                            mdio_state <= MDIO_IDLE;
                        end
                    end     
                end
            endcase
        end
    end
    
    reg [4:0] phy_state;
    
    localparam PHY_RESET = 5'b00001,
               PHY_POSTRESET = 5'b00010,
               PHY_MDIO_PREAMBLE = 5'b00100,
               PHY_MDIO_INIT = 5'b01000,
               PHY_MDIO_DONE = 5'b10000;
    
    localparam REG_0_PHY_RESET = 1'b1,
               REG_0_INTERNAL_LOOPBACK = 1'b1,
               REG_0_SPEED_1000MBPS = 2'b10,
               REG_0_AUTO_NEGOTIATION = 1'b1,
               REG_0_POWER_DOWN = 1'b1,
               REG_0_ISOLATE = 1'b1,
               REG_0_RESTART_AUTONEGOTIATION = 1'b1,
               REG_0_FULL_DUPLEX = 1'b1,
               REG_0_COLLISION_TEST = 1'b1;
               
    localparam REG_10_DISABLE_AUTOMATIC_MDI_CROSSOVER = 1'b1,
               REG_10_TRANSMIT_DISABLE                = 1'b1,
               REG_10_INTERRUPT_DISABLE               = 1'b1,
               REG_10_FORCE_INTERRUPT                 = 1'b1,
               REG_10_BYPASS_4B5B_DECODER             = 1'b1,
               REG_10_BYPASS_SCRAMBLER                = 1'b1,
               REG_10_BYPASS_MLT3                     = 1'b1,
               REG_10_BYPASS_SYMBOL_ALIGN             = 1'b1,
               REG_10_ENABLE_LED_TRAFFIC_MODE         = 1'b1,
               REG_10_FORCE_LEDS_ON                   = 1'b1,
               REG_10_FORCE_LEDS_OFF                  = 1'b1,
               REG_10_FIFO_ELASTICITY_HIGH_LATENCY    = 1'b1;
    
    initial phy_init_done <= 1'b0;
    
        
    localparam PHYADDR = 5'b00000;
    localparam PHYINIT = 5'd5;
    
    reg [20:0] phy_init_values [31:0];
    
    initial begin
        phy_init_values[0] = { 5'b0,
                               ~REG_0_PHY_RESET,
                               ~REG_0_INTERNAL_LOOPBACK,
                                REG_0_SPEED_1000MBPS[0],
                                REG_0_AUTO_NEGOTIATION,
                                ~REG_0_POWER_DOWN,
                                ~REG_0_ISOLATE,
                                ~REG_0_RESTART_AUTONEGOTIATION,
                                REG_0_FULL_DUPLEX,
                                ~REG_0_COLLISION_TEST,
                                REG_0_SPEED_1000MBPS[1],
                                6'b0};
        phy_init_values[1] = { 5'h10,
                                1'b0,
                                ~REG_10_DISABLE_AUTOMATIC_MDI_CROSSOVER,
                                ~REG_10_TRANSMIT_DISABLE               ,
                                REG_10_INTERRUPT_DISABLE              ,
                                ~REG_10_FORCE_INTERRUPT                ,
                                ~REG_10_BYPASS_4B5B_DECODER            ,
                                ~REG_10_BYPASS_SCRAMBLER               ,
                                ~REG_10_BYPASS_MLT3                    ,
                                ~REG_10_BYPASS_SYMBOL_ALIGN            ,
                                ~REG_10_ENABLE_LED_TRAFFIC_MODE        ,
                                ~REG_10_FORCE_LEDS_ON                  ,
                                ~REG_10_FORCE_LEDS_OFF                 ,
                                2'b00,
                                REG_10_FIFO_ELASTICITY_HIGH_LATENCY};
        phy_init_values[2] = { 5'h1C,
                               1'b1, // write enable
                               5'b01010, // Auto Power Down register
                               4'b0, // reserved
                               1'b0, // Disabled
                               1'b0, //Sleep timer is 2.7s
                               4'b1}; // Wakeup timer
        phy_init_values[3] = { 5'h1C,
                               1'b1,
                               5'b01011,
                               2'b00, 
                               1'b0,  // CLK125_NONRGMII_DISABLE
                               1'b0,  // SOFT-RESET disable
                               1'b0,  // Reserved
                               1'b0,  // SEL1
                               1'b0,  // SEL0
                               1'b0,  // LOM LED
                               2'b00};
        phy_init_values[4] = { 5'h09,
                               3'b0, //normal mode
                               1'b0, //auto m/s
                               1'b0, //slave
                               1'b0, // DTE
                               1'b1, // 1000 FD
                               1'b1, // 1000 HD
                               8'b0
                             };

    end
    
    reg [6:0] init_counter;
    
    
    always @(posedge clock) begin
        if (reset) begin
            phy_resetn <= 1'b0;
            phy_state  <= PHY_RESET;
            phy_timer  <= 300;
            phy_init_done = 1'b0;
            init_counter  <= 7'b0;
        end else begin
            mdio_send    <= 1'b0;
            case (phy_state)
                PHY_RESET : begin
                    phy_resetn <= 1'b0;
                    phy_timer  <= phy_timer - 11'b1;
                    if (phy_timer[10]) begin
                        phy_timer  <= 511;
                        phy_resetn <= 1'b1;
                        phy_state  <= PHY_POSTRESET;
                    end
                end
                PHY_POSTRESET : begin
                    phy_timer  <= phy_timer - 11'b1;
                    if (phy_timer[10]) begin
                        init_counter <= 7'b0;
                        mdio_message <= 32'hFFFFFFFF;
                        phy_state    <= PHY_MDIO_INIT;
                        mdio_send    <= 1'b1;
                    end
                end
                PHY_MDIO_INIT : begin
                    if (~mdio_busy & ~mdio_send) begin
                        if (init_counter == PHYINIT) begin
                            phy_state    <= PHY_MDIO_DONE;
                        end else begin
                            mdio_message <= {4'b0101,PHYADDR,phy_init_values[init_counter][20:16],2'b10,phy_init_values[init_counter][15:0]};
                            init_counter <= init_counter + 1'b1;
                            mdio_send    <= 1'b1;
                        end
                    end
                end
                PHY_MDIO_DONE : begin
                    phy_init_done <= 1'b1;
                end
            endcase
        end
    end
                     
                     
endmodule
