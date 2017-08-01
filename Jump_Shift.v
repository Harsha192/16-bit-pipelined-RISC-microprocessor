module Jump_Shift(out,in,clock);
	input [11:0] in;
	output [12:0] out;
	reg [12:0] temp;
	input clock;
	
	always @(posedge clock)
		begin 
			temp[0] = 1'b0;
			temp[12:1]=in[11:0];
		end
		
	assign out=temp;
endmodule

module Test_Jump_Shift;
	reg [11:0] in;
	wire [12:0] out;
	reg clock;
	
	initial
		clock = 1'b0;
		
	always
		#5 clock= ~clock;
		
	initial
		#1000 $finish;
		
	Jump_Shift j1(out,in,clock);
	initial
		begin
			 in=12'b101110001111;
			#14 $display("Input : %b, Output : %b",in,out);
		end
endmodule