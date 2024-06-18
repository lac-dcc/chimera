// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// CounterModule.v
// Counts up or down, wrapping at 0 and 9:59:9
// Instantiate count files

module CounterModule(min,sec_msd,sec_lsd,tenable,tick,clr,enable,dswitch);
	output [3:0] min,sec_msd,sec_lsd,tenable;
	input  tick,clr,enable,dswitch;

	wire  dswitch_en,bk_en,mdswitch_en,mbk_en,min_dswitch_en,minbken,lsd_en,msd_en,min_en;

	count_to9 tenth(tenable,tick,clr,enable,dswitch,dswitch_en,bk_en); //Counts for the tenths place (to 9)
	count_to9 lsdig_second(sec_lsd,tick,clr,lsd_en,dswitch,mdswitch_en,mbk_en); // counts least significant digit for seconds (to 9)
	count_to5 msdig_second(sec_msd,tick,clr,msd_en,dswitch,min_dswitch_en,minbken); // most significant digit for seconds (to 5)
	count_to9 minute(min,tick,clr,min_en,dswitch, , ); // counts minutes (to 9)

	assign lsd_en = (clr && enable) || dswitch_en || bk_en;
	assign msd_en = (clr && enable) || mdswitch_en || mbk_en;
	assign min_en = (clr && enable) || min_dswitch_en || minbken;
endmodule

// Handles counting to 9

module count_to9(count,tick,clr,enable,dswitch,dswitch_en,bk_en);
	output reg [3:0] count;
	output       dswitch_en, bk_en;
	input        tick, clr, enable, dswitch;

	reg    [3:0] count_n = 4'b0000;

	// Go to next count every posedge of the clock
	always @(posedge tick)
	begin
		if(enable)
			count <= count_n;
		else
			count <= count;
        if(clr)
            count <= 0;
	end

	// Handles wrap around at 9 and 0
	always @(count or dswitch)
	begin
		if(dswitch)
			count_n=(count==9) ? 0 : count+4'b0001;
		else
			count_n=(count==0) ? 9 : count-4'b0001;
	end

	assign dswitch_en = (count==9) && dswitch && enable;
	assign bk_en = (count==0) && !dswitch && enable;
endmodule

// Handles counting to 5 

module count_to5(count,tick,clr,enable,dswitch,dswitch_en,bk_en);
	output reg [3:0] count;
	output       dswitch_en, bk_en;
	input        tick, clr, enable, dswitch;

	reg    [3:0] count_n = 4'b0000;

	// Go to next count every posedge of the clock
	always @(posedge tick)
	begin
		if(enable)
            count <= count_n;
        else
            count <= count;
        if(clr)
            count <= 0;
	end

	// Handle rollover
	always @(count or dswitch)
	begin
		if(dswitch)
			count_n=(count==5) ? 0 : count+4'b0001;
		else
			count_n=(count==0) ? 5 : count-4'b0001;
	end

	assign dswitch_en = (count==5) && dswitch && enable;
	assign bk_en = (count==0) && !dswitch && enable;
endmodule
