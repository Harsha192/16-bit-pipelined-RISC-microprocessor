module Controller_Unit(RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp,MemWrite,ALUSRc,RegWrite,op0,op1,op2,op3,clock);
	input op0,op1,op2,op3;
	input clock;
	output RegDst,Jump,Branch,MemRead,Mem2Reg,MemWrite,ALUSRc,RegWrite;
	output [2:0] ALUOp;
	
	reg tRegDst,tJump,tBranch,tMemRead,tMem2Reg,tMemWrite,tALUSRc,tRegWrite;
	reg [2:0] tALUOp;
	
	always @(posedge clock)
	begin
		case({op3,op2,op1,op0})
			//ADD
			4'b0010: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b010;
					 end
			//SUB
			4'b0110: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b110;
					 end
			//AND
			4'b0000: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b000;
					 end
			//OR
			4'b0001: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b001;
					 end
			//slt
			4'b0111: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b111;
					 end
			//lw
			4'b1000: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b1;
					 tMem2Reg=1'b1;
					 tMemWrite=1'b0;
					 tALUSRc=1'b1;
					 tRegWrite=1'b1;
					 tALUOp=3'b010;
					 end
			//sw
			4'b1010: begin
					 tRegDst=1'b1;
					 tJump = 1'b0;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b1;
					 tALUSRc=1'b1;
					 tRegWrite=1'b0;
					 tALUOp=3'b010;
					 end
			//BNE
			4'b1110: begin
					 tRegDst=1'b0;
					 tJump = 1'b0;
					 tBranch = 1'b1;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b0;
					 tALUOp=3'b010;
					 end
			//JMP
			4'b1111: begin
					 tRegDst=1'b0;
					 tJump = 1'b1;
					 tBranch = 1'b0;
					 tMemRead=1'b0;
					 tMem2Reg=1'b0;
					 tMemWrite=1'b0;
					 tALUSRc=1'b0;
					 tRegWrite=1'b1;
					 tALUOp=3'b010;
					 end
		endcase
	end
		assign RegDst=tRegDst;
		assign Jump=tJump;
		assign Branch=tBranch;
		assign MemRead=tMemRead;
		assign Mem2Reg=tMem2Reg;
		assign MemWrite=tMemWrite;
		assign ALUSRc=tALUSRc;
		assign RegWrite=tRegWrite;
		assign ALUOp=tALUOp;
endmodule 

module Test_Controller;
	wire RegDst,Jump,Branch,MemRead,Mem2Reg,MemWrite,ALUSRc,RegWrite;
	wire [2:0] ALUOp;
	reg op0,op1,op2,op3,clock;
	
	initial
		clock=1'b0;
		
	always
		#5 clock=~clock;
		
	initial
		#1000 $finish;
		
	Controller_Unit c1(RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp,MemWrite,ALUSRc,RegWrite,op0,op1,op2,op3,clock);
	initial
	begin
		$display("--ADD Operation--");
		#5 op3=0;op2=0;op1=1;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--SUB Operation--");
		#5 op3=0;op2=1;op1=1;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--AND Operation--");
		#5 op3=0;op2=0;op1=0;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--OR Operation--");
		#5 op3=0;op2=0;op1=0;op0=1;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--SLT Operation--");
		#5 op3=0;op2=1;op1=1;op0=1;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--LW Operation--");
		#5 op3=1;op2=0;op1=0;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--SW Operation--");
		#5 op3=1;op2=0;op1=1;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--BNE Operation--");
		#5 op3=1;op2=1;op1=1;op0=0;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		$display("--JMP Operation--");
		#5 op3=1;op2=1;op1=1;op0=1;
		$display("op3=%d, op2=%d, op1=%d op0=%d",op3,op2,op1,op0);
		#15 $display("RegDst=%d, Jump=%d, Branch=%d, MemRead=%d, Mem2Reg=%d, ALUOp[2]=%d ALUOp[1]=%d ALUOp[0]=%d, MemWrite=%d, ALUSRc=%d, RegWrite=%d.\n",RegDst,Jump,Branch,MemRead,Mem2Reg,ALUOp[2],ALUOp[1],ALUOp[0],MemWrite,ALUSRc,RegWrite);
	
		
	end
	
endmodule