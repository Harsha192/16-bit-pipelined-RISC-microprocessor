module Sign_Extender(out,in,clock);
	input [3:0] in;
	output [15:0] out;
	input clock;
	reg [15:0] temp;
	always @(posedge clock)
		begin
			temp[3:0]=in[3:0];
			
			if(in[3]==1'b0)
				begin
					temp[15:4] = 12'b000000000000;
				end
			else if(in[3]==1'b1)
				begin
					temp[15:4]=12'b111111111111;
				end
		end
	assign out=temp;
endmodule

module Test_Sign_Extender;
	reg [3:0] in;
	wire [15:0] out;
	reg clock;
	
	initial 
		clock=1'b0;
		
	always
		#5 clock=~clock;
	
	initial
		#1000 $finish;
		
	Sign_Extender s1(out,in,clock);
	
	initial
		begin
			#5 in = 4'b1010;
			#15 $display("%b",out);
			
			#5 in = 4'b0110;
			#15 $display("%b",out);
		end
endmodule