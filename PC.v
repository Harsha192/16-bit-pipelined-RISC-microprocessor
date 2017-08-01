module pc(Input,Output,clock);
	input [15:0] Input;
	input clock;
	output reg [15:0] Output;
	
	always@(posedge clock)
		if(Input>16'b0)
			begin
				Output=Input;
			end
	
		else	
			begin
				Output=16'b0;
			end

endmodule

module Test_PC;
	reg  [15:0] Input;
	reg clock;
	wire [15:0] Output;
	
	initial 
		clock=1'b0;
		
	always
		#5 clock=~clock;
	
	initial
		#1000 $finish;
		
	pc mypc(Input,Output,clock);
	

	initial
		begin
			    
			#10 $display("Input = %b Output=%b",Input,Output);
			
			#5 Input=16'b0000000000000101;    
			#10 $display("Input = %b Output=%b",Input,Output);
		end
endmodule