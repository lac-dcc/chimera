
	reg [7:0] mem [0:511]; 

//syncro RAM model with rdena
//will be put into LE's - for synthesis ONLY!!!
	always @(posedge clk)
	if (rdena)
		rddata_r <= mem[rdaddr];
	assign rddata = rddata_r;

	always @(posedge clk)
	if (wrena)
		mem[wraddr] <= wrdata;


//syncro RAM model w/o rdena
	always @(posedge clk)
		rddata <= mem[rdaddr];
	
	always @(posedge clk)
	if (wrena)
		mem[wraddr] <= wrdata;


//asyncro out RAM model
	always @*
		rddata <= mem[rdaddr];

	always @(posedge clk)
	if (wrena)
		mem[wraddr] <= wrdata;
