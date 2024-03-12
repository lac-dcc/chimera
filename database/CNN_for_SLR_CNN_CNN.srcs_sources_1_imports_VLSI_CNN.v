`timescale 1ns / 1ps

module CNN(
    input clk,
    input reset,
    output signed [39:0] CNN_output,
    output write_strobe
    );
    
    //==========================================================\\
    //           Wire and Register Declarations                 \\
    //==========================================================\\
    // CONV1
    wire [7:0] R, G, B;
    reg  wea = 1'b0;
    wire [11:0] addra;
    wire [22:0] conv1_output; //output of CONV1
    wire ws;
    reg conv1_start = 1'b1;
    wire conv1_done;
    // RELU1
    wire ws_relu;
    wire relu1_done;
    wire [21:0] relu1_output; //relu output

    // MAXPOOL1
    wire [3:0]  mx_done;
    wire [3:0]  BR_count;
    wire [21:0] mx1_output;
    reg signed [21:0] mx1_output_reg;    
    reg         flag; // check to see if BR_count is on track
    reg         FULL;
    
    // CONV2
    wire [21:0] G1, G2, G3, G4, G5, G6, G7, G8; 
    reg  [6:0]  addrb;
    wire [5:0]  addr;
    reg  [11:0]  addr_reg;
    reg  read_strobe;
    reg  write_strobe_1,write_strobe_2,write_strobe_3,write_strobe_4,write_strobe_5,write_strobe_6,write_strobe_7,write_strobe_8;
    reg enb;
    reg conv2_start = 0;
    wire conv2_done;
    wire [5:0]  addr_conv2;
    wire [35:0] conv2_out;
    wire ws_conv2;
    
    // RELU2
    wire [35:0] relu2_out;
    wire ws_relu2;
    wire conv2_done2;
    wire relu2_done;
    
    // MAXPOOL2
    wire [1:0] mx2_done;
    wire [3:0] mx2_count;
    wire [35:0] mx2_output;
    
    // FC
    reg [35:0] FC_input;
    reg [5:0] FC_count = 6'h3f;
    reg [3:0] FC_read = 4'hf;
    reg FC_start;
    wire signed [39:0] FC_output;
    wire FC_done;
    reg ws_FC = 1'b0;
    reg ws_FC_done = 1'b0;
    reg [4:0] ws_FC_count = 5'd0;
    
    //==========================================================\\
    //    Block Memories for CONV1 8-bit data, 12-bit address   \\
    //==========================================================\\
    BM_image_R image_R (
      .clka(clk),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [11 : 0] addra
      //.dina(dina),    // input wire [7 : 0] dina
      .douta(R)  // output wire [7 : 0] douta
      //.clkb(clkb),    // input wire clkb
      //.web(web),      // input wire [0 : 0] web
      //.addrb(addrb),  // input wire [11 : 0] addrb
      //.dinb(dinb),    // input wire [7 : 0] dinb
      //.doutb(doutb)  // output wire [7 : 0] doutb
    );
    
    BM_image_G image_G (
      .clka(clk),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [11 : 0] addra
//      .dina(dina),    // input wire [7 : 0] dina
      .douta(G)  // output wire [7 : 0] douta
//      .clkb(clkb),    // input wire clkb
//      .web(web),      // input wire [0 : 0] web
//      .addrb(addrb),  // input wire [11 : 0] addrb
//      .dinb(dinb),    // input wire [7 : 0] dinb
//      .doutb(doutb)  // output wire [7 : 0] doutb
    );
    
    BM_image_B image_B (
      .clka(clk),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [11 : 0] addra
//      .dina(dina),    // input wire [7 : 0] dina
      .douta(B)  // output wire [7 : 0] douta
//      .clkb(clkb),    // input wire clkb
//      .web(web),      // input wire [0 : 0] web
//      .addrb(addrb),  // input wire [11 : 0] addrb
//      .dinb(dinb),    // input wire [7 : 0] dinb
//      .doutb(doutb)  // output wire [7 : 0] doutb
    );
    
    CONV1 conv1( .addr(addra), .clk(clk), .reset(reset), .R(R), .G(G), .B(B), .conv1_output(conv1_output), .ws(ws), .done(conv1_done));
    RELU1 relu1( .a(conv1_output), .clk(clk), .enable(conv1_done), .read_strobe(ws), .out(relu1_output), .write_strobe(ws_relu), .done(relu1_done));
    MAXPOOL1 maxpool1( .y(relu1_output), .clk(clk), .enable(relu1_done), .read_strobe(ws_relu), .reset(reset), .mx_done(mx_done), .addr(addr), .z(mx1_output), .BR_count(BR_count));
    CONV2 conv2( .G1(G1), .G2(G2), .G3(G3), .G4(G4), .G5(G5), .G6(G6), .G7(G7), .G8(G8), .clk(clk), .reset(reset), .addr(addr_conv2), .y(conv2_out), .enable(conv2_start), .conv2_done(conv2_done), .write_strobe(ws_conv2), .done(conv2_done2));    
    RELU2 relu2( .a(conv2_out), .clk(clk), .enable(conv2_done2), .read_strobe(ws_conv2), .out(relu2_out), .write_strobe(ws_relu2), .done(relu2_done));
    MAXPOOL2 maxpool2( .mx2_input(relu2_out), .clk(clk), .enable(relu2_done), .reset(reset), .read_strobe(ws_relu2), .mx2_done(mx2_done), .mx2_count(mx2_count), .mx2_output(mx2_output));
    FC_LAYER FC( .A(FC_input), .CLK(clk), .ENABLE(FC_start), .RST(reset), .COUNT(FC_count), .READ(FC_read), .OUT_PORT(FC_output), .DONE(FC_done));
    assign CNN_output = FC_output;
    assign write_strobe = ws_FC;
    
    //==========================================================\\
    //                  Fully Connected Control                 \\
    //==========================================================\\
    always @ (posedge clk)
    begin
        if( mx2_done > 0)
        begin
            FC_input <= mx2_output;
            if(reset || FC_count == 63) FC_count <= 4'd0;
            else FC_count <= FC_count + 1;
            FC_start <= 1;
        end else FC_start <= 0;
    end
    
    //==========================================================\\
    //        Fully Connected Write Strobe Control              \\
    //==========================================================\\
    always @ (posedge clk) //writestrobe FC
    begin
        if(FC_done)
        begin
            if ( ws_FC_count == 0 ) begin ws_FC <= 0; FC_read<=0; ws_FC_count <= ws_FC_count + 1; end
            else if( ws_FC_count < 16 ) begin ws_FC_count <= ws_FC_count + 1; FC_read <= FC_read + 1; ws_FC <= 1; end
            else if ( ws_FC_count == 16) begin FC_read <= 4'hf; ws_FC <= 1; ws_FC_count <= ws_FC_count + 1; end
            else if ( ws_FC_count == 17) begin FC_read <= 4'hf; ws_FC <= 0; end
        end else begin ws_FC <= 0;ws_FC_count <= 0; end
        
    end
    
    //==============================================================\\
    // Block memories for CONV2, 8 BMG, 22-bit data, 64-bit address \\
    //==============================================================\\
    blk_mem_gen_0 bmg1 (
      .clka(clk),    // input wire clka
      .wea(write_strobe_1),    // input wire [0 : 0] wea
      .addra(addr),  // input wire [5 : 0] addra
      .dina(mx1_output_reg),    // input wire [21 : 0] dina
      //.douta(G1),  // output wire [21 : 0] douta
      .clkb(clk),    // input wire clkb
      //.web(read_strobe),      // input wire [0 : 0] web
      .enb(enb),      // input wire enb
      .addrb(addr_conv2),  // input wire [5 : 0] addrb
      //.dinb(dinb),    // input wire [21 : 0] dinb
      .doutb(G1)  // output wire [21 : 0] doutb
    );

    blk_mem_gen_0 bmg2 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_2),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(read_strobe),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G2)  // output wire [21 : 0] doutb
        );
    
    blk_mem_gen_0 bmg3 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_3),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(read_strobe),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G3)  // output wire [21 : 0] doutb
        );
    
    blk_mem_gen_0 bmg4 (
      .clka(clk),    // input wire clka
      .wea(write_strobe_4),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [5 : 0] addra
      .dina(mx1_output_reg),    // input wire [21 : 0] dina
      //.douta(douta),  // output wire [21 : 0] douta
      .clkb(clk),    // input wire clkb
      //.web(read_strobe),      // input wire [0 : 0] 
      .enb(enb),      // input wire enb
      .addrb(addr_conv2),  // input wire [5 : 0] addrb
      //.dinb(dinb),    // input wire [21 : 0] dinb
      .doutb(G4)  // output wire [21 : 0] doutb
    );
    
    blk_mem_gen_0 bmg5 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_5),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(read_strobe),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G5)  // output wire [21 : 0] doutb
        );

    blk_mem_gen_0 bmg6 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_6),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(read_strobe),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G6)  // output wire [21 : 0] doutb
        );
    
    blk_mem_gen_0 bmg7 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_7),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(0),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G7)  // output wire [21 : 0] doutb
        );
    
    blk_mem_gen_0 bmg8 (
          .clka(clk),    // input wire clka
          .wea(write_strobe_8),      // input wire [0 : 0] wea
          .addra(addr),  // input wire [5 : 0] addra
          .dina(mx1_output_reg),    // input wire [21 : 0] dina
          //.douta(douta),  // output wire [21 : 0] douta
          .clkb(clk),    // input wire clkb
          //.web(0),      // input wire [0 : 0] web
          .enb(enb),      // input wire enb
          .addrb(addr_conv2),  // input wire [5 : 0] addrb
          //.dinb(dinb),    // input wire [21 : 0] dinb
          .doutb(G8)  // output wire [21 : 0] doutb
        );
          
    always @ (*)
    begin
        if (conv2_done) conv1_start <= 1'b1;
    end
       
    //==========================================================\\
    //                    MAXPOOL1 Control                      \\
    //==========================================================\\
    initial begin 
        flag <= 0;  addrb <= 0; addr_reg <= 0;  FULL <= 0; enb <= 0;
        write_strobe_1 <= 0; write_strobe_2 <= 0; write_strobe_3 <= 0; write_strobe_4 <= 0;
        write_strobe_5 <= 0; write_strobe_6 <= 0; write_strobe_7 <= 0; write_strobe_8 <= 0;
     end

    always @(posedge clk) 
    begin
 /*       if(reset) 
        begin
            flag <= 0;           addr_reg <= addr;
            write_strobe_1 <= 0; write_strobe_2 <= 0; write_strobe_3 <= 0; write_strobe_4 <= 0;
            write_strobe_5 <= 0; write_strobe_6 <= 0; write_strobe_7 <= 0; write_strobe_8 <= 0;
        end  
        else  */ 
        mx1_output_reg <= mx1_output;  ///write strobe ile z nin degerleri ayn? anda gelsin diye
        if (!FULL)
        begin 
            if (addr_reg < 512 )
                case(BR_count)
                    0: if (mx_done)  begin write_strobe_1 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_1 <= 0;  
                    1: if (mx_done)  begin write_strobe_2 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_2 <= 0;
                    2: if (mx_done)  begin write_strobe_3 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_3 <= 0;
                    3: if (mx_done)  begin write_strobe_4 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_4 <= 0;
                    4: if (mx_done)  begin write_strobe_5 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_5 <= 0;
                    5: if (mx_done)  begin write_strobe_6 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_6 <= 0;
                    6: if (mx_done)  begin write_strobe_7 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_7 <= 0;
                    7: if (mx_done)  begin write_strobe_8 <= 1; addr_reg = addr_reg + 1; end else  write_strobe_8 <= 0;
              endcase
            else //if ( BR_count == 7 && mx_done == 8)
            begin
                write_strobe_8 <= 0;
                enb <= 1;
                //read_strobe    <= 0;           // start reading data 
                //addr_reg       <= 10'd0;       // Reset it                    
                FULL           <= 1'b1;        // Say it is full now
                //write_strobe_1 <= 0; write_strobe_2 <= 0; write_strobe_3 <= 0; write_strobe_4 <= 0;
                //write_strobe_5 <= 0; write_strobe_6 <= 0; write_strobe_7 <= 0; write_strobe_8 <= 0;
                conv2_start <= 1'b1;
                conv1_start <= 1'b0;
            end
       end
       else if (FULL)
       begin 
            if(addr_conv2 == 64)
            begin
                //enb         <= 0;
                addr_reg    <= 10'd0;
                FULL        <= 0;
                //read_strobe <= 1;             
            end
        end 
   end 
//    always @(posedge clk)
//    begin 
//    if( reset ) begin //read_strobe 1 oldu?u zaman okuyaca??z 
//        read_strobe <= 1;
//        addrb       <= -1;       
//    end
//    else if( BR_count == 7 && mx_done == 8) 
//    begin read_strobe <= 0; addrb = 0; end      
//    else if( !read_strobe ) begin
//       addrb <= addrb +1;
//       if( addrb == 63 )
//          read_strobe <= 1;   
//    end  
//    end     

endmodule
