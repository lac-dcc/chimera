module vgagfx(input  clk,      // system clock (100mhz)
              input         rst,
              
              input         clk25mhz, // vga pixel clock (25.13MHz)
              
              input [7:0]   vmem_data,
              output [19:0] vmem_addr,

              output        scan,
              
              // Monochrome VGA pins
              output        hsync,
              output        vsync,
              output [3:0]  rgb    // monochrome output, all three channels 0 or 1
              );

   // Pixels are fed via a small FIFO
   
   reg                   fifo_en;
   reg                   fifo_rd;
   
   wire [7:0]            fifo_in;
   wire                  fifo_full;
   wire [7:0]            fifo_out;
   wire                  fifo_empty;

   reg [19:0]            vmpos;
   
   assign vmem_addr = vmpos;
   assign fifo_in = vmem_data;
   
   parameter VMEM_END = 640*480/2 - 1;

   smallfifo1 fifo1(.rst(rst),
                   
                    .clk_in(clk),
                    .fifo_in(fifo_in),
                    .fifo_en(fifo_en),
                    .fifo_full(fifo_full),
                    
                    .clk_out(clk25mhz),
                    .fifo_out(fifo_out),
                    .fifo_empty(fifo_empty),
                    .fifo_rd(fifo_rd));

   // Just feed the FIFO with vmem contents
   always @(posedge clk)
     if (!rst) begin
        fifo_en <= 0;
        vmpos <= 0;
     end else begin // if (!rst)
        if (!fifo_full && !fifo_en) begin 
           if (vmpos < VMEM_END) vmpos <= vmpos + 1;
           else vmpos <= 0;
           fifo_en <= 1;
        end else fifo_en <= 0;
     end

   //// bang pixels
   reg [9:0] hcounter;
   reg [9:0] vcounter;
   reg       ready;
   wire      visible;

   parameter hlen = 640;
   parameter hpulse = 96;
   parameter hfp = 16;
   parameter hbp = 48;
   parameter vlen = 480;
   parameter vfp = 10;
   parameter vbp = 33;
   parameter vpulse = 2;

   parameter hlen1 = hlen + hpulse + hfp + hbp;
   parameter vlen1 = vlen + vpulse + vfp + vbp;
   
  
   assign hsync = ~((hcounter > hlen+hfp) & (hcounter < hlen+hfp+hpulse));
   assign vsync = ~((vcounter > vlen+vfp) & (vcounter < vlen+vfp+vpulse));

   assign scan = vcounter == 0;
   
   assign visible = (hcounter < hlen)&&(vcounter < vlen);
   
   always @(posedge clk25mhz)
     if (!rst || !ready) begin // only start banging when there are some bits queued already
        vcounter <= 0;
        hcounter <= 0;
     end else begin
        if (hcounter >= hlen1-1) begin
           hcounter <= 0;
           if (vcounter >= vlen1-1)
             vcounter <= 0;
           else
             vcounter <= vcounter + 1;
        end else hcounter <= hcounter + 1;
     end // else: !if(!rst)

   // While in a visible area, keep sucking bits from the fifo, hoping it is being well fed
   // on the other side.
   reg [7:0] out_current;
   reg [7:0] out_next;
   
   wire [3:0] nextbit;
   assign nextbit = out_current[7:4];
   assign rgb = visible?nextbit:4'b0;
   
   reg [1:0] bitcount;

   // What a mess!!!
   always @(posedge clk25mhz)
     if (!rst) begin
        bitcount <= 0;
        out_current <= 0;
        out_next <= 0;
        ready <= 0;
        fifo_rd <= 0;
     end else begin
        if (!ready) begin
           if (fifo_rd) begin
              fifo_rd <= 0;
              out_current <= fifo_out;
              ready <= 1;
	      bitcount <= 0;
           end else fifo_rd <= 1;
        end else
          if (visible) begin
             if (bitcount == 0) begin
                bitcount <= 1;
                out_current <= out_current << 4;
                fifo_rd <= 1;
             end else begin
                fifo_rd <= 0;
                out_current <= out_next;
                out_next <= fifo_out;
                bitcount <= 0;
             end
	  end else begin
             fifo_rd <= 0; // if (visible)
             bitcount <= 0;
          end
     end
   
endmodule
