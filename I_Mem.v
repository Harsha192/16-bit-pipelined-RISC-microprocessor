module IM(Input_Address,Output);

	input [15:0] Input_Address;
	reg [7:0] Instructions [1024:0];
	output reg[15:0] Output;
	
	initial
		begin
			Instructions [0][7:0] = 8'b11001010;  
			Instructions [1][7:0] = 8'b01010101;
		end

	always @(Input_Address)
		begin
			Output[7:0]=Instructions[Input_Address][7:0];
			Output[15:8]=Instructions[Input_Address+16'b1][7:0];
		end

endmodule


module Test_I_Mem;

	reg [15:0] Input_Address;
	wire [15:0] Output;

	IM myim(Input_Address,Output);

	initial
		begin
			Input_Address=16'b0; 
			#5 $display("Input_Address=%b, Output=%b",Input_Address,Output);
		end

endmodule