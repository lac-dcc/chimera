module apu(
    clock25mhz, clock12500khz, clockgb, hard_resetn, resetn,
    address, indata, outdata, load, store,

    //////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK
);

input clock25mhz;
input clock12500khz;
input clockgb;
input hard_resetn;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

//////////// Audio //////////
input AUD_ADCDAT;
inout AUD_ADCLRCK;
inout AUD_BCLK;
output AUD_DACDAT;
inout AUD_DACLRCK;
output AUD_XCK;

reg [7:0] mix;

always @(*) begin
    mix = 0;
    
    if (nr52[7]) begin
        mix = mix + nr4_output;
        mix = mix + nr3_output;
        mix = mix + nr2_output;
        mix = mix + nr1_output;
    end
end

audio audio(
    clock25mhz, clock12500khz, hard_resetn,
    {mix, 16'b0},

    //////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK
);

// APU specific clocks
wire clock256hz;
wire clock128hz;
wire clock64hz;

div #(15625) div256hz(clockgb, clock256hz);
div #(31250) div128hz(clockgb, clock128hz);
div #(62500) div64hz(clockgb, clock64hz);


// Sound channel generation
reg [15:0] nr1_timer;
reg [3:0] nr1_counter;
reg [5:0] nr1_length;
reg [3:0] nr1_envelope;
reg [2:0] nr1_envcount;
reg [7:0] nr1_wave;
reg [7:0] nr1_output;

always @(*) begin
    case (nr1[1][7:6])
    0: nr1_wave = 8'b00000001;
    1: nr1_wave = 8'b10000001;
    2: nr1_wave = 8'b10000111;
    3: nr1_wave = 8'b01111110;
    endcase
    
    if (!nr1[4][6] || nr1_length != 0) begin
        if (nr1_wave[7-nr1_counter]) begin
            nr1_output = nr1_envelope;
        end else begin
            nr1_output = 0;
        end
    end else begin
        nr1_output = 0;
    end
end

always @(posedge clockgb or negedge resetn or posedge nr1_reset) begin
    if (!resetn || nr1_reset) begin
        nr1_timer <= 0;
    end else begin
        if (nr1_timer == 0) begin
            nr1_timer <= {-{nr1[4][2:0], nr1[3][7:0]}, 2'b0};
            nr1_counter <= nr1_counter + 1'b1;
        end else begin
            nr1_timer <= nr1_timer - 1'b1;
        end
    end
end

always @(posedge clock256hz or negedge resetn or posedge nr1_reset or posedge nr1_length_reset) begin
    if (!resetn || nr1_reset) begin
        nr1_length <= -nr1[1][5:0];
    end else if (nr1_length_reset) begin
        nr1_length <= -nr1_indata[5:0];
    end else begin
        if (nr1[4][6] && nr1_length != 0) begin
            nr1_length <= nr1_length - 1'b1;
        end
    end
end

always @(posedge clock64hz or negedge resetn or posedge nr1_reset or posedge nr1_envelope_reset) begin
    if (!resetn || nr1_reset) begin
        nr1_envelope <= nr1[2][7:4];
        nr1_envcount <= nr1[2][2:0];
    end else if (nr1_envelope_reset) begin
        nr1_envelope <= nr1_indata[7:4];
        nr1_envcount <= nr1_indata[2:0];
    end else if (nr1[2][2:0] != 0) begin
        if (nr1_envcount == 0) begin
            nr1_envcount <= nr1[2][2:0];
            
            if (nr1[2][3]) begin
                if (nr1_envelope < 4'd15) begin
                    nr1_envelope = nr1_envelope + 1'b1;
                end
            end else begin
                if (nr1_envelope > 4'd0) begin
                    nr1_envelope = nr1_envelope - 1'b1;
                end
            end
        end else begin
            nr1_envcount <= nr1_envcount - 1'b1;
        end
    end
end


reg [15:0] nr2_timer;
reg [3:0] nr2_counter;
reg [5:0] nr2_length;
reg [3:0] nr2_envelope;
reg [2:0] nr2_envcount;
reg [7:0] nr2_wave;
reg [7:0] nr2_output;

always @(*) begin
    case (nr2[1][7:6])
    0: nr2_wave = 8'b00000001;
    1: nr2_wave = 8'b10000001;
    2: nr2_wave = 8'b10000111;
    3: nr2_wave = 8'b01111110;
    endcase

    if (!nr2[4][6] || nr2_length != 0) begin
        if (nr2_wave[7-nr2_counter]) begin
            nr2_output = nr2_envelope;
        end else begin
            nr2_output = 0;
        end
    end else begin
        nr2_output = 0;
    end
end

always @(posedge clockgb or negedge resetn or posedge nr2_reset) begin
    if (!resetn || nr2_reset) begin
        nr2_timer <= 0;
    end else begin
        if (nr2_timer == 0) begin
            nr2_timer <= {-{nr2[4][2:0], nr2[3][7:0]}, 2'b0};
            nr2_counter <= nr2_counter + 1'b1;
        end else begin
            nr2_timer <= nr2_timer - 1'b1;
        end
    end
end

always @(posedge clock256hz or negedge resetn or posedge nr2_reset or posedge nr2_length_reset) begin
    if (!resetn || nr2_reset) begin
        nr2_length <= -nr2[1][5:0];
    end else if (nr2_length_reset) begin
        nr2_length <= -nr2_indata[5:0];
    end else begin
        if (nr2[4][6] && nr2_length != 0) begin
            nr2_length <= nr2_length - 1'b1;
        end
    end
end

always @(posedge clock64hz or negedge resetn or posedge nr2_reset or posedge nr2_envelope_reset) begin
    if (!resetn || nr2_reset) begin
        nr2_envelope <= nr2[2][7:4];
        nr2_envcount <= nr2[2][2:0];
    end else if (nr2_envelope_reset) begin
        nr2_envelope <= nr2_indata[7:4];
        nr2_envcount <= nr2_indata[2:0];
    end else if (nr2[2][2:0] != 0) begin
        if (nr2_envcount == 0) begin
            nr2_envcount <= nr2[2][2:0];
            
            if (nr2[2][3]) begin
                if (nr2_envelope < 4'd15) begin
                    nr2_envelope = nr2_envelope + 1'b1;
                end
            end else begin
                if (nr2_envelope > 4'd0) begin
                    nr2_envelope = nr2_envelope - 1'b1;
                end
            end
        end else begin
            nr2_envcount <= nr2_envcount - 1'b1;
        end
    end
end


reg [15:0] nr3_timer;
reg [4:0] nr3_counter;
reg [7:0] nr3_length;
reg [2:0] nr3_shift;
reg [7:0] nr3_output;

always @(*) begin
    case (nr3[2][6:5])
    0: nr3_shift = 3'd4;
    1: nr3_shift = 3'd0;
    2: nr3_shift = 3'd1;
    3: nr3_shift = 3'd2;
    endcase

    if ((!nr3[4][6] || nr3_length != 0) && nr3[0][7]) begin
        nr3_output = wave_table[nr3_counter] >> nr3_shift;
    end else begin
        nr3_output = 0;
    end
end

always @(posedge clockgb or negedge resetn or posedge nr3_reset) begin
    if (!resetn || nr3_reset) begin
        nr3_timer <= 0;
    end else begin
        if (nr3_timer == 0) begin
            nr3_timer <= {-{nr3[4][2:0], nr3[3][7:0]}, 1'b0};
            nr3_counter <= nr3_counter + 1'b1;
        end else begin
            nr3_timer <= nr3_timer - 1'b1;
        end
    end
end

always @(posedge clock256hz or negedge resetn or posedge nr3_reset or posedge nr3_length_reset) begin
    if (!resetn || nr3_reset) begin
        nr3_length <= -nr3[1][5:0];
    end else if (nr3_length_reset) begin
        nr3_length <= -nr3_indata[7:0];
    end else begin
        if (nr3[4][6] && nr3_length != 0) begin
            nr3_length <= nr3_length - 1'b1;
        end
    end
end


reg [15:0] nr4_timer;
reg [14:0] nr4_shift;
reg [5:0] nr4_length;
reg [3:0] nr4_envelope;
reg [2:0] nr4_envcount;
reg [7:0] nr4_div;
reg [7:0] nr4_output;

always @(*) begin
    case (nr4[3][2:0])
    0: nr4_div = 8'd8;
    1: nr4_div = 8'd16;
    2: nr4_div = 8'd32;
    3: nr4_div = 8'd48;
    4: nr4_div = 8'd64;
    5: nr4_div = 8'd80;
    6: nr4_div = 8'd96;
    7: nr4_div = 8'd112;
    endcase

    if (!nr4[4][6] || nr4_length != 0) begin
        if (~nr4_shift[0]) begin
            nr4_output = nr4_envelope;
        end else begin
            nr4_output = 0;
        end
    end else begin
        nr4_output = 0;
    end
end

always @(posedge clockgb or negedge resetn or posedge nr4_reset) begin
    if (!resetn || nr4_reset) begin
        nr4_timer <= 0;
        nr4_shift <= 15'h7fff;
    end else begin
        if (nr4_timer == 0) begin
            nr4_timer <= nr4_div << nr4[3][7:4];
            
            if (nr4[3][3]) begin
                nr4_shift <= {nr4_shift[1]^nr4_shift[0], nr4_shift[6:1]};
            end else begin
                nr4_shift <= {nr4_shift[1]^nr4_shift[0], nr4_shift[14:1]};
            end
        end else begin
            nr4_timer <= nr4_timer - 1'b1;
        end
    end
end

always @(posedge clock256hz or negedge resetn or posedge nr4_reset or posedge nr4_length_reset) begin
    if (!resetn || nr4_reset) begin
        nr4_length <= -nr4[1][5:0];
    end else if (nr4_length_reset) begin
        nr4_length <= -nr4_indata[5:0];
    end else begin
        if (nr4[4][6] && nr4_length != 0) begin
            nr4_length <= nr4_length - 1'b1;
        end
    end
end

always @(posedge clock64hz or negedge resetn or posedge nr4_reset or posedge nr4_envelope_reset) begin
    if (!resetn || nr4_reset) begin
        nr4_envelope <= nr4[2][7:4];
        nr4_envcount <= nr4[2][2:0];
    end else if (nr4_envelope_reset) begin
        nr4_envelope <= nr4_indata[7:4];
        nr4_envcount <= nr4_indata[2:0];
    end else if (nr4[2][2:0] != 0) begin
        if (nr4_envcount == 0) begin
            nr4_envcount <= nr4[2][2:0];
            
            if (nr4[2][3]) begin
                if (nr4_envelope < 4'd15) begin
                    nr4_envelope = nr4_envelope + 1'b1;
                end
            end else begin
                if (nr4_envelope > 4'd0) begin
                    nr4_envelope = nr4_envelope - 1'b1;
                end
            end
        end else begin
            nr4_envcount <= nr4_envcount - 1'b1;
        end
    end
end



reg [7:0] nr1 [5];
reg [7:0] nr2 [5];
reg [7:0] nr3 [5];
reg [7:0] nr4 [5];

reg [3:0] wave_table [32];

reg [7:0] nr50;
reg [7:0] nr51;
reg [7:0] nr52;

always @(posedge clockgb or negedge resetn) begin
    integer i;
    
    if (!resetn) begin
        nr1[0] <= 8'h80;
        nr1[1] <= 8'hbf;
        nr1[2] <= 8'hf3;
        nr1[3] <= 8'h00;
        nr1[4] <= 8'hb0;
        nr2[0] <= 8'h00;
        nr2[1] <= 8'h3f;
        nr2[2] <= 8'h00;
        nr2[3] <= 8'h00;
        nr2[4] <= 8'hb0;
        nr3[0] <= 8'h7f;
        nr3[1] <= 8'hff;
        nr3[2] <= 8'h9f;
        nr3[3] <= 8'hbf;
        nr3[4] <= 8'h00;
        nr4[0] <= 8'h00;
        nr4[1] <= 8'hff;
        nr4[2] <= 8'h00;
        nr4[3] <= 8'h00;
        nr4[4] <= 8'h00;
        
        nr50 <= 8'hff;
        nr51 <= 8'hff;
        nr52 <= 8'hf1;
    end else begin
        if (nr1_store) begin
            nr1[nr1_address] <= nr1_indata;
        end        
        if (nr2_store) begin
            nr2[nr2_address] <= nr2_indata;
        end
        if (nr3_store) begin
            nr3[nr3_address] <= nr3_indata;
        end
        if (nr4_store) begin
            nr4[nr4_address] <= nr4_indata;
        end
        if (wave_store) begin
            wave_table[wave_address  ] <= wave_indata[7:4];
            wave_table[wave_address+1] <= wave_indata[3:0];
        end
        if (nr50_store) begin
            nr50 <= nr50_indata;
        end
        if (nr51_store) begin
            nr51 <= nr51_indata;
        end
        if (nr52_store) begin
            nr52 <= nr52_indata;
        end
    end
end

reg nr1_reset;
reg nr2_reset;
reg nr3_reset;
reg nr4_reset;
reg nr1_length_reset;
reg nr2_length_reset;
reg nr3_length_reset;
reg nr4_length_reset;
reg nr1_envelope_reset;
reg nr2_envelope_reset;
reg nr4_envelope_reset;

always @(posedge clockgb) begin
    nr1_reset <= (nr1_store && nr1_address == 4 && nr1_indata[7]);
    nr2_reset <= (nr2_store && nr2_address == 4 && nr2_indata[7]);
    nr3_reset <= (nr3_store && nr3_address == 4 && nr3_indata[7]);
    nr4_reset <= (nr4_store && nr4_address == 4 && nr4_indata[7]);
    nr1_length_reset <= (nr1_store && nr1_address == 1);
    nr2_length_reset <= (nr2_store && nr2_address == 1);
    nr3_length_reset <= (nr3_store && nr3_address == 1);
    nr4_length_reset <= (nr4_store && nr4_address == 1);
    nr1_envelope_reset <= (nr1_store && nr1_address == 2);
    nr2_envelope_reset <= (nr2_store && nr2_address == 2);
    nr4_envelope_reset <= (nr4_store && nr4_address == 2);
end


wire [15:0] nr1_address;
wire [7:0] nr1_indata;
wire [7:0] nr1_data;
wire nr1_store;

rrmmap #(16'hff10, 16'hff14) nr1_mmap(
    clockgb, resetn,
    address, indata, nr1_data, load, store,
    nr1_address, nr1_indata, nr1[nr1_address],, nr1_store
);

wire [15:0] nr2_address;
wire [7:0] nr2_indata;
wire [7:0] nr2_data;
wire nr2_store;

rrmmap #(16'hff15, 16'hff19) nr2_mmap(
    clockgb, resetn,
    address, indata, nr2_data, load, store,
    nr2_address, nr2_indata, nr2[nr2_address],, nr2_store
);

wire [15:0] nr3_address;
wire [7:0] nr3_indata;
wire [7:0] nr3_data;
wire nr3_store;

rrmmap #(16'hff1a, 16'hff1e) nr3_mmap(
    clockgb, resetn,
    address, indata, nr3_data, load, store,
    nr3_address, nr3_indata, nr3[nr3_address],, nr3_store
);

wire [15:0] nr4_address;
wire [7:0] nr4_indata;
wire [7:0] nr4_data;
wire nr4_store;

rrmmap #(16'hff1f, 16'hff23) nr4_mmap(
    clockgb, resetn,
    address, indata, nr4_data, load, store,
    nr4_address, nr4_indata, nr4[nr4_address],, nr4_store
);

wire [15:0] wave_address;
wire [7:0] wave_outdata = {wave_table[wave_address], wave_table[wave_address+1]};
wire [7:0] wave_indata;
wire [7:0] wave_data;
wire wave_store;

rrmmap #(16'hff30, 16'hff3f) wave_mmap(
    clockgb, resetn,
    address, indata, wave_data, load, store,
    wave_address, wave_indata, wave_outdata,, wave_store
);

wire [7:0] nr50_indata;
wire [7:0] nr50_data;
wire nr50_store;

rrmmap #(16'hff24) nr50_mmap(
    clockgb, resetn,
    address, indata, nr50_data, load, store,, 
    nr50_indata, nr50,, nr50_store
);

wire [7:0] nr51_indata;
wire [7:0] nr51_data;
wire nr51_store;

rrmmap #(16'hff25) nr51_mmap(
    clockgb, resetn,
    address, indata, nr51_data, load, store,, 
    nr51_indata, nr51,, nr51_store
);

wire [7:0] nr52_indata;
wire [7:0] nr52_data;
wire nr52_store;

rrmmap #(16'hff26) nr52_mmap(
    clockgb, resetn,
    address, indata, nr52_data, load, store,, 
    nr52_indata, 
    {nr52[7:4], nr4_output!=0, nr3_output!=0, nr2_output!=0, nr1_output!=0},, 
    nr52_store
);

assign outdata = nr1_data | nr2_data | nr3_data | nr4_data | 
                 wave_data | nr50_data | nr51_data | nr52_data;


endmodule
