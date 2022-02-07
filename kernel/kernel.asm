
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	87813103          	ld	sp,-1928(sp) # 8000b878 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd57ff>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	5fc78793          	addi	a5,a5,1532 # 800017f6 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	2407879b          	addiw	a5,a5,576
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00014717          	auipc	a4,0x14
    800002e8:	d4c70713          	addi	a4,a4,-692 # 80014030 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	00008797          	auipc	a5,0x8
    8000032c:	4b878793          	addi	a5,a5,1208 # 800087e0 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	aac080e7          	jalr	-1364(ra) # 80000e40 <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aa0080e7          	jalr	-1376(ra) # 80000e40 <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	a96080e7          	jalr	-1386(ra) # 80000e40 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a86080e7          	jalr	-1402(ra) # 80000e40 <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00003097          	auipc	ra,0x3
    8000040a:	27e080e7          	jalr	638(ra) # 80003684 <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70863          	beq	a4,a5,80000444 <consolewrite+0x78>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	960080e7          	jalr	-1696(ra) # 80000d80 <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42703          	lw	a4,-20(s0)
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf747e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7a>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00014517          	auipc	a0,0x14
    8000047a:	cfa50513          	addi	a0,a0,-774 # 80014170 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	df0080e7          	jalr	-528(ra) # 8000126e <acquire>
  while(n > 0){
    80000486:	a215                	j	800005aa <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	38c080e7          	jalr	908(ra) # 80002814 <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	579c                	lw	a5,40(a5)
    80000494:	cb99                	beqz	a5,800004aa <consoleread+0x56>
        release(&cons.lock);
    80000496:	00014517          	auipc	a0,0x14
    8000049a:	cda50513          	addi	a0,a0,-806 # 80014170 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00014597          	auipc	a1,0x14
    800004ae:	cc658593          	addi	a1,a1,-826 # 80014170 <cons>
    800004b2:	00014517          	auipc	a0,0x14
    800004b6:	d5650513          	addi	a0,a0,-682 # 80014208 <cons+0x98>
    800004ba:	00003097          	auipc	ra,0x3
    800004be:	f9e080e7          	jalr	-98(ra) # 80003458 <sleep>
    while(cons.r == cons.w){
    800004c2:	00014797          	auipc	a5,0x14
    800004c6:	cae78793          	addi	a5,a5,-850 # 80014170 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00014797          	auipc	a5,0x14
    800004d2:	ca278793          	addi	a5,a5,-862 # 80014170 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00014797          	auipc	a5,0x14
    800004e2:	c9278793          	addi	a5,a5,-878 # 80014170 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00014717          	auipc	a4,0x14
    800004f8:	c7c70713          	addi	a4,a4,-900 # 80014170 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00014717          	auipc	a4,0x14
    8000050a:	c6a70713          	addi	a4,a4,-918 # 80014170 <cons>
    8000050e:	1782                	slli	a5,a5,0x20
    80000510:	9381                	srli	a5,a5,0x20
    80000512:	97ba                	add	a5,a5,a4
    80000514:	0187c783          	lbu	a5,24(a5)
    80000518:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    8000051c:	fe842783          	lw	a5,-24(s0)
    80000520:	0007871b          	sext.w	a4,a5
    80000524:	4791                	li	a5,4
    80000526:	02f71963          	bne	a4,a5,80000558 <consoleread+0x104>
      if(n < target){
    8000052a:	fd842703          	lw	a4,-40(s0)
    8000052e:	fec42783          	lw	a5,-20(s0)
    80000532:	2781                	sext.w	a5,a5
    80000534:	08f77163          	bgeu	a4,a5,800005b6 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000538:	00014797          	auipc	a5,0x14
    8000053c:	c3878793          	addi	a5,a5,-968 # 80014170 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00014797          	auipc	a5,0x14
    8000054e:	c2678793          	addi	a5,a5,-986 # 80014170 <cons>
    80000552:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000556:	a085                	j	800005b6 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000558:	fe842783          	lw	a5,-24(s0)
    8000055c:	0ff7f793          	andi	a5,a5,255
    80000560:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000564:	fe740713          	addi	a4,s0,-25
    80000568:	fdc42783          	lw	a5,-36(s0)
    8000056c:	4685                	li	a3,1
    8000056e:	863a                	mv	a2,a4
    80000570:	fd043583          	ld	a1,-48(s0)
    80000574:	853e                	mv	a0,a5
    80000576:	00003097          	auipc	ra,0x3
    8000057a:	09a080e7          	jalr	154(ra) # 80003610 <either_copyout>
    8000057e:	87aa                	mv	a5,a0
    80000580:	873e                	mv	a4,a5
    80000582:	57fd                	li	a5,-1
    80000584:	02f70b63          	beq	a4,a5,800005ba <consoleread+0x166>
      break;

    dst++;
    80000588:	fd043783          	ld	a5,-48(s0)
    8000058c:	0785                	addi	a5,a5,1
    8000058e:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000592:	fd842783          	lw	a5,-40(s0)
    80000596:	37fd                	addiw	a5,a5,-1
    80000598:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000059c:	fe842783          	lw	a5,-24(s0)
    800005a0:	0007871b          	sext.w	a4,a5
    800005a4:	47a9                	li	a5,10
    800005a6:	00f70c63          	beq	a4,a5,800005be <consoleread+0x16a>
  while(n > 0){
    800005aa:	fd842783          	lw	a5,-40(s0)
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	f0f049e3          	bgtz	a5,800004c2 <consoleread+0x6e>
    800005b4:	a031                	j	800005c0 <consoleread+0x16c>
      break;
    800005b6:	0001                	nop
    800005b8:	a021                	j	800005c0 <consoleread+0x16c>
      break;
    800005ba:	0001                	nop
    800005bc:	a011                	j	800005c0 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005be:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c0:	00014517          	auipc	a0,0x14
    800005c4:	bb050513          	addi	a0,a0,-1104 # 80014170 <cons>
    800005c8:	00001097          	auipc	ra,0x1
    800005cc:	d0a080e7          	jalr	-758(ra) # 800012d2 <release>

  return target - n;
    800005d0:	fd842783          	lw	a5,-40(s0)
    800005d4:	fec42703          	lw	a4,-20(s0)
    800005d8:	40f707bb          	subw	a5,a4,a5
    800005dc:	2781                	sext.w	a5,a5
    800005de:	2781                	sext.w	a5,a5
}
    800005e0:	853e                	mv	a0,a5
    800005e2:	70a2                	ld	ra,40(sp)
    800005e4:	7402                	ld	s0,32(sp)
    800005e6:	6145                	addi	sp,sp,48
    800005e8:	8082                	ret

00000000800005ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005ea:	1101                	addi	sp,sp,-32
    800005ec:	ec06                	sd	ra,24(sp)
    800005ee:	e822                	sd	s0,16(sp)
    800005f0:	1000                	addi	s0,sp,32
    800005f2:	87aa                	mv	a5,a0
    800005f4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005f8:	00014517          	auipc	a0,0x14
    800005fc:	b7850513          	addi	a0,a0,-1160 # 80014170 <cons>
    80000600:	00001097          	auipc	ra,0x1
    80000604:	c6e080e7          	jalr	-914(ra) # 8000126e <acquire>

  switch(c){
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	07f00793          	li	a5,127
    80000614:	0cf70763          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	07f00793          	li	a5,127
    80000624:	10e7c363          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000628:	fec42783          	lw	a5,-20(s0)
    8000062c:	0007871b          	sext.w	a4,a5
    80000630:	47d5                	li	a5,21
    80000632:	06f70163          	beq	a4,a5,80000694 <consoleintr+0xaa>
    80000636:	fec42783          	lw	a5,-20(s0)
    8000063a:	0007871b          	sext.w	a4,a5
    8000063e:	47d5                	li	a5,21
    80000640:	0ee7c563          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000644:	fec42783          	lw	a5,-20(s0)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	47a1                	li	a5,8
    8000064e:	08f70a63          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000652:	fec42783          	lw	a5,-20(s0)
    80000656:	0007871b          	sext.w	a4,a5
    8000065a:	47c1                	li	a5,16
    8000065c:	0cf71763          	bne	a4,a5,8000072a <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000660:	00003097          	auipc	ra,0x3
    80000664:	098080e7          	jalr	152(ra) # 800036f8 <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00014797          	auipc	a5,0x14
    8000066e:	b0678793          	addi	a5,a5,-1274 # 80014170 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00014797          	auipc	a5,0x14
    80000680:	af478793          	addi	a5,a5,-1292 # 80014170 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00014797          	auipc	a5,0x14
    80000698:	adc78793          	addi	a5,a5,-1316 # 80014170 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00014797          	auipc	a5,0x14
    800006a4:	ad078793          	addi	a5,a5,-1328 # 80014170 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00014797          	auipc	a5,0x14
    800006b4:	ac078793          	addi	a5,a5,-1344 # 80014170 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00014717          	auipc	a4,0x14
    800006ca:	aaa70713          	addi	a4,a4,-1366 # 80014170 <cons>
    800006ce:	1782                	slli	a5,a5,0x20
    800006d0:	9381                	srli	a5,a5,0x20
    800006d2:	97ba                	add	a5,a5,a4
    800006d4:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006d8:	873e                	mv	a4,a5
    800006da:	47a9                	li	a5,10
    800006dc:	f8f717e3          	bne	a4,a5,8000066a <consoleintr+0x80>
    }
    break;
    800006e0:	a2b9                	j	8000082e <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006e2:	00014797          	auipc	a5,0x14
    800006e6:	a8e78793          	addi	a5,a5,-1394 # 80014170 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00014797          	auipc	a5,0x14
    800006f2:	a8278793          	addi	a5,a5,-1406 # 80014170 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00014797          	auipc	a5,0x14
    80000702:	a7278793          	addi	a5,a5,-1422 # 80014170 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00014797          	auipc	a5,0x14
    80000714:	a6078793          	addi	a5,a5,-1440 # 80014170 <cons>
    80000718:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000071c:	10000513          	li	a0,256
    80000720:	00000097          	auipc	ra,0x0
    80000724:	c54080e7          	jalr	-940(ra) # 80000374 <consputc>
    }
    break;
    80000728:	a229                	j	80000832 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000072a:	fec42783          	lw	a5,-20(s0)
    8000072e:	2781                	sext.w	a5,a5
    80000730:	10078363          	beqz	a5,80000836 <consoleintr+0x24c>
    80000734:	00014797          	auipc	a5,0x14
    80000738:	a3c78793          	addi	a5,a5,-1476 # 80014170 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00014797          	auipc	a5,0x14
    80000744:	a3078793          	addi	a5,a5,-1488 # 80014170 <cons>
    80000748:	0987a783          	lw	a5,152(a5)
    8000074c:	40f707bb          	subw	a5,a4,a5
    80000750:	2781                	sext.w	a5,a5
    80000752:	873e                	mv	a4,a5
    80000754:	07f00793          	li	a5,127
    80000758:	0ce7ef63          	bltu	a5,a4,80000836 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000075c:	fec42783          	lw	a5,-20(s0)
    80000760:	0007871b          	sext.w	a4,a5
    80000764:	47b5                	li	a5,13
    80000766:	00f70563          	beq	a4,a5,80000770 <consoleintr+0x186>
    8000076a:	fec42783          	lw	a5,-20(s0)
    8000076e:	a011                	j	80000772 <consoleintr+0x188>
    80000770:	47a9                	li	a5,10
    80000772:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	853e                	mv	a0,a5
    8000077c:	00000097          	auipc	ra,0x0
    80000780:	bf8080e7          	jalr	-1032(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000784:	00014797          	auipc	a5,0x14
    80000788:	9ec78793          	addi	a5,a5,-1556 # 80014170 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00014717          	auipc	a4,0x14
    8000079e:	9d670713          	addi	a4,a4,-1578 # 80014170 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00014697          	auipc	a3,0x14
    800007b8:	9bc68693          	addi	a3,a3,-1604 # 80014170 <cons>
    800007bc:	1782                	slli	a5,a5,0x20
    800007be:	9381                	srli	a5,a5,0x20
    800007c0:	97b6                	add	a5,a5,a3
    800007c2:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800007c6:	fec42783          	lw	a5,-20(s0)
    800007ca:	0007871b          	sext.w	a4,a5
    800007ce:	47a9                	li	a5,10
    800007d0:	02f70a63          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007d4:	fec42783          	lw	a5,-20(s0)
    800007d8:	0007871b          	sext.w	a4,a5
    800007dc:	4791                	li	a5,4
    800007de:	02f70363          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007e2:	00014797          	auipc	a5,0x14
    800007e6:	98e78793          	addi	a5,a5,-1650 # 80014170 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00014797          	auipc	a5,0x14
    800007f2:	98278793          	addi	a5,a5,-1662 # 80014170 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00014797          	auipc	a5,0x14
    80000808:	96c78793          	addi	a5,a5,-1684 # 80014170 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00014797          	auipc	a5,0x14
    80000814:	96078793          	addi	a5,a5,-1696 # 80014170 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00014517          	auipc	a0,0x14
    80000820:	9ec50513          	addi	a0,a0,-1556 # 80014208 <cons+0x98>
    80000824:	00003097          	auipc	ra,0x3
    80000828:	cb0080e7          	jalr	-848(ra) # 800034d4 <wakeup>
      }
    }
    break;
    8000082c:	a029                	j	80000836 <consoleintr+0x24c>
    break;
    8000082e:	0001                	nop
    80000830:	a021                	j	80000838 <consoleintr+0x24e>
    break;
    80000832:	0001                	nop
    80000834:	a011                	j	80000838 <consoleintr+0x24e>
    break;
    80000836:	0001                	nop
  }
  
  release(&cons.lock);
    80000838:	00014517          	auipc	a0,0x14
    8000083c:	93850513          	addi	a0,a0,-1736 # 80014170 <cons>
    80000840:	00001097          	auipc	ra,0x1
    80000844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
}
    80000848:	0001                	nop
    8000084a:	60e2                	ld	ra,24(sp)
    8000084c:	6442                	ld	s0,16(sp)
    8000084e:	6105                	addi	sp,sp,32
    80000850:	8082                	ret

0000000080000852 <consoleinit>:

void
consoleinit(void)
{
    80000852:	1141                	addi	sp,sp,-16
    80000854:	e406                	sd	ra,8(sp)
    80000856:	e022                	sd	s0,0(sp)
    80000858:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000085a:	0000a597          	auipc	a1,0xa
    8000085e:	7a658593          	addi	a1,a1,1958 # 8000b000 <etext>
    80000862:	00014517          	auipc	a0,0x14
    80000866:	90e50513          	addi	a0,a0,-1778 # 80014170 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00024797          	auipc	a5,0x24
    8000087e:	a9678793          	addi	a5,a5,-1386 # 80024310 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00024797          	auipc	a5,0x24
    80000890:	a8478793          	addi	a5,a5,-1404 # 80024310 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	b3870713          	addi	a4,a4,-1224 # 800003cc <consolewrite>
    8000089c:	ef98                	sd	a4,24(a5)
}
    8000089e:	0001                	nop
    800008a0:	60a2                	ld	ra,8(sp)
    800008a2:	6402                	ld	s0,0(sp)
    800008a4:	0141                	addi	sp,sp,16
    800008a6:	8082                	ret

00000000800008a8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008a8:	7139                	addi	sp,sp,-64
    800008aa:	fc06                	sd	ra,56(sp)
    800008ac:	f822                	sd	s0,48(sp)
    800008ae:	0080                	addi	s0,sp,64
    800008b0:	87aa                	mv	a5,a0
    800008b2:	86ae                	mv	a3,a1
    800008b4:	8732                	mv	a4,a2
    800008b6:	fcf42623          	sw	a5,-52(s0)
    800008ba:	87b6                	mv	a5,a3
    800008bc:	fcf42423          	sw	a5,-56(s0)
    800008c0:	87ba                	mv	a5,a4
    800008c2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008c6:	fc442783          	lw	a5,-60(s0)
    800008ca:	2781                	sext.w	a5,a5
    800008cc:	c78d                	beqz	a5,800008f6 <printint+0x4e>
    800008ce:	fcc42783          	lw	a5,-52(s0)
    800008d2:	01f7d79b          	srliw	a5,a5,0x1f
    800008d6:	0ff7f793          	andi	a5,a5,255
    800008da:	fcf42223          	sw	a5,-60(s0)
    800008de:	fc442783          	lw	a5,-60(s0)
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	cb89                	beqz	a5,800008f6 <printint+0x4e>
    x = -xx;
    800008e6:	fcc42783          	lw	a5,-52(s0)
    800008ea:	40f007bb          	negw	a5,a5
    800008ee:	2781                	sext.w	a5,a5
    800008f0:	fef42423          	sw	a5,-24(s0)
    800008f4:	a029                	j	800008fe <printint+0x56>
  else
    x = xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008fe:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000902:	fc842783          	lw	a5,-56(s0)
    80000906:	fe842703          	lw	a4,-24(s0)
    8000090a:	02f777bb          	remuw	a5,a4,a5
    8000090e:	0007861b          	sext.w	a2,a5
    80000912:	fec42783          	lw	a5,-20(s0)
    80000916:	0017871b          	addiw	a4,a5,1
    8000091a:	fee42623          	sw	a4,-20(s0)
    8000091e:	0000b697          	auipc	a3,0xb
    80000922:	e2268693          	addi	a3,a3,-478 # 8000b740 <digits>
    80000926:	02061713          	slli	a4,a2,0x20
    8000092a:	9301                	srli	a4,a4,0x20
    8000092c:	9736                	add	a4,a4,a3
    8000092e:	00074703          	lbu	a4,0(a4)
    80000932:	ff040693          	addi	a3,s0,-16
    80000936:	97b6                	add	a5,a5,a3
    80000938:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000093c:	fc842783          	lw	a5,-56(s0)
    80000940:	fe842703          	lw	a4,-24(s0)
    80000944:	02f757bb          	divuw	a5,a4,a5
    80000948:	fef42423          	sw	a5,-24(s0)
    8000094c:	fe842783          	lw	a5,-24(s0)
    80000950:	2781                	sext.w	a5,a5
    80000952:	fbc5                	bnez	a5,80000902 <printint+0x5a>

  if(sign)
    80000954:	fc442783          	lw	a5,-60(s0)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	cf85                	beqz	a5,80000992 <printint+0xea>
    buf[i++] = '-';
    8000095c:	fec42783          	lw	a5,-20(s0)
    80000960:	0017871b          	addiw	a4,a5,1
    80000964:	fee42623          	sw	a4,-20(s0)
    80000968:	ff040713          	addi	a4,s0,-16
    8000096c:	97ba                	add	a5,a5,a4
    8000096e:	02d00713          	li	a4,45
    80000972:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000976:	a831                	j	80000992 <printint+0xea>
    consputc(buf[i]);
    80000978:	fec42783          	lw	a5,-20(s0)
    8000097c:	ff040713          	addi	a4,s0,-16
    80000980:	97ba                	add	a5,a5,a4
    80000982:	fe87c783          	lbu	a5,-24(a5)
    80000986:	2781                	sext.w	a5,a5
    80000988:	853e                	mv	a0,a5
    8000098a:	00000097          	auipc	ra,0x0
    8000098e:	9ea080e7          	jalr	-1558(ra) # 80000374 <consputc>
  while(--i >= 0)
    80000992:	fec42783          	lw	a5,-20(s0)
    80000996:	37fd                	addiw	a5,a5,-1
    80000998:	fef42623          	sw	a5,-20(s0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	fc07dbe3          	bgez	a5,80000978 <printint+0xd0>
}
    800009a6:	0001                	nop
    800009a8:	0001                	nop
    800009aa:	70e2                	ld	ra,56(sp)
    800009ac:	7442                	ld	s0,48(sp)
    800009ae:	6121                	addi	sp,sp,64
    800009b0:	8082                	ret

00000000800009b2 <printptr>:

static void
printptr(uint64 x)
{
    800009b2:	7179                	addi	sp,sp,-48
    800009b4:	f406                	sd	ra,40(sp)
    800009b6:	f022                	sd	s0,32(sp)
    800009b8:	1800                	addi	s0,sp,48
    800009ba:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009be:	03000513          	li	a0,48
    800009c2:	00000097          	auipc	ra,0x0
    800009c6:	9b2080e7          	jalr	-1614(ra) # 80000374 <consputc>
  consputc('x');
    800009ca:	07800513          	li	a0,120
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d6:	fe042623          	sw	zero,-20(s0)
    800009da:	a81d                	j	80000a10 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009dc:	fd843783          	ld	a5,-40(s0)
    800009e0:	93f1                	srli	a5,a5,0x3c
    800009e2:	0000b717          	auipc	a4,0xb
    800009e6:	d5e70713          	addi	a4,a4,-674 # 8000b740 <digits>
    800009ea:	97ba                	add	a5,a5,a4
    800009ec:	0007c783          	lbu	a5,0(a5)
    800009f0:	2781                	sext.w	a5,a5
    800009f2:	853e                	mv	a0,a5
    800009f4:	00000097          	auipc	ra,0x0
    800009f8:	980080e7          	jalr	-1664(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009fc:	fec42783          	lw	a5,-20(s0)
    80000a00:	2785                	addiw	a5,a5,1
    80000a02:	fef42623          	sw	a5,-20(s0)
    80000a06:	fd843783          	ld	a5,-40(s0)
    80000a0a:	0792                	slli	a5,a5,0x4
    80000a0c:	fcf43c23          	sd	a5,-40(s0)
    80000a10:	fec42783          	lw	a5,-20(s0)
    80000a14:	873e                	mv	a4,a5
    80000a16:	47bd                	li	a5,15
    80000a18:	fce7f2e3          	bgeu	a5,a4,800009dc <printptr+0x2a>
}
    80000a1c:	0001                	nop
    80000a1e:	0001                	nop
    80000a20:	70a2                	ld	ra,40(sp)
    80000a22:	7402                	ld	s0,32(sp)
    80000a24:	6145                	addi	sp,sp,48
    80000a26:	8082                	ret

0000000080000a28 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a28:	7119                	addi	sp,sp,-128
    80000a2a:	fc06                	sd	ra,56(sp)
    80000a2c:	f822                	sd	s0,48(sp)
    80000a2e:	0080                	addi	s0,sp,64
    80000a30:	fca43423          	sd	a0,-56(s0)
    80000a34:	e40c                	sd	a1,8(s0)
    80000a36:	e810                	sd	a2,16(s0)
    80000a38:	ec14                	sd	a3,24(s0)
    80000a3a:	f018                	sd	a4,32(s0)
    80000a3c:	f41c                	sd	a5,40(s0)
    80000a3e:	03043823          	sd	a6,48(s0)
    80000a42:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a46:	00013797          	auipc	a5,0x13
    80000a4a:	7d278793          	addi	a5,a5,2002 # 80014218 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00013517          	auipc	a0,0x13
    80000a60:	7bc50513          	addi	a0,a0,1980 # 80014218 <pr>
    80000a64:	00001097          	auipc	ra,0x1
    80000a68:	80a080e7          	jalr	-2038(ra) # 8000126e <acquire>

  if (fmt == 0)
    80000a6c:	fc843783          	ld	a5,-56(s0)
    80000a70:	eb89                	bnez	a5,80000a82 <printf+0x5a>
    panic("null fmt");
    80000a72:	0000a517          	auipc	a0,0xa
    80000a76:	59650513          	addi	a0,a0,1430 # 8000b008 <etext+0x8>
    80000a7a:	00000097          	auipc	ra,0x0
    80000a7e:	204080e7          	jalr	516(ra) # 80000c7e <panic>

  va_start(ap, fmt);
    80000a82:	04040793          	addi	a5,s0,64
    80000a86:	fcf43023          	sd	a5,-64(s0)
    80000a8a:	fc043783          	ld	a5,-64(s0)
    80000a8e:	fc878793          	addi	a5,a5,-56
    80000a92:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a96:	fe042623          	sw	zero,-20(s0)
    80000a9a:	a24d                	j	80000c3c <printf+0x214>
    if(c != '%'){
    80000a9c:	fd842783          	lw	a5,-40(s0)
    80000aa0:	0007871b          	sext.w	a4,a5
    80000aa4:	02500793          	li	a5,37
    80000aa8:	00f70a63          	beq	a4,a5,80000abc <printf+0x94>
      consputc(c);
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	853e                	mv	a0,a5
    80000ab2:	00000097          	auipc	ra,0x0
    80000ab6:	8c2080e7          	jalr	-1854(ra) # 80000374 <consputc>
      continue;
    80000aba:	aaa5                	j	80000c32 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000abc:	fec42783          	lw	a5,-20(s0)
    80000ac0:	2785                	addiw	a5,a5,1
    80000ac2:	fef42623          	sw	a5,-20(s0)
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	fc843703          	ld	a4,-56(s0)
    80000ace:	97ba                	add	a5,a5,a4
    80000ad0:	0007c783          	lbu	a5,0(a5)
    80000ad4:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ad8:	fd842783          	lw	a5,-40(s0)
    80000adc:	2781                	sext.w	a5,a5
    80000ade:	16078e63          	beqz	a5,80000c5a <printf+0x232>
      break;
    switch(c){
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	0007871b          	sext.w	a4,a5
    80000aea:	07800793          	li	a5,120
    80000aee:	08f70963          	beq	a4,a5,80000b80 <printf+0x158>
    80000af2:	fd842783          	lw	a5,-40(s0)
    80000af6:	0007871b          	sext.w	a4,a5
    80000afa:	07800793          	li	a5,120
    80000afe:	10e7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b02:	fd842783          	lw	a5,-40(s0)
    80000b06:	0007871b          	sext.w	a4,a5
    80000b0a:	07300793          	li	a5,115
    80000b0e:	0af70563          	beq	a4,a5,80000bb8 <printf+0x190>
    80000b12:	fd842783          	lw	a5,-40(s0)
    80000b16:	0007871b          	sext.w	a4,a5
    80000b1a:	07300793          	li	a5,115
    80000b1e:	0ee7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b22:	fd842783          	lw	a5,-40(s0)
    80000b26:	0007871b          	sext.w	a4,a5
    80000b2a:	07000793          	li	a5,112
    80000b2e:	06f70863          	beq	a4,a5,80000b9e <printf+0x176>
    80000b32:	fd842783          	lw	a5,-40(s0)
    80000b36:	0007871b          	sext.w	a4,a5
    80000b3a:	07000793          	li	a5,112
    80000b3e:	0ce7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b42:	fd842783          	lw	a5,-40(s0)
    80000b46:	0007871b          	sext.w	a4,a5
    80000b4a:	02500793          	li	a5,37
    80000b4e:	0af70d63          	beq	a4,a5,80000c08 <printf+0x1e0>
    80000b52:	fd842783          	lw	a5,-40(s0)
    80000b56:	0007871b          	sext.w	a4,a5
    80000b5a:	06400793          	li	a5,100
    80000b5e:	0af71c63          	bne	a4,a5,80000c16 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b62:	fd043783          	ld	a5,-48(s0)
    80000b66:	00878713          	addi	a4,a5,8
    80000b6a:	fce43823          	sd	a4,-48(s0)
    80000b6e:	439c                	lw	a5,0(a5)
    80000b70:	4605                	li	a2,1
    80000b72:	45a9                	li	a1,10
    80000b74:	853e                	mv	a0,a5
    80000b76:	00000097          	auipc	ra,0x0
    80000b7a:	d32080e7          	jalr	-718(ra) # 800008a8 <printint>
      break;
    80000b7e:	a855                	j	80000c32 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b80:	fd043783          	ld	a5,-48(s0)
    80000b84:	00878713          	addi	a4,a5,8
    80000b88:	fce43823          	sd	a4,-48(s0)
    80000b8c:	439c                	lw	a5,0(a5)
    80000b8e:	4605                	li	a2,1
    80000b90:	45c1                	li	a1,16
    80000b92:	853e                	mv	a0,a5
    80000b94:	00000097          	auipc	ra,0x0
    80000b98:	d14080e7          	jalr	-748(ra) # 800008a8 <printint>
      break;
    80000b9c:	a859                	j	80000c32 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b9e:	fd043783          	ld	a5,-48(s0)
    80000ba2:	00878713          	addi	a4,a5,8
    80000ba6:	fce43823          	sd	a4,-48(s0)
    80000baa:	639c                	ld	a5,0(a5)
    80000bac:	853e                	mv	a0,a5
    80000bae:	00000097          	auipc	ra,0x0
    80000bb2:	e04080e7          	jalr	-508(ra) # 800009b2 <printptr>
      break;
    80000bb6:	a8b5                	j	80000c32 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bb8:	fd043783          	ld	a5,-48(s0)
    80000bbc:	00878713          	addi	a4,a5,8
    80000bc0:	fce43823          	sd	a4,-48(s0)
    80000bc4:	639c                	ld	a5,0(a5)
    80000bc6:	fef43023          	sd	a5,-32(s0)
    80000bca:	fe043783          	ld	a5,-32(s0)
    80000bce:	e79d                	bnez	a5,80000bfc <printf+0x1d4>
        s = "(null)";
    80000bd0:	0000a797          	auipc	a5,0xa
    80000bd4:	44878793          	addi	a5,a5,1096 # 8000b018 <etext+0x18>
    80000bd8:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bdc:	a005                	j	80000bfc <printf+0x1d4>
        consputc(*s);
    80000bde:	fe043783          	ld	a5,-32(s0)
    80000be2:	0007c783          	lbu	a5,0(a5)
    80000be6:	2781                	sext.w	a5,a5
    80000be8:	853e                	mv	a0,a5
    80000bea:	fffff097          	auipc	ra,0xfffff
    80000bee:	78a080e7          	jalr	1930(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bf2:	fe043783          	ld	a5,-32(s0)
    80000bf6:	0785                	addi	a5,a5,1
    80000bf8:	fef43023          	sd	a5,-32(s0)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0007c783          	lbu	a5,0(a5)
    80000c04:	ffe9                	bnez	a5,80000bde <printf+0x1b6>
      break;
    80000c06:	a035                	j	80000c32 <printf+0x20a>
    case '%':
      consputc('%');
    80000c08:	02500513          	li	a0,37
    80000c0c:	fffff097          	auipc	ra,0xfffff
    80000c10:	768080e7          	jalr	1896(ra) # 80000374 <consputc>
      break;
    80000c14:	a839                	j	80000c32 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	75a080e7          	jalr	1882(ra) # 80000374 <consputc>
      consputc(c);
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	853e                	mv	a0,a5
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74c080e7          	jalr	1868(ra) # 80000374 <consputc>
      break;
    80000c30:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c32:	fec42783          	lw	a5,-20(s0)
    80000c36:	2785                	addiw	a5,a5,1
    80000c38:	fef42623          	sw	a5,-20(s0)
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	fc843703          	ld	a4,-56(s0)
    80000c44:	97ba                	add	a5,a5,a4
    80000c46:	0007c783          	lbu	a5,0(a5)
    80000c4a:	fcf42c23          	sw	a5,-40(s0)
    80000c4e:	fd842783          	lw	a5,-40(s0)
    80000c52:	2781                	sext.w	a5,a5
    80000c54:	e40794e3          	bnez	a5,80000a9c <printf+0x74>
    80000c58:	a011                	j	80000c5c <printf+0x234>
      break;
    80000c5a:	0001                	nop
    }
  }

  if(locking)
    80000c5c:	fdc42783          	lw	a5,-36(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	cb89                	beqz	a5,80000c74 <printf+0x24c>
    release(&pr.lock);
    80000c64:	00013517          	auipc	a0,0x13
    80000c68:	5b450513          	addi	a0,a0,1460 # 80014218 <pr>
    80000c6c:	00000097          	auipc	ra,0x0
    80000c70:	666080e7          	jalr	1638(ra) # 800012d2 <release>
}
    80000c74:	0001                	nop
    80000c76:	70e2                	ld	ra,56(sp)
    80000c78:	7442                	ld	s0,48(sp)
    80000c7a:	6109                	addi	sp,sp,128
    80000c7c:	8082                	ret

0000000080000c7e <panic>:

void
panic(char *s)
{
    80000c7e:	1101                	addi	sp,sp,-32
    80000c80:	ec06                	sd	ra,24(sp)
    80000c82:	e822                	sd	s0,16(sp)
    80000c84:	1000                	addi	s0,sp,32
    80000c86:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c8a:	00013797          	auipc	a5,0x13
    80000c8e:	58e78793          	addi	a5,a5,1422 # 80014218 <pr>
    80000c92:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c96:	0000a517          	auipc	a0,0xa
    80000c9a:	38a50513          	addi	a0,a0,906 # 8000b020 <etext+0x20>
    80000c9e:	00000097          	auipc	ra,0x0
    80000ca2:	d8a080e7          	jalr	-630(ra) # 80000a28 <printf>
  printf(s);
    80000ca6:	fe843503          	ld	a0,-24(s0)
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d7e080e7          	jalr	-642(ra) # 80000a28 <printf>
  printf("\n");
    80000cb2:	0000a517          	auipc	a0,0xa
    80000cb6:	37650513          	addi	a0,a0,886 # 8000b028 <etext+0x28>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	d6e080e7          	jalr	-658(ra) # 80000a28 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cc2:	0000b797          	auipc	a5,0xb
    80000cc6:	33e78793          	addi	a5,a5,830 # 8000c000 <panicked>
    80000cca:	4705                	li	a4,1
    80000ccc:	c398                	sw	a4,0(a5)
  for(;;)
    80000cce:	a001                	j	80000cce <panic+0x50>

0000000080000cd0 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cd0:	1141                	addi	sp,sp,-16
    80000cd2:	e406                	sd	ra,8(sp)
    80000cd4:	e022                	sd	s0,0(sp)
    80000cd6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cd8:	0000a597          	auipc	a1,0xa
    80000cdc:	35858593          	addi	a1,a1,856 # 8000b030 <etext+0x30>
    80000ce0:	00013517          	auipc	a0,0x13
    80000ce4:	53850513          	addi	a0,a0,1336 # 80014218 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00013797          	auipc	a5,0x13
    80000cf4:	52878793          	addi	a5,a5,1320 # 80014218 <pr>
    80000cf8:	4705                	li	a4,1
    80000cfa:	cf98                	sw	a4,24(a5)
}
    80000cfc:	0001                	nop
    80000cfe:	60a2                	ld	ra,8(sp)
    80000d00:	6402                	ld	s0,0(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e406                	sd	ra,8(sp)
    80000d0a:	e022                	sd	s0,0(sp)
    80000d0c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	0785                	addi	a5,a5,1
    80000d14:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	078d                	addi	a5,a5,3
    80000d1e:	f8000713          	li	a4,-128
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d30:	100007b7          	lui	a5,0x10000
    80000d34:	0785                	addi	a5,a5,1
    80000d36:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d3a:	100007b7          	lui	a5,0x10000
    80000d3e:	078d                	addi	a5,a5,3
    80000d40:	470d                	li	a4,3
    80000d42:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	0789                	addi	a5,a5,2
    80000d4c:	471d                	li	a4,7
    80000d4e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1
    80000d58:	470d                	li	a4,3
    80000d5a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d5e:	0000a597          	auipc	a1,0xa
    80000d62:	2da58593          	addi	a1,a1,730 # 8000b038 <etext+0x38>
    80000d66:	00013517          	auipc	a0,0x13
    80000d6a:	4d250513          	addi	a0,a0,1234 # 80014238 <uart_tx_lock>
    80000d6e:	00000097          	auipc	ra,0x0
    80000d72:	4d0080e7          	jalr	1232(ra) # 8000123e <initlock>
}
    80000d76:	0001                	nop
    80000d78:	60a2                	ld	ra,8(sp)
    80000d7a:	6402                	ld	s0,0(sp)
    80000d7c:	0141                	addi	sp,sp,16
    80000d7e:	8082                	ret

0000000080000d80 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d80:	1101                	addi	sp,sp,-32
    80000d82:	ec06                	sd	ra,24(sp)
    80000d84:	e822                	sd	s0,16(sp)
    80000d86:	1000                	addi	s0,sp,32
    80000d88:	87aa                	mv	a5,a0
    80000d8a:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d8e:	00013517          	auipc	a0,0x13
    80000d92:	4aa50513          	addi	a0,a0,1194 # 80014238 <uart_tx_lock>
    80000d96:	00000097          	auipc	ra,0x0
    80000d9a:	4d8080e7          	jalr	1240(ra) # 8000126e <acquire>

  if(panicked){
    80000d9e:	0000b797          	auipc	a5,0xb
    80000da2:	26278793          	addi	a5,a5,610 # 8000c000 <panicked>
    80000da6:	439c                	lw	a5,0(a5)
    80000da8:	2781                	sext.w	a5,a5
    80000daa:	c391                	beqz	a5,80000dae <uartputc+0x2e>
    for(;;)
    80000dac:	a001                	j	80000dac <uartputc+0x2c>
      ;
  }

  while(1){
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dae:	0000b797          	auipc	a5,0xb
    80000db2:	26278793          	addi	a5,a5,610 # 8000c010 <uart_tx_r>
    80000db6:	639c                	ld	a5,0(a5)
    80000db8:	02078713          	addi	a4,a5,32
    80000dbc:	0000b797          	auipc	a5,0xb
    80000dc0:	24c78793          	addi	a5,a5,588 # 8000c008 <uart_tx_w>
    80000dc4:	639c                	ld	a5,0(a5)
    80000dc6:	00f71f63          	bne	a4,a5,80000de4 <uartputc+0x64>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000dca:	00013597          	auipc	a1,0x13
    80000dce:	46e58593          	addi	a1,a1,1134 # 80014238 <uart_tx_lock>
    80000dd2:	0000b517          	auipc	a0,0xb
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000c010 <uart_tx_r>
    80000dda:	00002097          	auipc	ra,0x2
    80000dde:	67e080e7          	jalr	1662(ra) # 80003458 <sleep>
    80000de2:	b7f1                	j	80000dae <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000de4:	0000b797          	auipc	a5,0xb
    80000de8:	22478793          	addi	a5,a5,548 # 8000c008 <uart_tx_w>
    80000dec:	639c                	ld	a5,0(a5)
    80000dee:	8bfd                	andi	a5,a5,31
    80000df0:	fec42703          	lw	a4,-20(s0)
    80000df4:	0ff77713          	andi	a4,a4,255
    80000df8:	00013697          	auipc	a3,0x13
    80000dfc:	45868693          	addi	a3,a3,1112 # 80014250 <uart_tx_buf>
    80000e00:	97b6                	add	a5,a5,a3
    80000e02:	00e78023          	sb	a4,0(a5)
      uart_tx_w += 1;
    80000e06:	0000b797          	auipc	a5,0xb
    80000e0a:	20278793          	addi	a5,a5,514 # 8000c008 <uart_tx_w>
    80000e0e:	639c                	ld	a5,0(a5)
    80000e10:	00178713          	addi	a4,a5,1
    80000e14:	0000b797          	auipc	a5,0xb
    80000e18:	1f478793          	addi	a5,a5,500 # 8000c008 <uart_tx_w>
    80000e1c:	e398                	sd	a4,0(a5)
      uartstart();
    80000e1e:	00000097          	auipc	ra,0x0
    80000e22:	084080e7          	jalr	132(ra) # 80000ea2 <uartstart>
      release(&uart_tx_lock);
    80000e26:	00013517          	auipc	a0,0x13
    80000e2a:	41250513          	addi	a0,a0,1042 # 80014238 <uart_tx_lock>
    80000e2e:	00000097          	auipc	ra,0x0
    80000e32:	4a4080e7          	jalr	1188(ra) # 800012d2 <release>
      return;
    80000e36:	0001                	nop
    }
  }
}
    80000e38:	60e2                	ld	ra,24(sp)
    80000e3a:	6442                	ld	s0,16(sp)
    80000e3c:	6105                	addi	sp,sp,32
    80000e3e:	8082                	ret

0000000080000e40 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e40:	1101                	addi	sp,sp,-32
    80000e42:	ec06                	sd	ra,24(sp)
    80000e44:	e822                	sd	s0,16(sp)
    80000e46:	1000                	addi	s0,sp,32
    80000e48:	87aa                	mv	a5,a0
    80000e4a:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4e:	00000097          	auipc	ra,0x0
    80000e52:	51e080e7          	jalr	1310(ra) # 8000136c <push_off>

  if(panicked){
    80000e56:	0000b797          	auipc	a5,0xb
    80000e5a:	1aa78793          	addi	a5,a5,426 # 8000c000 <panicked>
    80000e5e:	439c                	lw	a5,0(a5)
    80000e60:	2781                	sext.w	a5,a5
    80000e62:	c391                	beqz	a5,80000e66 <uartputc_sync+0x26>
    for(;;)
    80000e64:	a001                	j	80000e64 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e66:	0001                	nop
    80000e68:	100007b7          	lui	a5,0x10000
    80000e6c:	0795                	addi	a5,a5,5
    80000e6e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e72:	0ff7f793          	andi	a5,a5,255
    80000e76:	2781                	sext.w	a5,a5
    80000e78:	0207f793          	andi	a5,a5,32
    80000e7c:	2781                	sext.w	a5,a5
    80000e7e:	d7ed                	beqz	a5,80000e68 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e80:	100007b7          	lui	a5,0x10000
    80000e84:	fec42703          	lw	a4,-20(s0)
    80000e88:	0ff77713          	andi	a4,a4,255
    80000e8c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e90:	00000097          	auipc	ra,0x0
    80000e94:	534080e7          	jalr	1332(ra) # 800013c4 <pop_off>
}
    80000e98:	0001                	nop
    80000e9a:	60e2                	ld	ra,24(sp)
    80000e9c:	6442                	ld	s0,16(sp)
    80000e9e:	6105                	addi	sp,sp,32
    80000ea0:	8082                	ret

0000000080000ea2 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea2:	1101                	addi	sp,sp,-32
    80000ea4:	ec06                	sd	ra,24(sp)
    80000ea6:	e822                	sd	s0,16(sp)
    80000ea8:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eaa:	0000b797          	auipc	a5,0xb
    80000eae:	15e78793          	addi	a5,a5,350 # 8000c008 <uart_tx_w>
    80000eb2:	6398                	ld	a4,0(a5)
    80000eb4:	0000b797          	auipc	a5,0xb
    80000eb8:	15c78793          	addi	a5,a5,348 # 8000c010 <uart_tx_r>
    80000ebc:	639c                	ld	a5,0(a5)
    80000ebe:	06f70a63          	beq	a4,a5,80000f32 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec2:	100007b7          	lui	a5,0x10000
    80000ec6:	0795                	addi	a5,a5,5
    80000ec8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ecc:	0ff7f793          	andi	a5,a5,255
    80000ed0:	2781                	sext.w	a5,a5
    80000ed2:	0207f793          	andi	a5,a5,32
    80000ed6:	2781                	sext.w	a5,a5
    80000ed8:	cfb9                	beqz	a5,80000f36 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000eda:	0000b797          	auipc	a5,0xb
    80000ede:	13678793          	addi	a5,a5,310 # 8000c010 <uart_tx_r>
    80000ee2:	639c                	ld	a5,0(a5)
    80000ee4:	8bfd                	andi	a5,a5,31
    80000ee6:	00013717          	auipc	a4,0x13
    80000eea:	36a70713          	addi	a4,a4,874 # 80014250 <uart_tx_buf>
    80000eee:	97ba                	add	a5,a5,a4
    80000ef0:	0007c783          	lbu	a5,0(a5)
    80000ef4:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000ef8:	0000b797          	auipc	a5,0xb
    80000efc:	11878793          	addi	a5,a5,280 # 8000c010 <uart_tx_r>
    80000f00:	639c                	ld	a5,0(a5)
    80000f02:	00178713          	addi	a4,a5,1
    80000f06:	0000b797          	auipc	a5,0xb
    80000f0a:	10a78793          	addi	a5,a5,266 # 8000c010 <uart_tx_r>
    80000f0e:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f10:	0000b517          	auipc	a0,0xb
    80000f14:	10050513          	addi	a0,a0,256 # 8000c010 <uart_tx_r>
    80000f18:	00002097          	auipc	ra,0x2
    80000f1c:	5bc080e7          	jalr	1468(ra) # 800034d4 <wakeup>
    
    WriteReg(THR, c);
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	fec42703          	lw	a4,-20(s0)
    80000f28:	0ff77713          	andi	a4,a4,255
    80000f2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f30:	bfad                	j	80000eaa <uartstart+0x8>
      return;
    80000f32:	0001                	nop
    80000f34:	a011                	j	80000f38 <uartstart+0x96>
      return;
    80000f36:	0001                	nop
  }
}
    80000f38:	60e2                	ld	ra,24(sp)
    80000f3a:	6442                	ld	s0,16(sp)
    80000f3c:	6105                	addi	sp,sp,32
    80000f3e:	8082                	ret

0000000080000f40 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f40:	1141                	addi	sp,sp,-16
    80000f42:	e422                	sd	s0,8(sp)
    80000f44:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f46:	100007b7          	lui	a5,0x10000
    80000f4a:	0795                	addi	a5,a5,5
    80000f4c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f50:	0ff7f793          	andi	a5,a5,255
    80000f54:	2781                	sext.w	a5,a5
    80000f56:	8b85                	andi	a5,a5,1
    80000f58:	2781                	sext.w	a5,a5
    80000f5a:	cb89                	beqz	a5,80000f6c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f5c:	100007b7          	lui	a5,0x10000
    80000f60:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f64:	0ff7f793          	andi	a5,a5,255
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	a011                	j	80000f6e <uartgetc+0x2e>
  } else {
    return -1;
    80000f6c:	57fd                	li	a5,-1
  }
}
    80000f6e:	853e                	mv	a0,a5
    80000f70:	6422                	ld	s0,8(sp)
    80000f72:	0141                	addi	sp,sp,16
    80000f74:	8082                	ret

0000000080000f76 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f76:	1101                	addi	sp,sp,-32
    80000f78:	ec06                	sd	ra,24(sp)
    80000f7a:	e822                	sd	s0,16(sp)
    80000f7c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f7e:	00000097          	auipc	ra,0x0
    80000f82:	fc2080e7          	jalr	-62(ra) # 80000f40 <uartgetc>
    80000f86:	87aa                	mv	a5,a0
    80000f88:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f8c:	fec42783          	lw	a5,-20(s0)
    80000f90:	0007871b          	sext.w	a4,a5
    80000f94:	57fd                	li	a5,-1
    80000f96:	00f70a63          	beq	a4,a5,80000faa <uartintr+0x34>
      break;
    consoleintr(c);
    80000f9a:	fec42783          	lw	a5,-20(s0)
    80000f9e:	853e                	mv	a0,a5
    80000fa0:	fffff097          	auipc	ra,0xfffff
    80000fa4:	64a080e7          	jalr	1610(ra) # 800005ea <consoleintr>
  while(1){
    80000fa8:	bfd9                	j	80000f7e <uartintr+0x8>
      break;
    80000faa:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fac:	00013517          	auipc	a0,0x13
    80000fb0:	28c50513          	addi	a0,a0,652 # 80014238 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00013517          	auipc	a0,0x13
    80000fc8:	27450513          	addi	a0,a0,628 # 80014238 <uart_tx_lock>
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	306080e7          	jalr	774(ra) # 800012d2 <release>
}
    80000fd4:	0001                	nop
    80000fd6:	60e2                	ld	ra,24(sp)
    80000fd8:	6442                	ld	s0,16(sp)
    80000fda:	6105                	addi	sp,sp,32
    80000fdc:	8082                	ret

0000000080000fde <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fde:	1141                	addi	sp,sp,-16
    80000fe0:	e406                	sd	ra,8(sp)
    80000fe2:	e022                	sd	s0,0(sp)
    80000fe4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000fe6:	0000a597          	auipc	a1,0xa
    80000fea:	05a58593          	addi	a1,a1,90 # 8000b040 <etext+0x40>
    80000fee:	00013517          	auipc	a0,0x13
    80000ff2:	28250513          	addi	a0,a0,642 # 80014270 <kmem>
    80000ff6:	00000097          	auipc	ra,0x0
    80000ffa:	248080e7          	jalr	584(ra) # 8000123e <initlock>
  freerange(end, (void*)PHYSTOP);
    80000ffe:	47c5                	li	a5,17
    80001000:	01b79593          	slli	a1,a5,0x1b
    80001004:	00028517          	auipc	a0,0x28
    80001008:	ffc50513          	addi	a0,a0,-4 # 80029000 <end>
    8000100c:	00000097          	auipc	ra,0x0
    80001010:	012080e7          	jalr	18(ra) # 8000101e <freerange>
}
    80001014:	0001                	nop
    80001016:	60a2                	ld	ra,8(sp)
    80001018:	6402                	ld	s0,0(sp)
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000101e:	7179                	addi	sp,sp,-48
    80001020:	f406                	sd	ra,40(sp)
    80001022:	f022                	sd	s0,32(sp)
    80001024:	1800                	addi	s0,sp,48
    80001026:	fca43c23          	sd	a0,-40(s0)
    8000102a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000102e:	fd843703          	ld	a4,-40(s0)
    80001032:	6785                	lui	a5,0x1
    80001034:	17fd                	addi	a5,a5,-1
    80001036:	973e                	add	a4,a4,a5
    80001038:	77fd                	lui	a5,0xfffff
    8000103a:	8ff9                	and	a5,a5,a4
    8000103c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001040:	a829                	j	8000105a <freerange+0x3c>
    kfree(p);
    80001042:	fe843503          	ld	a0,-24(s0)
    80001046:	00000097          	auipc	ra,0x0
    8000104a:	030080e7          	jalr	48(ra) # 80001076 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104e:	fe843703          	ld	a4,-24(s0)
    80001052:	6785                	lui	a5,0x1
    80001054:	97ba                	add	a5,a5,a4
    80001056:	fef43423          	sd	a5,-24(s0)
    8000105a:	fe843703          	ld	a4,-24(s0)
    8000105e:	6785                	lui	a5,0x1
    80001060:	97ba                	add	a5,a5,a4
    80001062:	fd043703          	ld	a4,-48(s0)
    80001066:	fcf77ee3          	bgeu	a4,a5,80001042 <freerange+0x24>
}
    8000106a:	0001                	nop
    8000106c:	0001                	nop
    8000106e:	70a2                	ld	ra,40(sp)
    80001070:	7402                	ld	s0,32(sp)
    80001072:	6145                	addi	sp,sp,48
    80001074:	8082                	ret

0000000080001076 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001076:	7179                	addi	sp,sp,-48
    80001078:	f406                	sd	ra,40(sp)
    8000107a:	f022                	sd	s0,32(sp)
    8000107c:	1800                	addi	s0,sp,48
    8000107e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001082:	fd843703          	ld	a4,-40(s0)
    80001086:	6785                	lui	a5,0x1
    80001088:	17fd                	addi	a5,a5,-1
    8000108a:	8ff9                	and	a5,a5,a4
    8000108c:	ef99                	bnez	a5,800010aa <kfree+0x34>
    8000108e:	fd843703          	ld	a4,-40(s0)
    80001092:	00028797          	auipc	a5,0x28
    80001096:	f6e78793          	addi	a5,a5,-146 # 80029000 <end>
    8000109a:	00f76863          	bltu	a4,a5,800010aa <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	47c5                	li	a5,17
    800010a4:	07ee                	slli	a5,a5,0x1b
    800010a6:	00f76a63          	bltu	a4,a5,800010ba <kfree+0x44>
    panic("kfree");
    800010aa:	0000a517          	auipc	a0,0xa
    800010ae:	f9e50513          	addi	a0,a0,-98 # 8000b048 <etext+0x48>
    800010b2:	00000097          	auipc	ra,0x0
    800010b6:	bcc080e7          	jalr	-1076(ra) # 80000c7e <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ba:	6605                	lui	a2,0x1
    800010bc:	4585                	li	a1,1
    800010be:	fd843503          	ld	a0,-40(s0)
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	380080e7          	jalr	896(ra) # 80001442 <memset>

  r = (struct run*)pa;
    800010ca:	fd843783          	ld	a5,-40(s0)
    800010ce:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010d2:	00013517          	auipc	a0,0x13
    800010d6:	19e50513          	addi	a0,a0,414 # 80014270 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00013797          	auipc	a5,0x13
    800010e6:	18e78793          	addi	a5,a5,398 # 80014270 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	17e78793          	addi	a5,a5,382 # 80014270 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00013517          	auipc	a0,0x13
    80001104:	17050513          	addi	a0,a0,368 # 80014270 <kmem>
    80001108:	00000097          	auipc	ra,0x0
    8000110c:	1ca080e7          	jalr	458(ra) # 800012d2 <release>
}
    80001110:	0001                	nop
    80001112:	70a2                	ld	ra,40(sp)
    80001114:	7402                	ld	s0,32(sp)
    80001116:	6145                	addi	sp,sp,48
    80001118:	8082                	ret

000000008000111a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000111a:	1101                	addi	sp,sp,-32
    8000111c:	ec06                	sd	ra,24(sp)
    8000111e:	e822                	sd	s0,16(sp)
    80001120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001122:	00013517          	auipc	a0,0x13
    80001126:	14e50513          	addi	a0,a0,334 # 80014270 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00013797          	auipc	a5,0x13
    80001136:	13e78793          	addi	a5,a5,318 # 80014270 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00013797          	auipc	a5,0x13
    80001150:	12478793          	addi	a5,a5,292 # 80014270 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00013517          	auipc	a0,0x13
    8000115a:	11a50513          	addi	a0,a0,282 # 80014270 <kmem>
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	174080e7          	jalr	372(ra) # 800012d2 <release>

  if(r)
    80001166:	fe843783          	ld	a5,-24(s0)
    8000116a:	cb89                	beqz	a5,8000117c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000116c:	6605                	lui	a2,0x1
    8000116e:	4595                	li	a1,5
    80001170:	fe843503          	ld	a0,-24(s0)
    80001174:	00000097          	auipc	ra,0x0
    80001178:	2ce080e7          	jalr	718(ra) # 80001442 <memset>
  return (void*)r;
    8000117c:	fe843783          	ld	a5,-24(s0)
}
    80001180:	853e                	mv	a0,a5
    80001182:	60e2                	ld	ra,24(sp)
    80001184:	6442                	ld	s0,16(sp)
    80001186:	6105                	addi	sp,sp,32
    80001188:	8082                	ret

000000008000118a <r_sstatus>:
{
    8000118a:	1101                	addi	sp,sp,-32
    8000118c:	ec22                	sd	s0,24(sp)
    8000118e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001190:	100027f3          	csrr	a5,sstatus
    80001194:	fef43423          	sd	a5,-24(s0)
  return x;
    80001198:	fe843783          	ld	a5,-24(s0)
}
    8000119c:	853e                	mv	a0,a5
    8000119e:	6462                	ld	s0,24(sp)
    800011a0:	6105                	addi	sp,sp,32
    800011a2:	8082                	ret

00000000800011a4 <w_sstatus>:
{
    800011a4:	1101                	addi	sp,sp,-32
    800011a6:	ec22                	sd	s0,24(sp)
    800011a8:	1000                	addi	s0,sp,32
    800011aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	10079073          	csrw	sstatus,a5
}
    800011b6:	0001                	nop
    800011b8:	6462                	ld	s0,24(sp)
    800011ba:	6105                	addi	sp,sp,32
    800011bc:	8082                	ret

00000000800011be <intr_on>:
{
    800011be:	1141                	addi	sp,sp,-16
    800011c0:	e406                	sd	ra,8(sp)
    800011c2:	e022                	sd	s0,0(sp)
    800011c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	fc4080e7          	jalr	-60(ra) # 8000118a <r_sstatus>
    800011ce:	87aa                	mv	a5,a0
    800011d0:	0027e793          	ori	a5,a5,2
    800011d4:	853e                	mv	a0,a5
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fce080e7          	jalr	-50(ra) # 800011a4 <w_sstatus>
}
    800011de:	0001                	nop
    800011e0:	60a2                	ld	ra,8(sp)
    800011e2:	6402                	ld	s0,0(sp)
    800011e4:	0141                	addi	sp,sp,16
    800011e6:	8082                	ret

00000000800011e8 <intr_off>:
{
    800011e8:	1141                	addi	sp,sp,-16
    800011ea:	e406                	sd	ra,8(sp)
    800011ec:	e022                	sd	s0,0(sp)
    800011ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	f9a080e7          	jalr	-102(ra) # 8000118a <r_sstatus>
    800011f8:	87aa                	mv	a5,a0
    800011fa:	9bf5                	andi	a5,a5,-3
    800011fc:	853e                	mv	a0,a5
    800011fe:	00000097          	auipc	ra,0x0
    80001202:	fa6080e7          	jalr	-90(ra) # 800011a4 <w_sstatus>
}
    80001206:	0001                	nop
    80001208:	60a2                	ld	ra,8(sp)
    8000120a:	6402                	ld	s0,0(sp)
    8000120c:	0141                	addi	sp,sp,16
    8000120e:	8082                	ret

0000000080001210 <intr_get>:
{
    80001210:	1101                	addi	sp,sp,-32
    80001212:	ec06                	sd	ra,24(sp)
    80001214:	e822                	sd	s0,16(sp)
    80001216:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f72080e7          	jalr	-142(ra) # 8000118a <r_sstatus>
    80001220:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001224:	fe843783          	ld	a5,-24(s0)
    80001228:	8b89                	andi	a5,a5,2
    8000122a:	00f037b3          	snez	a5,a5
    8000122e:	0ff7f793          	andi	a5,a5,255
    80001232:	2781                	sext.w	a5,a5
}
    80001234:	853e                	mv	a0,a5
    80001236:	60e2                	ld	ra,24(sp)
    80001238:	6442                	ld	s0,16(sp)
    8000123a:	6105                	addi	sp,sp,32
    8000123c:	8082                	ret

000000008000123e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000123e:	1101                	addi	sp,sp,-32
    80001240:	ec22                	sd	s0,24(sp)
    80001242:	1000                	addi	s0,sp,32
    80001244:	fea43423          	sd	a0,-24(s0)
    80001248:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000124c:	fe843783          	ld	a5,-24(s0)
    80001250:	fe043703          	ld	a4,-32(s0)
    80001254:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	0007b823          	sd	zero,16(a5)
}
    80001266:	0001                	nop
    80001268:	6462                	ld	s0,24(sp)
    8000126a:	6105                	addi	sp,sp,32
    8000126c:	8082                	ret

000000008000126e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000126e:	1101                	addi	sp,sp,-32
    80001270:	ec06                	sd	ra,24(sp)
    80001272:	e822                	sd	s0,16(sp)
    80001274:	1000                	addi	s0,sp,32
    80001276:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000127a:	00000097          	auipc	ra,0x0
    8000127e:	0f2080e7          	jalr	242(ra) # 8000136c <push_off>
  if(holding(lk))
    80001282:	fe843503          	ld	a0,-24(s0)
    80001286:	00000097          	auipc	ra,0x0
    8000128a:	0a2080e7          	jalr	162(ra) # 80001328 <holding>
    8000128e:	87aa                	mv	a5,a0
    80001290:	cb89                	beqz	a5,800012a2 <acquire+0x34>
    panic("acquire");
    80001292:	0000a517          	auipc	a0,0xa
    80001296:	dbe50513          	addi	a0,a0,-578 # 8000b050 <etext+0x50>
    8000129a:	00000097          	auipc	ra,0x0
    8000129e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012a2:	0001                	nop
    800012a4:	fe843783          	ld	a5,-24(s0)
    800012a8:	4705                	li	a4,1
    800012aa:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012ae:	0007079b          	sext.w	a5,a4
    800012b2:	fbed                	bnez	a5,800012a4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012b4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012b8:	00001097          	auipc	ra,0x1
    800012bc:	522080e7          	jalr	1314(ra) # 800027da <mycpu>
    800012c0:	872a                	mv	a4,a0
    800012c2:	fe843783          	ld	a5,-24(s0)
    800012c6:	eb98                	sd	a4,16(a5)
}
    800012c8:	0001                	nop
    800012ca:	60e2                	ld	ra,24(sp)
    800012cc:	6442                	ld	s0,16(sp)
    800012ce:	6105                	addi	sp,sp,32
    800012d0:	8082                	ret

00000000800012d2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
    800012da:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012de:	fe843503          	ld	a0,-24(s0)
    800012e2:	00000097          	auipc	ra,0x0
    800012e6:	046080e7          	jalr	70(ra) # 80001328 <holding>
    800012ea:	87aa                	mv	a5,a0
    800012ec:	eb89                	bnez	a5,800012fe <release+0x2c>
    panic("release");
    800012ee:	0000a517          	auipc	a0,0xa
    800012f2:	d6a50513          	addi	a0,a0,-662 # 8000b058 <etext+0x58>
    800012f6:	00000097          	auipc	ra,0x0
    800012fa:	988080e7          	jalr	-1656(ra) # 80000c7e <panic>

  lk->cpu = 0;
    800012fe:	fe843783          	ld	a5,-24(s0)
    80001302:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001306:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000130a:	fe843783          	ld	a5,-24(s0)
    8000130e:	0f50000f          	fence	iorw,ow
    80001312:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001316:	00000097          	auipc	ra,0x0
    8000131a:	0ae080e7          	jalr	174(ra) # 800013c4 <pop_off>
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001328:	7139                	addi	sp,sp,-64
    8000132a:	fc06                	sd	ra,56(sp)
    8000132c:	f822                	sd	s0,48(sp)
    8000132e:	f426                	sd	s1,40(sp)
    80001330:	0080                	addi	s0,sp,64
    80001332:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001336:	fc843783          	ld	a5,-56(s0)
    8000133a:	439c                	lw	a5,0(a5)
    8000133c:	cf89                	beqz	a5,80001356 <holding+0x2e>
    8000133e:	fc843783          	ld	a5,-56(s0)
    80001342:	6b84                	ld	s1,16(a5)
    80001344:	00001097          	auipc	ra,0x1
    80001348:	496080e7          	jalr	1174(ra) # 800027da <mycpu>
    8000134c:	87aa                	mv	a5,a0
    8000134e:	00f49463          	bne	s1,a5,80001356 <holding+0x2e>
    80001352:	4785                	li	a5,1
    80001354:	a011                	j	80001358 <holding+0x30>
    80001356:	4781                	li	a5,0
    80001358:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000135c:	fdc42783          	lw	a5,-36(s0)
}
    80001360:	853e                	mv	a0,a5
    80001362:	70e2                	ld	ra,56(sp)
    80001364:	7442                	ld	s0,48(sp)
    80001366:	74a2                	ld	s1,40(sp)
    80001368:	6121                	addi	sp,sp,64
    8000136a:	8082                	ret

000000008000136c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000136c:	1101                	addi	sp,sp,-32
    8000136e:	ec06                	sd	ra,24(sp)
    80001370:	e822                	sd	s0,16(sp)
    80001372:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001374:	00000097          	auipc	ra,0x0
    80001378:	e9c080e7          	jalr	-356(ra) # 80001210 <intr_get>
    8000137c:	87aa                	mv	a5,a0
    8000137e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001382:	00000097          	auipc	ra,0x0
    80001386:	e66080e7          	jalr	-410(ra) # 800011e8 <intr_off>
  if(mycpu()->noff == 0)
    8000138a:	00001097          	auipc	ra,0x1
    8000138e:	450080e7          	jalr	1104(ra) # 800027da <mycpu>
    80001392:	87aa                	mv	a5,a0
    80001394:	5fbc                	lw	a5,120(a5)
    80001396:	eb89                	bnez	a5,800013a8 <push_off+0x3c>
    mycpu()->intena = old;
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	442080e7          	jalr	1090(ra) # 800027da <mycpu>
    800013a0:	872a                	mv	a4,a0
    800013a2:	fec42783          	lw	a5,-20(s0)
    800013a6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	432080e7          	jalr	1074(ra) # 800027da <mycpu>
    800013b0:	87aa                	mv	a5,a0
    800013b2:	5fb8                	lw	a4,120(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	2701                	sext.w	a4,a4
    800013b8:	dfb8                	sw	a4,120(a5)
}
    800013ba:	0001                	nop
    800013bc:	60e2                	ld	ra,24(sp)
    800013be:	6442                	ld	s0,16(sp)
    800013c0:	6105                	addi	sp,sp,32
    800013c2:	8082                	ret

00000000800013c4 <pop_off>:

void
pop_off(void)
{
    800013c4:	1101                	addi	sp,sp,-32
    800013c6:	ec06                	sd	ra,24(sp)
    800013c8:	e822                	sd	s0,16(sp)
    800013ca:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	40e080e7          	jalr	1038(ra) # 800027da <mycpu>
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e38080e7          	jalr	-456(ra) # 80001210 <intr_get>
    800013e0:	87aa                	mv	a5,a0
    800013e2:	cb89                	beqz	a5,800013f4 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013e4:	0000a517          	auipc	a0,0xa
    800013e8:	c7c50513          	addi	a0,a0,-900 # 8000b060 <etext+0x60>
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	892080e7          	jalr	-1902(ra) # 80000c7e <panic>
  if(c->noff < 1)
    800013f4:	fe843783          	ld	a5,-24(s0)
    800013f8:	5fbc                	lw	a5,120(a5)
    800013fa:	00f04a63          	bgtz	a5,8000140e <pop_off+0x4a>
    panic("pop_off");
    800013fe:	0000a517          	auipc	a0,0xa
    80001402:	c7a50513          	addi	a0,a0,-902 # 8000b078 <etext+0x78>
    80001406:	00000097          	auipc	ra,0x0
    8000140a:	878080e7          	jalr	-1928(ra) # 80000c7e <panic>
  c->noff -= 1;
    8000140e:	fe843783          	ld	a5,-24(s0)
    80001412:	5fbc                	lw	a5,120(a5)
    80001414:	37fd                	addiw	a5,a5,-1
    80001416:	0007871b          	sext.w	a4,a5
    8000141a:	fe843783          	ld	a5,-24(s0)
    8000141e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	eb89                	bnez	a5,80001438 <pop_off+0x74>
    80001428:	fe843783          	ld	a5,-24(s0)
    8000142c:	5ffc                	lw	a5,124(a5)
    8000142e:	c789                	beqz	a5,80001438 <pop_off+0x74>
    intr_on();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	d8e080e7          	jalr	-626(ra) # 800011be <intr_on>
}
    80001438:	0001                	nop
    8000143a:	60e2                	ld	ra,24(sp)
    8000143c:	6442                	ld	s0,16(sp)
    8000143e:	6105                	addi	sp,sp,32
    80001440:	8082                	ret

0000000080001442 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001442:	7179                	addi	sp,sp,-48
    80001444:	f422                	sd	s0,40(sp)
    80001446:	1800                	addi	s0,sp,48
    80001448:	fca43c23          	sd	a0,-40(s0)
    8000144c:	87ae                	mv	a5,a1
    8000144e:	8732                	mv	a4,a2
    80001450:	fcf42a23          	sw	a5,-44(s0)
    80001454:	87ba                	mv	a5,a4
    80001456:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000145a:	fd843783          	ld	a5,-40(s0)
    8000145e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001462:	fe042623          	sw	zero,-20(s0)
    80001466:	a00d                	j	80001488 <memset+0x46>
    cdst[i] = c;
    80001468:	fec42783          	lw	a5,-20(s0)
    8000146c:	fe043703          	ld	a4,-32(s0)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	fd442703          	lw	a4,-44(s0)
    80001476:	0ff77713          	andi	a4,a4,255
    8000147a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000147e:	fec42783          	lw	a5,-20(s0)
    80001482:	2785                	addiw	a5,a5,1
    80001484:	fef42623          	sw	a5,-20(s0)
    80001488:	fec42703          	lw	a4,-20(s0)
    8000148c:	fd042783          	lw	a5,-48(s0)
    80001490:	2781                	sext.w	a5,a5
    80001492:	fcf76be3          	bltu	a4,a5,80001468 <memset+0x26>
  }
  return dst;
    80001496:	fd843783          	ld	a5,-40(s0)
}
    8000149a:	853e                	mv	a0,a5
    8000149c:	7422                	ld	s0,40(sp)
    8000149e:	6145                	addi	sp,sp,48
    800014a0:	8082                	ret

00000000800014a2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014a2:	7139                	addi	sp,sp,-64
    800014a4:	fc22                	sd	s0,56(sp)
    800014a6:	0080                	addi	s0,sp,64
    800014a8:	fca43c23          	sd	a0,-40(s0)
    800014ac:	fcb43823          	sd	a1,-48(s0)
    800014b0:	87b2                	mv	a5,a2
    800014b2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014b6:	fd843783          	ld	a5,-40(s0)
    800014ba:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014be:	fd043783          	ld	a5,-48(s0)
    800014c2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014c6:	a0a1                	j	8000150e <memcmp+0x6c>
    if(*s1 != *s2)
    800014c8:	fe843783          	ld	a5,-24(s0)
    800014cc:	0007c703          	lbu	a4,0(a5)
    800014d0:	fe043783          	ld	a5,-32(s0)
    800014d4:	0007c783          	lbu	a5,0(a5)
    800014d8:	02f70163          	beq	a4,a5,800014fa <memcmp+0x58>
      return *s1 - *s2;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	0007c783          	lbu	a5,0(a5)
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe043783          	ld	a5,-32(s0)
    800014ec:	0007c783          	lbu	a5,0(a5)
    800014f0:	2781                	sext.w	a5,a5
    800014f2:	40f707bb          	subw	a5,a4,a5
    800014f6:	2781                	sext.w	a5,a5
    800014f8:	a01d                	j	8000151e <memcmp+0x7c>
    s1++, s2++;
    800014fa:	fe843783          	ld	a5,-24(s0)
    800014fe:	0785                	addi	a5,a5,1
    80001500:	fef43423          	sd	a5,-24(s0)
    80001504:	fe043783          	ld	a5,-32(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000150e:	fcc42783          	lw	a5,-52(s0)
    80001512:	fff7871b          	addiw	a4,a5,-1
    80001516:	fce42623          	sw	a4,-52(s0)
    8000151a:	f7dd                	bnez	a5,800014c8 <memcmp+0x26>
  }

  return 0;
    8000151c:	4781                	li	a5,0
}
    8000151e:	853e                	mv	a0,a5
    80001520:	7462                	ld	s0,56(sp)
    80001522:	6121                	addi	sp,sp,64
    80001524:	8082                	ret

0000000080001526 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001526:	7139                	addi	sp,sp,-64
    80001528:	fc22                	sd	s0,56(sp)
    8000152a:	0080                	addi	s0,sp,64
    8000152c:	fca43c23          	sd	a0,-40(s0)
    80001530:	fcb43823          	sd	a1,-48(s0)
    80001534:	87b2                	mv	a5,a2
    80001536:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000153a:	fcc42783          	lw	a5,-52(s0)
    8000153e:	2781                	sext.w	a5,a5
    80001540:	e781                	bnez	a5,80001548 <memmove+0x22>
    return dst;
    80001542:	fd843783          	ld	a5,-40(s0)
    80001546:	a855                	j	800015fa <memmove+0xd4>
  
  s = src;
    80001548:	fd043783          	ld	a5,-48(s0)
    8000154c:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001550:	fd843783          	ld	a5,-40(s0)
    80001554:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001558:	fe843703          	ld	a4,-24(s0)
    8000155c:	fe043783          	ld	a5,-32(s0)
    80001560:	08f77463          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    80001564:	fcc46783          	lwu	a5,-52(s0)
    80001568:	fe843703          	ld	a4,-24(s0)
    8000156c:	97ba                	add	a5,a5,a4
    8000156e:	fe043703          	ld	a4,-32(s0)
    80001572:	06f77b63          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    s += n;
    80001576:	fcc46783          	lwu	a5,-52(s0)
    8000157a:	fe843703          	ld	a4,-24(s0)
    8000157e:	97ba                	add	a5,a5,a4
    80001580:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001584:	fcc46783          	lwu	a5,-52(s0)
    80001588:	fe043703          	ld	a4,-32(s0)
    8000158c:	97ba                	add	a5,a5,a4
    8000158e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001592:	a01d                	j	800015b8 <memmove+0x92>
      *--d = *--s;
    80001594:	fe843783          	ld	a5,-24(s0)
    80001598:	17fd                	addi	a5,a5,-1
    8000159a:	fef43423          	sd	a5,-24(s0)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43023          	sd	a5,-32(s0)
    800015a8:	fe843783          	ld	a5,-24(s0)
    800015ac:	0007c703          	lbu	a4,0(a5)
    800015b0:	fe043783          	ld	a5,-32(s0)
    800015b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015b8:	fcc42783          	lw	a5,-52(s0)
    800015bc:	fff7871b          	addiw	a4,a5,-1
    800015c0:	fce42623          	sw	a4,-52(s0)
    800015c4:	fbe1                	bnez	a5,80001594 <memmove+0x6e>
  if(s < d && s + n > d){
    800015c6:	a805                	j	800015f6 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	00170793          	addi	a5,a4,1
    800015d0:	fef43423          	sd	a5,-24(s0)
    800015d4:	fe043783          	ld	a5,-32(s0)
    800015d8:	00178693          	addi	a3,a5,1
    800015dc:	fed43023          	sd	a3,-32(s0)
    800015e0:	00074703          	lbu	a4,0(a4)
    800015e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015e8:	fcc42783          	lw	a5,-52(s0)
    800015ec:	fff7871b          	addiw	a4,a5,-1
    800015f0:	fce42623          	sw	a4,-52(s0)
    800015f4:	fbf1                	bnez	a5,800015c8 <memmove+0xa2>

  return dst;
    800015f6:	fd843783          	ld	a5,-40(s0)
}
    800015fa:	853e                	mv	a0,a5
    800015fc:	7462                	ld	s0,56(sp)
    800015fe:	6121                	addi	sp,sp,64
    80001600:	8082                	ret

0000000080001602 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001602:	7179                	addi	sp,sp,-48
    80001604:	f406                	sd	ra,40(sp)
    80001606:	f022                	sd	s0,32(sp)
    80001608:	1800                	addi	s0,sp,48
    8000160a:	fea43423          	sd	a0,-24(s0)
    8000160e:	feb43023          	sd	a1,-32(s0)
    80001612:	87b2                	mv	a5,a2
    80001614:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001618:	fdc42783          	lw	a5,-36(s0)
    8000161c:	863e                	mv	a2,a5
    8000161e:	fe043583          	ld	a1,-32(s0)
    80001622:	fe843503          	ld	a0,-24(s0)
    80001626:	00000097          	auipc	ra,0x0
    8000162a:	f00080e7          	jalr	-256(ra) # 80001526 <memmove>
    8000162e:	87aa                	mv	a5,a0
}
    80001630:	853e                	mv	a0,a5
    80001632:	70a2                	ld	ra,40(sp)
    80001634:	7402                	ld	s0,32(sp)
    80001636:	6145                	addi	sp,sp,48
    80001638:	8082                	ret

000000008000163a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163a:	7179                	addi	sp,sp,-48
    8000163c:	f422                	sd	s0,40(sp)
    8000163e:	1800                	addi	s0,sp,48
    80001640:	fea43423          	sd	a0,-24(s0)
    80001644:	feb43023          	sd	a1,-32(s0)
    80001648:	87b2                	mv	a5,a2
    8000164a:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000164e:	a005                	j	8000166e <strncmp+0x34>
    n--, p++, q++;
    80001650:	fdc42783          	lw	a5,-36(s0)
    80001654:	37fd                	addiw	a5,a5,-1
    80001656:	fcf42e23          	sw	a5,-36(s0)
    8000165a:	fe843783          	ld	a5,-24(s0)
    8000165e:	0785                	addi	a5,a5,1
    80001660:	fef43423          	sd	a5,-24(s0)
    80001664:	fe043783          	ld	a5,-32(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000166e:	fdc42783          	lw	a5,-36(s0)
    80001672:	2781                	sext.w	a5,a5
    80001674:	c385                	beqz	a5,80001694 <strncmp+0x5a>
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c783          	lbu	a5,0(a5)
    8000167e:	cb99                	beqz	a5,80001694 <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c703          	lbu	a4,0(a5)
    80001688:	fe043783          	ld	a5,-32(s0)
    8000168c:	0007c783          	lbu	a5,0(a5)
    80001690:	fcf700e3          	beq	a4,a5,80001650 <strncmp+0x16>
  if(n == 0)
    80001694:	fdc42783          	lw	a5,-36(s0)
    80001698:	2781                	sext.w	a5,a5
    8000169a:	e399                	bnez	a5,800016a0 <strncmp+0x66>
    return 0;
    8000169c:	4781                	li	a5,0
    8000169e:	a839                	j	800016bc <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a0:	fe843783          	ld	a5,-24(s0)
    800016a4:	0007c783          	lbu	a5,0(a5)
    800016a8:	0007871b          	sext.w	a4,a5
    800016ac:	fe043783          	ld	a5,-32(s0)
    800016b0:	0007c783          	lbu	a5,0(a5)
    800016b4:	2781                	sext.w	a5,a5
    800016b6:	40f707bb          	subw	a5,a4,a5
    800016ba:	2781                	sext.w	a5,a5
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7422                	ld	s0,40(sp)
    800016c0:	6145                	addi	sp,sp,48
    800016c2:	8082                	ret

00000000800016c4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c4:	7139                	addi	sp,sp,-64
    800016c6:	fc22                	sd	s0,56(sp)
    800016c8:	0080                	addi	s0,sp,64
    800016ca:	fca43c23          	sd	a0,-40(s0)
    800016ce:	fcb43823          	sd	a1,-48(s0)
    800016d2:	87b2                	mv	a5,a2
    800016d4:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016d8:	fd843783          	ld	a5,-40(s0)
    800016dc:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e0:	0001                	nop
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	02f05e63          	blez	a5,8000172a <strncpy+0x66>
    800016f2:	fd043703          	ld	a4,-48(s0)
    800016f6:	00170793          	addi	a5,a4,1
    800016fa:	fcf43823          	sd	a5,-48(s0)
    800016fe:	fd843783          	ld	a5,-40(s0)
    80001702:	00178693          	addi	a3,a5,1
    80001706:	fcd43c23          	sd	a3,-40(s0)
    8000170a:	00074703          	lbu	a4,0(a4)
    8000170e:	00e78023          	sb	a4,0(a5)
    80001712:	0007c783          	lbu	a5,0(a5)
    80001716:	f7f1                	bnez	a5,800016e2 <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001718:	a809                	j	8000172a <strncpy+0x66>
    *s++ = 0;
    8000171a:	fd843783          	ld	a5,-40(s0)
    8000171e:	00178713          	addi	a4,a5,1
    80001722:	fce43c23          	sd	a4,-40(s0)
    80001726:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172a:	fcc42783          	lw	a5,-52(s0)
    8000172e:	fff7871b          	addiw	a4,a5,-1
    80001732:	fce42623          	sw	a4,-52(s0)
    80001736:	fef042e3          	bgtz	a5,8000171a <strncpy+0x56>
  return os;
    8000173a:	fe843783          	ld	a5,-24(s0)
}
    8000173e:	853e                	mv	a0,a5
    80001740:	7462                	ld	s0,56(sp)
    80001742:	6121                	addi	sp,sp,64
    80001744:	8082                	ret

0000000080001746 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001746:	7139                	addi	sp,sp,-64
    80001748:	fc22                	sd	s0,56(sp)
    8000174a:	0080                	addi	s0,sp,64
    8000174c:	fca43c23          	sd	a0,-40(s0)
    80001750:	fcb43823          	sd	a1,-48(s0)
    80001754:	87b2                	mv	a5,a2
    80001756:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175a:	fd843783          	ld	a5,-40(s0)
    8000175e:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001762:	fcc42783          	lw	a5,-52(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	00f04563          	bgtz	a5,80001772 <safestrcpy+0x2c>
    return os;
    8000176c:	fe843783          	ld	a5,-24(s0)
    80001770:	a0a1                	j	800017b8 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001772:	fcc42783          	lw	a5,-52(s0)
    80001776:	37fd                	addiw	a5,a5,-1
    80001778:	fcf42623          	sw	a5,-52(s0)
    8000177c:	fcc42783          	lw	a5,-52(s0)
    80001780:	2781                	sext.w	a5,a5
    80001782:	02f05563          	blez	a5,800017ac <safestrcpy+0x66>
    80001786:	fd043703          	ld	a4,-48(s0)
    8000178a:	00170793          	addi	a5,a4,1
    8000178e:	fcf43823          	sd	a5,-48(s0)
    80001792:	fd843783          	ld	a5,-40(s0)
    80001796:	00178693          	addi	a3,a5,1
    8000179a:	fcd43c23          	sd	a3,-40(s0)
    8000179e:	00074703          	lbu	a4,0(a4)
    800017a2:	00e78023          	sb	a4,0(a5)
    800017a6:	0007c783          	lbu	a5,0(a5)
    800017aa:	f7e1                	bnez	a5,80001772 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ac:	fd843783          	ld	a5,-40(s0)
    800017b0:	00078023          	sb	zero,0(a5)
  return os;
    800017b4:	fe843783          	ld	a5,-24(s0)
}
    800017b8:	853e                	mv	a0,a5
    800017ba:	7462                	ld	s0,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <strlen>:

int
strlen(const char *s)
{
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f422                	sd	s0,40(sp)
    800017c4:	1800                	addi	s0,sp,48
    800017c6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ca:	fe042623          	sw	zero,-20(s0)
    800017ce:	a031                	j	800017da <strlen+0x1a>
    800017d0:	fec42783          	lw	a5,-20(s0)
    800017d4:	2785                	addiw	a5,a5,1
    800017d6:	fef42623          	sw	a5,-20(s0)
    800017da:	fec42783          	lw	a5,-20(s0)
    800017de:	fd843703          	ld	a4,-40(s0)
    800017e2:	97ba                	add	a5,a5,a4
    800017e4:	0007c783          	lbu	a5,0(a5)
    800017e8:	f7e5                	bnez	a5,800017d0 <strlen+0x10>
    ;
  return n;
    800017ea:	fec42783          	lw	a5,-20(s0)
}
    800017ee:	853e                	mv	a0,a5
    800017f0:	7422                	ld	s0,40(sp)
    800017f2:	6145                	addi	sp,sp,48
    800017f4:	8082                	ret

00000000800017f6 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f6:	1141                	addi	sp,sp,-16
    800017f8:	e406                	sd	ra,8(sp)
    800017fa:	e022                	sd	s0,0(sp)
    800017fc:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800017fe:	00001097          	auipc	ra,0x1
    80001802:	fb8080e7          	jalr	-72(ra) # 800027b6 <cpuid>
    80001806:	87aa                	mv	a5,a0
    80001808:	efd5                	bnez	a5,800018c4 <main+0xce>
    consoleinit();
    8000180a:	fffff097          	auipc	ra,0xfffff
    8000180e:	048080e7          	jalr	72(ra) # 80000852 <consoleinit>
    printfinit();
    80001812:	fffff097          	auipc	ra,0xfffff
    80001816:	4be080e7          	jalr	1214(ra) # 80000cd0 <printfinit>
    printf("\n");
    8000181a:	0000a517          	auipc	a0,0xa
    8000181e:	86650513          	addi	a0,a0,-1946 # 8000b080 <etext+0x80>
    80001822:	fffff097          	auipc	ra,0xfffff
    80001826:	206080e7          	jalr	518(ra) # 80000a28 <printf>
    printf("xv6 kernel is booting\n");
    8000182a:	0000a517          	auipc	a0,0xa
    8000182e:	85e50513          	addi	a0,a0,-1954 # 8000b088 <etext+0x88>
    80001832:	fffff097          	auipc	ra,0xfffff
    80001836:	1f6080e7          	jalr	502(ra) # 80000a28 <printf>
    printf("\n");
    8000183a:	0000a517          	auipc	a0,0xa
    8000183e:	84650513          	addi	a0,a0,-1978 # 8000b080 <etext+0x80>
    80001842:	fffff097          	auipc	ra,0xfffff
    80001846:	1e6080e7          	jalr	486(ra) # 80000a28 <printf>
    kinit();         // physical page allocator
    8000184a:	fffff097          	auipc	ra,0xfffff
    8000184e:	794080e7          	jalr	1940(ra) # 80000fde <kinit>
    kvminit();       // create kernel page table
    80001852:	00000097          	auipc	ra,0x0
    80001856:	1f4080e7          	jalr	500(ra) # 80001a46 <kvminit>
    kvminithart();   // turn on paging
    8000185a:	00000097          	auipc	ra,0x0
    8000185e:	212080e7          	jalr	530(ra) # 80001a6c <kvminithart>
    procinit();      // process table
    80001862:	00001097          	auipc	ra,0x1
    80001866:	e8e080e7          	jalr	-370(ra) # 800026f0 <procinit>
    trapinit();      // trap vectors
    8000186a:	00002097          	auipc	ra,0x2
    8000186e:	176080e7          	jalr	374(ra) # 800039e0 <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00002097          	auipc	ra,0x2
    80001876:	198080e7          	jalr	408(ra) # 80003a0a <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00007097          	auipc	ra,0x7
    8000187e:	f90080e7          	jalr	-112(ra) # 8000880a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00007097          	auipc	ra,0x7
    80001886:	fac080e7          	jalr	-84(ra) # 8000882e <plicinithart>
    binit();         // buffer cache
    8000188a:	00003097          	auipc	ra,0x3
    8000188e:	ba8080e7          	jalr	-1112(ra) # 80004432 <binit>
    iinit();         // inode table
    80001892:	00003097          	auipc	ra,0x3
    80001896:	3f4080e7          	jalr	1012(ra) # 80004c86 <iinit>
    fileinit();      // file table
    8000189a:	00005097          	auipc	ra,0x5
    8000189e:	d96080e7          	jalr	-618(ra) # 80006630 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00007097          	auipc	ra,0x7
    800018a6:	060080e7          	jalr	96(ra) # 80008902 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	2ea080e7          	jalr	746(ra) # 80002b94 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00013797          	auipc	a5,0x13
    800018ba:	9da78793          	addi	a5,a5,-1574 # 80014290 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00013797          	auipc	a5,0x13
    800018ca:	9ca78793          	addi	a5,a5,-1590 # 80014290 <started>
    800018ce:	439c                	lw	a5,0(a5)
    800018d0:	2781                	sext.w	a5,a5
    800018d2:	dbf5                	beqz	a5,800018c6 <main+0xd0>
      ;
    __sync_synchronize();
    800018d4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	ede080e7          	jalr	-290(ra) # 800027b6 <cpuid>
    800018e0:	87aa                	mv	a5,a0
    800018e2:	85be                	mv	a1,a5
    800018e4:	00009517          	auipc	a0,0x9
    800018e8:	7bc50513          	addi	a0,a0,1980 # 8000b0a0 <etext+0xa0>
    800018ec:	fffff097          	auipc	ra,0xfffff
    800018f0:	13c080e7          	jalr	316(ra) # 80000a28 <printf>
    kvminithart();    // turn on paging
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	178080e7          	jalr	376(ra) # 80001a6c <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	10e080e7          	jalr	270(ra) # 80003a0a <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00007097          	auipc	ra,0x7
    80001908:	f2a080e7          	jalr	-214(ra) # 8000882e <plicinithart>
  }

  scheduler();        
    8000190c:	00002097          	auipc	ra,0x2
    80001910:	940080e7          	jalr	-1728(ra) # 8000324c <scheduler>

0000000080001914 <w_satp>:
{
    80001914:	1101                	addi	sp,sp,-32
    80001916:	ec22                	sd	s0,24(sp)
    80001918:	1000                	addi	s0,sp,32
    8000191a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000191e:	fe843783          	ld	a5,-24(s0)
    80001922:	18079073          	csrw	satp,a5
}
    80001926:	0001                	nop
    80001928:	6462                	ld	s0,24(sp)
    8000192a:	6105                	addi	sp,sp,32
    8000192c:	8082                	ret

000000008000192e <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000192e:	1141                	addi	sp,sp,-16
    80001930:	e422                	sd	s0,8(sp)
    80001932:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001934:	12000073          	sfence.vma
}
    80001938:	0001                	nop
    8000193a:	6422                	ld	s0,8(sp)
    8000193c:	0141                	addi	sp,sp,16
    8000193e:	8082                	ret

0000000080001940 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001940:	1101                	addi	sp,sp,-32
    80001942:	ec06                	sd	ra,24(sp)
    80001944:	e822                	sd	s0,16(sp)
    80001946:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001948:	fffff097          	auipc	ra,0xfffff
    8000194c:	7d2080e7          	jalr	2002(ra) # 8000111a <kalloc>
    80001950:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001954:	6605                	lui	a2,0x1
    80001956:	4581                	li	a1,0
    80001958:	fe843503          	ld	a0,-24(s0)
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ae6080e7          	jalr	-1306(ra) # 80001442 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001964:	4719                	li	a4,6
    80001966:	6685                	lui	a3,0x1
    80001968:	10000637          	lui	a2,0x10000
    8000196c:	100005b7          	lui	a1,0x10000
    80001970:	fe843503          	ld	a0,-24(s0)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	298080e7          	jalr	664(ra) # 80001c0c <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197c:	4719                	li	a4,6
    8000197e:	6685                	lui	a3,0x1
    80001980:	10001637          	lui	a2,0x10001
    80001984:	100015b7          	lui	a1,0x10001
    80001988:	fe843503          	ld	a0,-24(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	280080e7          	jalr	640(ra) # 80001c0c <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001994:	4719                	li	a4,6
    80001996:	004006b7          	lui	a3,0x400
    8000199a:	0c000637          	lui	a2,0xc000
    8000199e:	0c0005b7          	lui	a1,0xc000
    800019a2:	fe843503          	ld	a0,-24(s0)
    800019a6:	00000097          	auipc	ra,0x0
    800019aa:	266080e7          	jalr	614(ra) # 80001c0c <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ae:	00009717          	auipc	a4,0x9
    800019b2:	65270713          	addi	a4,a4,1618 # 8000b000 <etext>
    800019b6:	800007b7          	lui	a5,0x80000
    800019ba:	97ba                	add	a5,a5,a4
    800019bc:	4729                	li	a4,10
    800019be:	86be                	mv	a3,a5
    800019c0:	4785                	li	a5,1
    800019c2:	01f79613          	slli	a2,a5,0x1f
    800019c6:	4785                	li	a5,1
    800019c8:	01f79593          	slli	a1,a5,0x1f
    800019cc:	fe843503          	ld	a0,-24(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	23c080e7          	jalr	572(ra) # 80001c0c <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019d8:	00009597          	auipc	a1,0x9
    800019dc:	62858593          	addi	a1,a1,1576 # 8000b000 <etext>
    800019e0:	00009617          	auipc	a2,0x9
    800019e4:	62060613          	addi	a2,a2,1568 # 8000b000 <etext>
    800019e8:	00009797          	auipc	a5,0x9
    800019ec:	61878793          	addi	a5,a5,1560 # 8000b000 <etext>
    800019f0:	4745                	li	a4,17
    800019f2:	076e                	slli	a4,a4,0x1b
    800019f4:	40f707b3          	sub	a5,a4,a5
    800019f8:	4719                	li	a4,6
    800019fa:	86be                	mv	a3,a5
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	20c080e7          	jalr	524(ra) # 80001c0c <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a08:	00008797          	auipc	a5,0x8
    80001a0c:	5f878793          	addi	a5,a5,1528 # 8000a000 <_trampoline>
    80001a10:	4729                	li	a4,10
    80001a12:	6685                	lui	a3,0x1
    80001a14:	863e                	mv	a2,a5
    80001a16:	040007b7          	lui	a5,0x4000
    80001a1a:	17fd                	addi	a5,a5,-1
    80001a1c:	00c79593          	slli	a1,a5,0xc
    80001a20:	fe843503          	ld	a0,-24(s0)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1e8080e7          	jalr	488(ra) # 80001c0c <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	c04080e7          	jalr	-1020(ra) # 80002634 <proc_mapstacks>
  
  return kpgtbl;
    80001a38:	fe843783          	ld	a5,-24(s0)
}
    80001a3c:	853e                	mv	a0,a5
    80001a3e:	60e2                	ld	ra,24(sp)
    80001a40:	6442                	ld	s0,16(sp)
    80001a42:	6105                	addi	sp,sp,32
    80001a44:	8082                	ret

0000000080001a46 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a46:	1141                	addi	sp,sp,-16
    80001a48:	e406                	sd	ra,8(sp)
    80001a4a:	e022                	sd	s0,0(sp)
    80001a4c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	ef2080e7          	jalr	-270(ra) # 80001940 <kvmmake>
    80001a56:	872a                	mv	a4,a0
    80001a58:	0000a797          	auipc	a5,0xa
    80001a5c:	5c078793          	addi	a5,a5,1472 # 8000c018 <kernel_pagetable>
    80001a60:	e398                	sd	a4,0(a5)
}
    80001a62:	0001                	nop
    80001a64:	60a2                	ld	ra,8(sp)
    80001a66:	6402                	ld	s0,0(sp)
    80001a68:	0141                	addi	sp,sp,16
    80001a6a:	8082                	ret

0000000080001a6c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6c:	1141                	addi	sp,sp,-16
    80001a6e:	e406                	sd	ra,8(sp)
    80001a70:	e022                	sd	s0,0(sp)
    80001a72:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a74:	0000a797          	auipc	a5,0xa
    80001a78:	5a478793          	addi	a5,a5,1444 # 8000c018 <kernel_pagetable>
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00c7d713          	srli	a4,a5,0xc
    80001a82:	57fd                	li	a5,-1
    80001a84:	17fe                	slli	a5,a5,0x3f
    80001a86:	8fd9                	or	a5,a5,a4
    80001a88:	853e                	mv	a0,a5
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	e8a080e7          	jalr	-374(ra) # 80001914 <w_satp>
  sfence_vma();
    80001a92:	00000097          	auipc	ra,0x0
    80001a96:	e9c080e7          	jalr	-356(ra) # 8000192e <sfence_vma>
}
    80001a9a:	0001                	nop
    80001a9c:	60a2                	ld	ra,8(sp)
    80001a9e:	6402                	ld	s0,0(sp)
    80001aa0:	0141                	addi	sp,sp,16
    80001aa2:	8082                	ret

0000000080001aa4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa4:	7139                	addi	sp,sp,-64
    80001aa6:	fc06                	sd	ra,56(sp)
    80001aa8:	f822                	sd	s0,48(sp)
    80001aaa:	0080                	addi	s0,sp,64
    80001aac:	fca43c23          	sd	a0,-40(s0)
    80001ab0:	fcb43823          	sd	a1,-48(s0)
    80001ab4:	87b2                	mv	a5,a2
    80001ab6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001aba:	fd043703          	ld	a4,-48(s0)
    80001abe:	57fd                	li	a5,-1
    80001ac0:	83e9                	srli	a5,a5,0x1a
    80001ac2:	00e7fa63          	bgeu	a5,a4,80001ad6 <walk+0x32>
    panic("walk");
    80001ac6:	00009517          	auipc	a0,0x9
    80001aca:	5f250513          	addi	a0,a0,1522 # 8000b0b8 <etext+0xb8>
    80001ace:	fffff097          	auipc	ra,0xfffff
    80001ad2:	1b0080e7          	jalr	432(ra) # 80000c7e <panic>

  for(int level = 2; level > 0; level--) {
    80001ad6:	4789                	li	a5,2
    80001ad8:	fef42623          	sw	a5,-20(s0)
    80001adc:	a849                	j	80001b6e <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ade:	fec42703          	lw	a4,-20(s0)
    80001ae2:	87ba                	mv	a5,a4
    80001ae4:	0037979b          	slliw	a5,a5,0x3
    80001ae8:	9fb9                	addw	a5,a5,a4
    80001aea:	2781                	sext.w	a5,a5
    80001aec:	27b1                	addiw	a5,a5,12
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	873e                	mv	a4,a5
    80001af2:	fd043783          	ld	a5,-48(s0)
    80001af6:	00e7d7b3          	srl	a5,a5,a4
    80001afa:	1ff7f793          	andi	a5,a5,511
    80001afe:	078e                	slli	a5,a5,0x3
    80001b00:	fd843703          	ld	a4,-40(s0)
    80001b04:	97ba                	add	a5,a5,a4
    80001b06:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0a:	fe043783          	ld	a5,-32(s0)
    80001b0e:	639c                	ld	a5,0(a5)
    80001b10:	8b85                	andi	a5,a5,1
    80001b12:	cb89                	beqz	a5,80001b24 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b14:	fe043783          	ld	a5,-32(s0)
    80001b18:	639c                	ld	a5,0(a5)
    80001b1a:	83a9                	srli	a5,a5,0xa
    80001b1c:	07b2                	slli	a5,a5,0xc
    80001b1e:	fcf43c23          	sd	a5,-40(s0)
    80001b22:	a089                	j	80001b64 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b24:	fcc42783          	lw	a5,-52(s0)
    80001b28:	2781                	sext.w	a5,a5
    80001b2a:	cb91                	beqz	a5,80001b3e <walk+0x9a>
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	5ee080e7          	jalr	1518(ra) # 8000111a <kalloc>
    80001b34:	fca43c23          	sd	a0,-40(s0)
    80001b38:	fd843783          	ld	a5,-40(s0)
    80001b3c:	e399                	bnez	a5,80001b42 <walk+0x9e>
        return 0;
    80001b3e:	4781                	li	a5,0
    80001b40:	a0a9                	j	80001b8a <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b42:	6605                	lui	a2,0x1
    80001b44:	4581                	li	a1,0
    80001b46:	fd843503          	ld	a0,-40(s0)
    80001b4a:	00000097          	auipc	ra,0x0
    80001b4e:	8f8080e7          	jalr	-1800(ra) # 80001442 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b52:	fd843783          	ld	a5,-40(s0)
    80001b56:	83b1                	srli	a5,a5,0xc
    80001b58:	07aa                	slli	a5,a5,0xa
    80001b5a:	0017e713          	ori	a4,a5,1
    80001b5e:	fe043783          	ld	a5,-32(s0)
    80001b62:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b64:	fec42783          	lw	a5,-20(s0)
    80001b68:	37fd                	addiw	a5,a5,-1
    80001b6a:	fef42623          	sw	a5,-20(s0)
    80001b6e:	fec42783          	lw	a5,-20(s0)
    80001b72:	2781                	sext.w	a5,a5
    80001b74:	f6f045e3          	bgtz	a5,80001ade <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	83b1                	srli	a5,a5,0xc
    80001b7e:	1ff7f793          	andi	a5,a5,511
    80001b82:	078e                	slli	a5,a5,0x3
    80001b84:	fd843703          	ld	a4,-40(s0)
    80001b88:	97ba                	add	a5,a5,a4
}
    80001b8a:	853e                	mv	a0,a5
    80001b8c:	70e2                	ld	ra,56(sp)
    80001b8e:	7442                	ld	s0,48(sp)
    80001b90:	6121                	addi	sp,sp,64
    80001b92:	8082                	ret

0000000080001b94 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b94:	7179                	addi	sp,sp,-48
    80001b96:	f406                	sd	ra,40(sp)
    80001b98:	f022                	sd	s0,32(sp)
    80001b9a:	1800                	addi	s0,sp,48
    80001b9c:	fca43c23          	sd	a0,-40(s0)
    80001ba0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba4:	fd043703          	ld	a4,-48(s0)
    80001ba8:	57fd                	li	a5,-1
    80001baa:	83e9                	srli	a5,a5,0x1a
    80001bac:	00e7f463          	bgeu	a5,a4,80001bb4 <walkaddr+0x20>
    return 0;
    80001bb0:	4781                	li	a5,0
    80001bb2:	a881                	j	80001c02 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb4:	4601                	li	a2,0
    80001bb6:	fd043583          	ld	a1,-48(s0)
    80001bba:	fd843503          	ld	a0,-40(s0)
    80001bbe:	00000097          	auipc	ra,0x0
    80001bc2:	ee6080e7          	jalr	-282(ra) # 80001aa4 <walk>
    80001bc6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bca:	fe843783          	ld	a5,-24(s0)
    80001bce:	e399                	bnez	a5,80001bd4 <walkaddr+0x40>
    return 0;
    80001bd0:	4781                	li	a5,0
    80001bd2:	a805                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd4:	fe843783          	ld	a5,-24(s0)
    80001bd8:	639c                	ld	a5,0(a5)
    80001bda:	8b85                	andi	a5,a5,1
    80001bdc:	e399                	bnez	a5,80001be2 <walkaddr+0x4e>
    return 0;
    80001bde:	4781                	li	a5,0
    80001be0:	a00d                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be2:	fe843783          	ld	a5,-24(s0)
    80001be6:	639c                	ld	a5,0(a5)
    80001be8:	8bc1                	andi	a5,a5,16
    80001bea:	e399                	bnez	a5,80001bf0 <walkaddr+0x5c>
    return 0;
    80001bec:	4781                	li	a5,0
    80001bee:	a811                	j	80001c02 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf0:	fe843783          	ld	a5,-24(s0)
    80001bf4:	639c                	ld	a5,0(a5)
    80001bf6:	83a9                	srli	a5,a5,0xa
    80001bf8:	07b2                	slli	a5,a5,0xc
    80001bfa:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001bfe:	fe043783          	ld	a5,-32(s0)
}
    80001c02:	853e                	mv	a0,a5
    80001c04:	70a2                	ld	ra,40(sp)
    80001c06:	7402                	ld	s0,32(sp)
    80001c08:	6145                	addi	sp,sp,48
    80001c0a:	8082                	ret

0000000080001c0c <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0c:	7139                	addi	sp,sp,-64
    80001c0e:	fc06                	sd	ra,56(sp)
    80001c10:	f822                	sd	s0,48(sp)
    80001c12:	0080                	addi	s0,sp,64
    80001c14:	fea43423          	sd	a0,-24(s0)
    80001c18:	feb43023          	sd	a1,-32(s0)
    80001c1c:	fcc43c23          	sd	a2,-40(s0)
    80001c20:	fcd43823          	sd	a3,-48(s0)
    80001c24:	87ba                	mv	a5,a4
    80001c26:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2a:	fcc42783          	lw	a5,-52(s0)
    80001c2e:	873e                	mv	a4,a5
    80001c30:	fd843683          	ld	a3,-40(s0)
    80001c34:	fd043603          	ld	a2,-48(s0)
    80001c38:	fe043583          	ld	a1,-32(s0)
    80001c3c:	fe843503          	ld	a0,-24(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	026080e7          	jalr	38(ra) # 80001c66 <mappages>
    80001c48:	87aa                	mv	a5,a0
    80001c4a:	cb89                	beqz	a5,80001c5c <kvmmap+0x50>
    panic("kvmmap");
    80001c4c:	00009517          	auipc	a0,0x9
    80001c50:	47450513          	addi	a0,a0,1140 # 8000b0c0 <etext+0xc0>
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	02a080e7          	jalr	42(ra) # 80000c7e <panic>
}
    80001c5c:	0001                	nop
    80001c5e:	70e2                	ld	ra,56(sp)
    80001c60:	7442                	ld	s0,48(sp)
    80001c62:	6121                	addi	sp,sp,64
    80001c64:	8082                	ret

0000000080001c66 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c66:	711d                	addi	sp,sp,-96
    80001c68:	ec86                	sd	ra,88(sp)
    80001c6a:	e8a2                	sd	s0,80(sp)
    80001c6c:	1080                	addi	s0,sp,96
    80001c6e:	fca43423          	sd	a0,-56(s0)
    80001c72:	fcb43023          	sd	a1,-64(s0)
    80001c76:	fac43c23          	sd	a2,-72(s0)
    80001c7a:	fad43823          	sd	a3,-80(s0)
    80001c7e:	87ba                	mv	a5,a4
    80001c80:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c84:	fb843783          	ld	a5,-72(s0)
    80001c88:	eb89                	bnez	a5,80001c9a <mappages+0x34>
    panic("mappages: size");
    80001c8a:	00009517          	auipc	a0,0x9
    80001c8e:	43e50513          	addi	a0,a0,1086 # 8000b0c8 <etext+0xc8>
    80001c92:	fffff097          	auipc	ra,0xfffff
    80001c96:	fec080e7          	jalr	-20(ra) # 80000c7e <panic>
  
  a = PGROUNDDOWN(va);
    80001c9a:	fc043703          	ld	a4,-64(s0)
    80001c9e:	77fd                	lui	a5,0xfffff
    80001ca0:	8ff9                	and	a5,a5,a4
    80001ca2:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ca6:	fc043703          	ld	a4,-64(s0)
    80001caa:	fb843783          	ld	a5,-72(s0)
    80001cae:	97ba                	add	a5,a5,a4
    80001cb0:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd5fff>
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cbc:	4605                	li	a2,1
    80001cbe:	fe843583          	ld	a1,-24(s0)
    80001cc2:	fc843503          	ld	a0,-56(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	dde080e7          	jalr	-546(ra) # 80001aa4 <walk>
    80001cce:	fca43c23          	sd	a0,-40(s0)
    80001cd2:	fd843783          	ld	a5,-40(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <mappages+0x76>
      return -1;
    80001cd8:	57fd                	li	a5,-1
    80001cda:	a085                	j	80001d3a <mappages+0xd4>
    if(*pte & PTE_V)
    80001cdc:	fd843783          	ld	a5,-40(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	8b85                	andi	a5,a5,1
    80001ce4:	cb89                	beqz	a5,80001cf6 <mappages+0x90>
      panic("mappages: remap");
    80001ce6:	00009517          	auipc	a0,0x9
    80001cea:	3f250513          	addi	a0,a0,1010 # 8000b0d8 <etext+0xd8>
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	f90080e7          	jalr	-112(ra) # 80000c7e <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001cf6:	fb043783          	ld	a5,-80(s0)
    80001cfa:	83b1                	srli	a5,a5,0xc
    80001cfc:	00a79713          	slli	a4,a5,0xa
    80001d00:	fac42783          	lw	a5,-84(s0)
    80001d04:	8fd9                	or	a5,a5,a4
    80001d06:	0017e713          	ori	a4,a5,1
    80001d0a:	fd843783          	ld	a5,-40(s0)
    80001d0e:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d10:	fe843703          	ld	a4,-24(s0)
    80001d14:	fe043783          	ld	a5,-32(s0)
    80001d18:	00f70f63          	beq	a4,a5,80001d36 <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d1c:	fe843703          	ld	a4,-24(s0)
    80001d20:	6785                	lui	a5,0x1
    80001d22:	97ba                	add	a5,a5,a4
    80001d24:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d28:	fb043703          	ld	a4,-80(s0)
    80001d2c:	6785                	lui	a5,0x1
    80001d2e:	97ba                	add	a5,a5,a4
    80001d30:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d34:	b761                	j	80001cbc <mappages+0x56>
      break;
    80001d36:	0001                	nop
  }
  return 0;
    80001d38:	4781                	li	a5,0
}
    80001d3a:	853e                	mv	a0,a5
    80001d3c:	60e6                	ld	ra,88(sp)
    80001d3e:	6446                	ld	s0,80(sp)
    80001d40:	6125                	addi	sp,sp,96
    80001d42:	8082                	ret

0000000080001d44 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d44:	715d                	addi	sp,sp,-80
    80001d46:	e486                	sd	ra,72(sp)
    80001d48:	e0a2                	sd	s0,64(sp)
    80001d4a:	0880                	addi	s0,sp,80
    80001d4c:	fca43423          	sd	a0,-56(s0)
    80001d50:	fcb43023          	sd	a1,-64(s0)
    80001d54:	fac43c23          	sd	a2,-72(s0)
    80001d58:	87b6                	mv	a5,a3
    80001d5a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d5e:	fc043703          	ld	a4,-64(s0)
    80001d62:	6785                	lui	a5,0x1
    80001d64:	17fd                	addi	a5,a5,-1
    80001d66:	8ff9                	and	a5,a5,a4
    80001d68:	cb89                	beqz	a5,80001d7a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d6a:	00009517          	auipc	a0,0x9
    80001d6e:	37e50513          	addi	a0,a0,894 # 8000b0e8 <etext+0xe8>
    80001d72:	fffff097          	auipc	ra,0xfffff
    80001d76:	f0c080e7          	jalr	-244(ra) # 80000c7e <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d7a:	fc043783          	ld	a5,-64(s0)
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	a045                	j	80001e22 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d84:	4601                	li	a2,0
    80001d86:	fe843583          	ld	a1,-24(s0)
    80001d8a:	fc843503          	ld	a0,-56(s0)
    80001d8e:	00000097          	auipc	ra,0x0
    80001d92:	d16080e7          	jalr	-746(ra) # 80001aa4 <walk>
    80001d96:	fea43023          	sd	a0,-32(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	eb89                	bnez	a5,80001db0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001da0:	00009517          	auipc	a0,0x9
    80001da4:	36050513          	addi	a0,a0,864 # 8000b100 <etext+0x100>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ed6080e7          	jalr	-298(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	639c                	ld	a5,0(a5)
    80001db6:	8b85                	andi	a5,a5,1
    80001db8:	eb89                	bnez	a5,80001dca <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dba:	00009517          	auipc	a0,0x9
    80001dbe:	35650513          	addi	a0,a0,854 # 8000b110 <etext+0x110>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001dca:	fe043783          	ld	a5,-32(s0)
    80001dce:	639c                	ld	a5,0(a5)
    80001dd0:	3ff7f713          	andi	a4,a5,1023
    80001dd4:	4785                	li	a5,1
    80001dd6:	00f71a63          	bne	a4,a5,80001dea <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dda:	00009517          	auipc	a0,0x9
    80001dde:	34e50513          	addi	a0,a0,846 # 8000b128 <etext+0x128>
    80001de2:	fffff097          	auipc	ra,0xfffff
    80001de6:	e9c080e7          	jalr	-356(ra) # 80000c7e <panic>
    if(do_free){
    80001dea:	fb442783          	lw	a5,-76(s0)
    80001dee:	2781                	sext.w	a5,a5
    80001df0:	cf99                	beqz	a5,80001e0e <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001df2:	fe043783          	ld	a5,-32(s0)
    80001df6:	639c                	ld	a5,0(a5)
    80001df8:	83a9                	srli	a5,a5,0xa
    80001dfa:	07b2                	slli	a5,a5,0xc
    80001dfc:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e00:	fd843783          	ld	a5,-40(s0)
    80001e04:	853e                	mv	a0,a5
    80001e06:	fffff097          	auipc	ra,0xfffff
    80001e0a:	270080e7          	jalr	624(ra) # 80001076 <kfree>
    }
    *pte = 0;
    80001e0e:	fe043783          	ld	a5,-32(s0)
    80001e12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e16:	fe843703          	ld	a4,-24(s0)
    80001e1a:	6785                	lui	a5,0x1
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fef43423          	sd	a5,-24(s0)
    80001e22:	fb843783          	ld	a5,-72(s0)
    80001e26:	00c79713          	slli	a4,a5,0xc
    80001e2a:	fc043783          	ld	a5,-64(s0)
    80001e2e:	97ba                	add	a5,a5,a4
    80001e30:	fe843703          	ld	a4,-24(s0)
    80001e34:	f4f768e3          	bltu	a4,a5,80001d84 <uvmunmap+0x40>
  }
}
    80001e38:	0001                	nop
    80001e3a:	0001                	nop
    80001e3c:	60a6                	ld	ra,72(sp)
    80001e3e:	6406                	ld	s0,64(sp)
    80001e40:	6161                	addi	sp,sp,80
    80001e42:	8082                	ret

0000000080001e44 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e44:	1101                	addi	sp,sp,-32
    80001e46:	ec06                	sd	ra,24(sp)
    80001e48:	e822                	sd	s0,16(sp)
    80001e4a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	2ce080e7          	jalr	718(ra) # 8000111a <kalloc>
    80001e54:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e58:	fe843783          	ld	a5,-24(s0)
    80001e5c:	e399                	bnez	a5,80001e62 <uvmcreate+0x1e>
    return 0;
    80001e5e:	4781                	li	a5,0
    80001e60:	a819                	j	80001e76 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e62:	6605                	lui	a2,0x1
    80001e64:	4581                	li	a1,0
    80001e66:	fe843503          	ld	a0,-24(s0)
    80001e6a:	fffff097          	auipc	ra,0xfffff
    80001e6e:	5d8080e7          	jalr	1496(ra) # 80001442 <memset>
  return pagetable;
    80001e72:	fe843783          	ld	a5,-24(s0)
}
    80001e76:	853e                	mv	a0,a5
    80001e78:	60e2                	ld	ra,24(sp)
    80001e7a:	6442                	ld	s0,16(sp)
    80001e7c:	6105                	addi	sp,sp,32
    80001e7e:	8082                	ret

0000000080001e80 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e80:	7139                	addi	sp,sp,-64
    80001e82:	fc06                	sd	ra,56(sp)
    80001e84:	f822                	sd	s0,48(sp)
    80001e86:	0080                	addi	s0,sp,64
    80001e88:	fca43c23          	sd	a0,-40(s0)
    80001e8c:	fcb43823          	sd	a1,-48(s0)
    80001e90:	87b2                	mv	a5,a2
    80001e92:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e96:	fcc42783          	lw	a5,-52(s0)
    80001e9a:	0007871b          	sext.w	a4,a5
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	00f76a63          	bltu	a4,a5,80001eb4 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001ea4:	00009517          	auipc	a0,0x9
    80001ea8:	29c50513          	addi	a0,a0,668 # 8000b140 <etext+0x140>
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	dd2080e7          	jalr	-558(ra) # 80000c7e <panic>
  mem = kalloc();
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	266080e7          	jalr	614(ra) # 8000111a <kalloc>
    80001ebc:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ec0:	6605                	lui	a2,0x1
    80001ec2:	4581                	li	a1,0
    80001ec4:	fe843503          	ld	a0,-24(s0)
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	57a080e7          	jalr	1402(ra) # 80001442 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ed0:	fe843783          	ld	a5,-24(s0)
    80001ed4:	4779                	li	a4,30
    80001ed6:	86be                	mv	a3,a5
    80001ed8:	6605                	lui	a2,0x1
    80001eda:	4581                	li	a1,0
    80001edc:	fd843503          	ld	a0,-40(s0)
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d86080e7          	jalr	-634(ra) # 80001c66 <mappages>
  memmove(mem, src, sz);
    80001ee8:	fcc42783          	lw	a5,-52(s0)
    80001eec:	863e                	mv	a2,a5
    80001eee:	fd043583          	ld	a1,-48(s0)
    80001ef2:	fe843503          	ld	a0,-24(s0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	630080e7          	jalr	1584(ra) # 80001526 <memmove>
}
    80001efe:	0001                	nop
    80001f00:	70e2                	ld	ra,56(sp)
    80001f02:	7442                	ld	s0,48(sp)
    80001f04:	6121                	addi	sp,sp,64
    80001f06:	8082                	ret

0000000080001f08 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001f08:	7139                	addi	sp,sp,-64
    80001f0a:	fc06                	sd	ra,56(sp)
    80001f0c:	f822                	sd	s0,48(sp)
    80001f0e:	0080                	addi	s0,sp,64
    80001f10:	fca43c23          	sd	a0,-40(s0)
    80001f14:	fcb43823          	sd	a1,-48(s0)
    80001f18:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f1c:	fc843703          	ld	a4,-56(s0)
    80001f20:	fd043783          	ld	a5,-48(s0)
    80001f24:	00f77563          	bgeu	a4,a5,80001f2e <uvmalloc+0x26>
    return oldsz;
    80001f28:	fd043783          	ld	a5,-48(s0)
    80001f2c:	a85d                	j	80001fe2 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f2e:	fd043703          	ld	a4,-48(s0)
    80001f32:	6785                	lui	a5,0x1
    80001f34:	17fd                	addi	a5,a5,-1
    80001f36:	973e                	add	a4,a4,a5
    80001f38:	77fd                	lui	a5,0xfffff
    80001f3a:	8ff9                	and	a5,a5,a4
    80001f3c:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f40:	fd043783          	ld	a5,-48(s0)
    80001f44:	fef43423          	sd	a5,-24(s0)
    80001f48:	a069                	j	80001fd2 <uvmalloc+0xca>
    mem = kalloc();
    80001f4a:	fffff097          	auipc	ra,0xfffff
    80001f4e:	1d0080e7          	jalr	464(ra) # 8000111a <kalloc>
    80001f52:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f56:	fe043783          	ld	a5,-32(s0)
    80001f5a:	ef89                	bnez	a5,80001f74 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f5c:	fd043603          	ld	a2,-48(s0)
    80001f60:	fe843583          	ld	a1,-24(s0)
    80001f64:	fd843503          	ld	a0,-40(s0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	084080e7          	jalr	132(ra) # 80001fec <uvmdealloc>
      return 0;
    80001f70:	4781                	li	a5,0
    80001f72:	a885                	j	80001fe2 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f74:	6605                	lui	a2,0x1
    80001f76:	4581                	li	a1,0
    80001f78:	fe043503          	ld	a0,-32(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f84:	fe043783          	ld	a5,-32(s0)
    80001f88:	4779                	li	a4,30
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	6605                	lui	a2,0x1
    80001f8e:	fe843583          	ld	a1,-24(s0)
    80001f92:	fd843503          	ld	a0,-40(s0)
    80001f96:	00000097          	auipc	ra,0x0
    80001f9a:	cd0080e7          	jalr	-816(ra) # 80001c66 <mappages>
    80001f9e:	87aa                	mv	a5,a0
    80001fa0:	c39d                	beqz	a5,80001fc6 <uvmalloc+0xbe>
      kfree(mem);
    80001fa2:	fe043503          	ld	a0,-32(s0)
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	0d0080e7          	jalr	208(ra) # 80001076 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fae:	fd043603          	ld	a2,-48(s0)
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	032080e7          	jalr	50(ra) # 80001fec <uvmdealloc>
      return 0;
    80001fc2:	4781                	li	a5,0
    80001fc4:	a839                	j	80001fe2 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fc6:	fe843703          	ld	a4,-24(s0)
    80001fca:	6785                	lui	a5,0x1
    80001fcc:	97ba                	add	a5,a5,a4
    80001fce:	fef43423          	sd	a5,-24(s0)
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	fc843783          	ld	a5,-56(s0)
    80001fda:	f6f768e3          	bltu	a4,a5,80001f4a <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fde:	fc843783          	ld	a5,-56(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	70e2                	ld	ra,56(sp)
    80001fe6:	7442                	ld	s0,48(sp)
    80001fe8:	6121                	addi	sp,sp,64
    80001fea:	8082                	ret

0000000080001fec <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fec:	7139                	addi	sp,sp,-64
    80001fee:	fc06                	sd	ra,56(sp)
    80001ff0:	f822                	sd	s0,48(sp)
    80001ff2:	0080                	addi	s0,sp,64
    80001ff4:	fca43c23          	sd	a0,-40(s0)
    80001ff8:	fcb43823          	sd	a1,-48(s0)
    80001ffc:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	fd043783          	ld	a5,-48(s0)
    80002008:	00f76563          	bltu	a4,a5,80002012 <uvmdealloc+0x26>
    return oldsz;
    8000200c:	fd043783          	ld	a5,-48(s0)
    80002010:	a885                	j	80002080 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002012:	fc843703          	ld	a4,-56(s0)
    80002016:	6785                	lui	a5,0x1
    80002018:	17fd                	addi	a5,a5,-1
    8000201a:	973e                	add	a4,a4,a5
    8000201c:	77fd                	lui	a5,0xfffff
    8000201e:	8f7d                	and	a4,a4,a5
    80002020:	fd043683          	ld	a3,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	96be                	add	a3,a3,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8ff5                	and	a5,a5,a3
    8000202e:	04f77763          	bgeu	a4,a5,8000207c <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002032:	fd043703          	ld	a4,-48(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1
    8000203a:	973e                	add	a4,a4,a5
    8000203c:	77fd                	lui	a5,0xfffff
    8000203e:	8f7d                	and	a4,a4,a5
    80002040:	fc843683          	ld	a3,-56(s0)
    80002044:	6785                	lui	a5,0x1
    80002046:	17fd                	addi	a5,a5,-1
    80002048:	96be                	add	a3,a3,a5
    8000204a:	77fd                	lui	a5,0xfffff
    8000204c:	8ff5                	and	a5,a5,a3
    8000204e:	40f707b3          	sub	a5,a4,a5
    80002052:	83b1                	srli	a5,a5,0xc
    80002054:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002058:	fc843703          	ld	a4,-56(s0)
    8000205c:	6785                	lui	a5,0x1
    8000205e:	17fd                	addi	a5,a5,-1
    80002060:	973e                	add	a4,a4,a5
    80002062:	77fd                	lui	a5,0xfffff
    80002064:	8ff9                	and	a5,a5,a4
    80002066:	fec42703          	lw	a4,-20(s0)
    8000206a:	4685                	li	a3,1
    8000206c:	863a                	mv	a2,a4
    8000206e:	85be                	mv	a1,a5
    80002070:	fd843503          	ld	a0,-40(s0)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	cd0080e7          	jalr	-816(ra) # 80001d44 <uvmunmap>
  }

  return newsz;
    8000207c:	fc843783          	ld	a5,-56(s0)
}
    80002080:	853e                	mv	a0,a5
    80002082:	70e2                	ld	ra,56(sp)
    80002084:	7442                	ld	s0,48(sp)
    80002086:	6121                	addi	sp,sp,64
    80002088:	8082                	ret

000000008000208a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000208a:	7139                	addi	sp,sp,-64
    8000208c:	fc06                	sd	ra,56(sp)
    8000208e:	f822                	sd	s0,48(sp)
    80002090:	0080                	addi	s0,sp,64
    80002092:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002096:	fe042623          	sw	zero,-20(s0)
    8000209a:	a88d                	j	8000210c <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000209c:	fec42783          	lw	a5,-20(s0)
    800020a0:	078e                	slli	a5,a5,0x3
    800020a2:	fc843703          	ld	a4,-56(s0)
    800020a6:	97ba                	add	a5,a5,a4
    800020a8:	639c                	ld	a5,0(a5)
    800020aa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020ae:	fe043783          	ld	a5,-32(s0)
    800020b2:	8b85                	andi	a5,a5,1
    800020b4:	cb9d                	beqz	a5,800020ea <freewalk+0x60>
    800020b6:	fe043783          	ld	a5,-32(s0)
    800020ba:	8bb9                	andi	a5,a5,14
    800020bc:	e79d                	bnez	a5,800020ea <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	83a9                	srli	a5,a5,0xa
    800020c4:	07b2                	slli	a5,a5,0xc
    800020c6:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ca:	fd843783          	ld	a5,-40(s0)
    800020ce:	853e                	mv	a0,a5
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	fba080e7          	jalr	-70(ra) # 8000208a <freewalk>
      pagetable[i] = 0;
    800020d8:	fec42783          	lw	a5,-20(s0)
    800020dc:	078e                	slli	a5,a5,0x3
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	97ba                	add	a5,a5,a4
    800020e4:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd6000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020e8:	a829                	j	80002102 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	8b85                	andi	a5,a5,1
    800020f0:	cb89                	beqz	a5,80002102 <freewalk+0x78>
      panic("freewalk: leaf");
    800020f2:	00009517          	auipc	a0,0x9
    800020f6:	06e50513          	addi	a0,a0,110 # 8000b160 <etext+0x160>
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	b84080e7          	jalr	-1148(ra) # 80000c7e <panic>
  for(int i = 0; i < 512; i++){
    80002102:	fec42783          	lw	a5,-20(s0)
    80002106:	2785                	addiw	a5,a5,1
    80002108:	fef42623          	sw	a5,-20(s0)
    8000210c:	fec42783          	lw	a5,-20(s0)
    80002110:	0007871b          	sext.w	a4,a5
    80002114:	1ff00793          	li	a5,511
    80002118:	f8e7d2e3          	bge	a5,a4,8000209c <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000211c:	fc843503          	ld	a0,-56(s0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	f56080e7          	jalr	-170(ra) # 80001076 <kfree>
}
    80002128:	0001                	nop
    8000212a:	70e2                	ld	ra,56(sp)
    8000212c:	7442                	ld	s0,48(sp)
    8000212e:	6121                	addi	sp,sp,64
    80002130:	8082                	ret

0000000080002132 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002132:	1101                	addi	sp,sp,-32
    80002134:	ec06                	sd	ra,24(sp)
    80002136:	e822                	sd	s0,16(sp)
    80002138:	1000                	addi	s0,sp,32
    8000213a:	fea43423          	sd	a0,-24(s0)
    8000213e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	c385                	beqz	a5,80002166 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002148:	fe043703          	ld	a4,-32(s0)
    8000214c:	6785                	lui	a5,0x1
    8000214e:	17fd                	addi	a5,a5,-1
    80002150:	97ba                	add	a5,a5,a4
    80002152:	83b1                	srli	a5,a5,0xc
    80002154:	4685                	li	a3,1
    80002156:	863e                	mv	a2,a5
    80002158:	4581                	li	a1,0
    8000215a:	fe843503          	ld	a0,-24(s0)
    8000215e:	00000097          	auipc	ra,0x0
    80002162:	be6080e7          	jalr	-1050(ra) # 80001d44 <uvmunmap>
  freewalk(pagetable);
    80002166:	fe843503          	ld	a0,-24(s0)
    8000216a:	00000097          	auipc	ra,0x0
    8000216e:	f20080e7          	jalr	-224(ra) # 8000208a <freewalk>
}
    80002172:	0001                	nop
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	6105                	addi	sp,sp,32
    8000217a:	8082                	ret

000000008000217c <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000217c:	711d                	addi	sp,sp,-96
    8000217e:	ec86                	sd	ra,88(sp)
    80002180:	e8a2                	sd	s0,80(sp)
    80002182:	1080                	addi	s0,sp,96
    80002184:	faa43c23          	sd	a0,-72(s0)
    80002188:	fab43823          	sd	a1,-80(s0)
    8000218c:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002190:	fe043423          	sd	zero,-24(s0)
    80002194:	a0d9                	j	8000225a <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002196:	4601                	li	a2,0
    80002198:	fe843583          	ld	a1,-24(s0)
    8000219c:	fb843503          	ld	a0,-72(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	904080e7          	jalr	-1788(ra) # 80001aa4 <walk>
    800021a8:	fea43023          	sd	a0,-32(s0)
    800021ac:	fe043783          	ld	a5,-32(s0)
    800021b0:	eb89                	bnez	a5,800021c2 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021b2:	00009517          	auipc	a0,0x9
    800021b6:	fbe50513          	addi	a0,a0,-66 # 8000b170 <etext+0x170>
    800021ba:	fffff097          	auipc	ra,0xfffff
    800021be:	ac4080e7          	jalr	-1340(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    800021c2:	fe043783          	ld	a5,-32(s0)
    800021c6:	639c                	ld	a5,0(a5)
    800021c8:	8b85                	andi	a5,a5,1
    800021ca:	eb89                	bnez	a5,800021dc <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021cc:	00009517          	auipc	a0,0x9
    800021d0:	fc450513          	addi	a0,a0,-60 # 8000b190 <etext+0x190>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	aaa080e7          	jalr	-1366(ra) # 80000c7e <panic>
    pa = PTE2PA(*pte);
    800021dc:	fe043783          	ld	a5,-32(s0)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	83a9                	srli	a5,a5,0xa
    800021e4:	07b2                	slli	a5,a5,0xc
    800021e6:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021ea:	fe043783          	ld	a5,-32(s0)
    800021ee:	639c                	ld	a5,0(a5)
    800021f0:	2781                	sext.w	a5,a5
    800021f2:	3ff7f793          	andi	a5,a5,1023
    800021f6:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021fa:	fffff097          	auipc	ra,0xfffff
    800021fe:	f20080e7          	jalr	-224(ra) # 8000111a <kalloc>
    80002202:	fca43423          	sd	a0,-56(s0)
    80002206:	fc843783          	ld	a5,-56(s0)
    8000220a:	c3a5                	beqz	a5,8000226a <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000220c:	fd843783          	ld	a5,-40(s0)
    80002210:	6605                	lui	a2,0x1
    80002212:	85be                	mv	a1,a5
    80002214:	fc843503          	ld	a0,-56(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	30e080e7          	jalr	782(ra) # 80001526 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002220:	fc843783          	ld	a5,-56(s0)
    80002224:	fd442703          	lw	a4,-44(s0)
    80002228:	86be                	mv	a3,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb043503          	ld	a0,-80(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	a32080e7          	jalr	-1486(ra) # 80001c66 <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb81                	beqz	a5,8000224e <uvmcopy+0xd2>
      kfree(mem);
    80002240:	fc843503          	ld	a0,-56(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	e32080e7          	jalr	-462(ra) # 80001076 <kfree>
      goto err;
    8000224c:	a005                	j	8000226c <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000224e:	fe843703          	ld	a4,-24(s0)
    80002252:	6785                	lui	a5,0x1
    80002254:	97ba                	add	a5,a5,a4
    80002256:	fef43423          	sd	a5,-24(s0)
    8000225a:	fe843703          	ld	a4,-24(s0)
    8000225e:	fa843783          	ld	a5,-88(s0)
    80002262:	f2f76ae3          	bltu	a4,a5,80002196 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002266:	4781                	li	a5,0
    80002268:	a839                	j	80002286 <uvmcopy+0x10a>
      goto err;
    8000226a:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000226c:	fe843783          	ld	a5,-24(s0)
    80002270:	83b1                	srli	a5,a5,0xc
    80002272:	4685                	li	a3,1
    80002274:	863e                	mv	a2,a5
    80002276:	4581                	li	a1,0
    80002278:	fb043503          	ld	a0,-80(s0)
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	ac8080e7          	jalr	-1336(ra) # 80001d44 <uvmunmap>
  return -1;
    80002284:	57fd                	li	a5,-1
}
    80002286:	853e                	mv	a0,a5
    80002288:	60e6                	ld	ra,88(sp)
    8000228a:	6446                	ld	s0,80(sp)
    8000228c:	6125                	addi	sp,sp,96
    8000228e:	8082                	ret

0000000080002290 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002290:	7179                	addi	sp,sp,-48
    80002292:	f406                	sd	ra,40(sp)
    80002294:	f022                	sd	s0,32(sp)
    80002296:	1800                	addi	s0,sp,48
    80002298:	fca43c23          	sd	a0,-40(s0)
    8000229c:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022a0:	4601                	li	a2,0
    800022a2:	fd043583          	ld	a1,-48(s0)
    800022a6:	fd843503          	ld	a0,-40(s0)
    800022aa:	fffff097          	auipc	ra,0xfffff
    800022ae:	7fa080e7          	jalr	2042(ra) # 80001aa4 <walk>
    800022b2:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022b6:	fe843783          	ld	a5,-24(s0)
    800022ba:	eb89                	bnez	a5,800022cc <uvmclear+0x3c>
    panic("uvmclear");
    800022bc:	00009517          	auipc	a0,0x9
    800022c0:	ef450513          	addi	a0,a0,-268 # 8000b1b0 <etext+0x1b0>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
  *pte &= ~PTE_U;
    800022cc:	fe843783          	ld	a5,-24(s0)
    800022d0:	639c                	ld	a5,0(a5)
    800022d2:	fef7f713          	andi	a4,a5,-17
    800022d6:	fe843783          	ld	a5,-24(s0)
    800022da:	e398                	sd	a4,0(a5)
}
    800022dc:	0001                	nop
    800022de:	70a2                	ld	ra,40(sp)
    800022e0:	7402                	ld	s0,32(sp)
    800022e2:	6145                	addi	sp,sp,48
    800022e4:	8082                	ret

00000000800022e6 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022e6:	715d                	addi	sp,sp,-80
    800022e8:	e486                	sd	ra,72(sp)
    800022ea:	e0a2                	sd	s0,64(sp)
    800022ec:	0880                	addi	s0,sp,80
    800022ee:	fca43423          	sd	a0,-56(s0)
    800022f2:	fcb43023          	sd	a1,-64(s0)
    800022f6:	fac43c23          	sd	a2,-72(s0)
    800022fa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022fe:	a055                	j	800023a2 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002300:	fc043703          	ld	a4,-64(s0)
    80002304:	77fd                	lui	a5,0xfffff
    80002306:	8ff9                	and	a5,a5,a4
    80002308:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000230c:	fe043583          	ld	a1,-32(s0)
    80002310:	fc843503          	ld	a0,-56(s0)
    80002314:	00000097          	auipc	ra,0x0
    80002318:	880080e7          	jalr	-1920(ra) # 80001b94 <walkaddr>
    8000231c:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002320:	fd843783          	ld	a5,-40(s0)
    80002324:	e399                	bnez	a5,8000232a <copyout+0x44>
      return -1;
    80002326:	57fd                	li	a5,-1
    80002328:	a049                	j	800023aa <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000232a:	fe043703          	ld	a4,-32(s0)
    8000232e:	fc043783          	ld	a5,-64(s0)
    80002332:	8f1d                	sub	a4,a4,a5
    80002334:	6785                	lui	a5,0x1
    80002336:	97ba                	add	a5,a5,a4
    80002338:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000233c:	fe843703          	ld	a4,-24(s0)
    80002340:	fb043783          	ld	a5,-80(s0)
    80002344:	00e7f663          	bgeu	a5,a4,80002350 <copyout+0x6a>
      n = len;
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002350:	fc043703          	ld	a4,-64(s0)
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8f1d                	sub	a4,a4,a5
    8000235a:	fd843783          	ld	a5,-40(s0)
    8000235e:	97ba                	add	a5,a5,a4
    80002360:	873e                	mv	a4,a5
    80002362:	fe843783          	ld	a5,-24(s0)
    80002366:	2781                	sext.w	a5,a5
    80002368:	863e                	mv	a2,a5
    8000236a:	fb843583          	ld	a1,-72(s0)
    8000236e:	853a                	mv	a0,a4
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1b6080e7          	jalr	438(ra) # 80001526 <memmove>

    len -= n;
    80002378:	fb043703          	ld	a4,-80(s0)
    8000237c:	fe843783          	ld	a5,-24(s0)
    80002380:	40f707b3          	sub	a5,a4,a5
    80002384:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002388:	fb843703          	ld	a4,-72(s0)
    8000238c:	fe843783          	ld	a5,-24(s0)
    80002390:	97ba                	add	a5,a5,a4
    80002392:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002396:	fe043703          	ld	a4,-32(s0)
    8000239a:	6785                	lui	a5,0x1
    8000239c:	97ba                	add	a5,a5,a4
    8000239e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023a2:	fb043783          	ld	a5,-80(s0)
    800023a6:	ffa9                	bnez	a5,80002300 <copyout+0x1a>
  }
  return 0;
    800023a8:	4781                	li	a5,0
}
    800023aa:	853e                	mv	a0,a5
    800023ac:	60a6                	ld	ra,72(sp)
    800023ae:	6406                	ld	s0,64(sp)
    800023b0:	6161                	addi	sp,sp,80
    800023b2:	8082                	ret

00000000800023b4 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023b4:	715d                	addi	sp,sp,-80
    800023b6:	e486                	sd	ra,72(sp)
    800023b8:	e0a2                	sd	s0,64(sp)
    800023ba:	0880                	addi	s0,sp,80
    800023bc:	fca43423          	sd	a0,-56(s0)
    800023c0:	fcb43023          	sd	a1,-64(s0)
    800023c4:	fac43c23          	sd	a2,-72(s0)
    800023c8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023cc:	a055                	j	80002470 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ce:	fb843703          	ld	a4,-72(s0)
    800023d2:	77fd                	lui	a5,0xfffff
    800023d4:	8ff9                	and	a5,a5,a4
    800023d6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023da:	fe043583          	ld	a1,-32(s0)
    800023de:	fc843503          	ld	a0,-56(s0)
    800023e2:	fffff097          	auipc	ra,0xfffff
    800023e6:	7b2080e7          	jalr	1970(ra) # 80001b94 <walkaddr>
    800023ea:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	e399                	bnez	a5,800023f8 <copyin+0x44>
      return -1;
    800023f4:	57fd                	li	a5,-1
    800023f6:	a049                	j	80002478 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023f8:	fe043703          	ld	a4,-32(s0)
    800023fc:	fb843783          	ld	a5,-72(s0)
    80002400:	8f1d                	sub	a4,a4,a5
    80002402:	6785                	lui	a5,0x1
    80002404:	97ba                	add	a5,a5,a4
    80002406:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000240a:	fe843703          	ld	a4,-24(s0)
    8000240e:	fb043783          	ld	a5,-80(s0)
    80002412:	00e7f663          	bgeu	a5,a4,8000241e <copyin+0x6a>
      n = len;
    80002416:	fb043783          	ld	a5,-80(s0)
    8000241a:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000241e:	fb843703          	ld	a4,-72(s0)
    80002422:	fe043783          	ld	a5,-32(s0)
    80002426:	8f1d                	sub	a4,a4,a5
    80002428:	fd843783          	ld	a5,-40(s0)
    8000242c:	97ba                	add	a5,a5,a4
    8000242e:	873e                	mv	a4,a5
    80002430:	fe843783          	ld	a5,-24(s0)
    80002434:	2781                	sext.w	a5,a5
    80002436:	863e                	mv	a2,a5
    80002438:	85ba                	mv	a1,a4
    8000243a:	fc043503          	ld	a0,-64(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	0e8080e7          	jalr	232(ra) # 80001526 <memmove>

    len -= n;
    80002446:	fb043703          	ld	a4,-80(s0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	40f707b3          	sub	a5,a4,a5
    80002452:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002456:	fc043703          	ld	a4,-64(s0)
    8000245a:	fe843783          	ld	a5,-24(s0)
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002464:	fe043703          	ld	a4,-32(s0)
    80002468:	6785                	lui	a5,0x1
    8000246a:	97ba                	add	a5,a5,a4
    8000246c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002470:	fb043783          	ld	a5,-80(s0)
    80002474:	ffa9                	bnez	a5,800023ce <copyin+0x1a>
  }
  return 0;
    80002476:	4781                	li	a5,0
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60a6                	ld	ra,72(sp)
    8000247c:	6406                	ld	s0,64(sp)
    8000247e:	6161                	addi	sp,sp,80
    80002480:	8082                	ret

0000000080002482 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002482:	711d                	addi	sp,sp,-96
    80002484:	ec86                	sd	ra,88(sp)
    80002486:	e8a2                	sd	s0,80(sp)
    80002488:	1080                	addi	s0,sp,96
    8000248a:	faa43c23          	sd	a0,-72(s0)
    8000248e:	fab43823          	sd	a1,-80(s0)
    80002492:	fac43423          	sd	a2,-88(s0)
    80002496:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000249a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000249e:	a0f1                	j	8000256a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024a0:	fa843703          	ld	a4,-88(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fd043583          	ld	a1,-48(s0)
    800024b0:	fb843503          	ld	a0,-72(s0)
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	6e0080e7          	jalr	1760(ra) # 80001b94 <walkaddr>
    800024bc:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024c0:	fc843783          	ld	a5,-56(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyinstr+0x48>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a87d                	j	80002586 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ca:	fd043703          	ld	a4,-48(s0)
    800024ce:	fa843783          	ld	a5,-88(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fa043783          	ld	a5,-96(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyinstr+0x6e>
      n = max;
    800024e8:	fa043783          	ld	a5,-96(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024f0:	fa843703          	ld	a4,-88(s0)
    800024f4:	fd043783          	ld	a5,-48(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fc843783          	ld	a5,-56(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002504:	a891                	j	80002558 <copyinstr+0xd6>
      if(*p == '\0'){
    80002506:	fd843783          	ld	a5,-40(s0)
    8000250a:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000250e:	eb89                	bnez	a5,80002520 <copyinstr+0x9e>
        *dst = '\0';
    80002510:	fb043783          	ld	a5,-80(s0)
    80002514:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002518:	4785                	li	a5,1
    8000251a:	fef42223          	sw	a5,-28(s0)
        break;
    8000251e:	a081                	j	8000255e <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002520:	fd843783          	ld	a5,-40(s0)
    80002524:	0007c703          	lbu	a4,0(a5)
    80002528:	fb043783          	ld	a5,-80(s0)
    8000252c:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002530:	fe843783          	ld	a5,-24(s0)
    80002534:	17fd                	addi	a5,a5,-1
    80002536:	fef43423          	sd	a5,-24(s0)
      --max;
    8000253a:	fa043783          	ld	a5,-96(s0)
    8000253e:	17fd                	addi	a5,a5,-1
    80002540:	faf43023          	sd	a5,-96(s0)
      p++;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0785                	addi	a5,a5,1
    8000254a:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000254e:	fb043783          	ld	a5,-80(s0)
    80002552:	0785                	addi	a5,a5,1
    80002554:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002558:	fe843783          	ld	a5,-24(s0)
    8000255c:	f7cd                	bnez	a5,80002506 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	6785                	lui	a5,0x1
    80002564:	97ba                	add	a5,a5,a4
    80002566:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000256a:	fe442783          	lw	a5,-28(s0)
    8000256e:	2781                	sext.w	a5,a5
    80002570:	e781                	bnez	a5,80002578 <copyinstr+0xf6>
    80002572:	fa043783          	ld	a5,-96(s0)
    80002576:	f78d                	bnez	a5,800024a0 <copyinstr+0x1e>
  }
  if(got_null){
    80002578:	fe442783          	lw	a5,-28(s0)
    8000257c:	2781                	sext.w	a5,a5
    8000257e:	c399                	beqz	a5,80002584 <copyinstr+0x102>
    return 0;
    80002580:	4781                	li	a5,0
    80002582:	a011                	j	80002586 <copyinstr+0x104>
  } else {
    return -1;
    80002584:	57fd                	li	a5,-1
  }
}
    80002586:	853e                	mv	a0,a5
    80002588:	60e6                	ld	ra,88(sp)
    8000258a:	6446                	ld	s0,80(sp)
    8000258c:	6125                	addi	sp,sp,96
    8000258e:	8082                	ret

0000000080002590 <r_sstatus>:
{
    80002590:	1101                	addi	sp,sp,-32
    80002592:	ec22                	sd	s0,24(sp)
    80002594:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002596:	100027f3          	csrr	a5,sstatus
    8000259a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000259e:	fe843783          	ld	a5,-24(s0)
}
    800025a2:	853e                	mv	a0,a5
    800025a4:	6462                	ld	s0,24(sp)
    800025a6:	6105                	addi	sp,sp,32
    800025a8:	8082                	ret

00000000800025aa <w_sstatus>:
{
    800025aa:	1101                	addi	sp,sp,-32
    800025ac:	ec22                	sd	s0,24(sp)
    800025ae:	1000                	addi	s0,sp,32
    800025b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025b4:	fe843783          	ld	a5,-24(s0)
    800025b8:	10079073          	csrw	sstatus,a5
}
    800025bc:	0001                	nop
    800025be:	6462                	ld	s0,24(sp)
    800025c0:	6105                	addi	sp,sp,32
    800025c2:	8082                	ret

00000000800025c4 <intr_on>:
{
    800025c4:	1141                	addi	sp,sp,-16
    800025c6:	e406                	sd	ra,8(sp)
    800025c8:	e022                	sd	s0,0(sp)
    800025ca:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <r_sstatus>
    800025d4:	87aa                	mv	a5,a0
    800025d6:	0027e793          	ori	a5,a5,2
    800025da:	853e                	mv	a0,a5
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fce080e7          	jalr	-50(ra) # 800025aa <w_sstatus>
}
    800025e4:	0001                	nop
    800025e6:	60a2                	ld	ra,8(sp)
    800025e8:	6402                	ld	s0,0(sp)
    800025ea:	0141                	addi	sp,sp,16
    800025ec:	8082                	ret

00000000800025ee <intr_get>:
{
    800025ee:	1101                	addi	sp,sp,-32
    800025f0:	ec06                	sd	ra,24(sp)
    800025f2:	e822                	sd	s0,16(sp)
    800025f4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	f9a080e7          	jalr	-102(ra) # 80002590 <r_sstatus>
    800025fe:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002602:	fe843783          	ld	a5,-24(s0)
    80002606:	8b89                	andi	a5,a5,2
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	2781                	sext.w	a5,a5
}
    80002612:	853e                	mv	a0,a5
    80002614:	60e2                	ld	ra,24(sp)
    80002616:	6442                	ld	s0,16(sp)
    80002618:	6105                	addi	sp,sp,32
    8000261a:	8082                	ret

000000008000261c <r_tp>:
{
    8000261c:	1101                	addi	sp,sp,-32
    8000261e:	ec22                	sd	s0,24(sp)
    80002620:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002622:	8792                	mv	a5,tp
    80002624:	fef43423          	sd	a5,-24(s0)
  return x;
    80002628:	fe843783          	ld	a5,-24(s0)
}
    8000262c:	853e                	mv	a0,a5
    8000262e:	6462                	ld	s0,24(sp)
    80002630:	6105                	addi	sp,sp,32
    80002632:	8082                	ret

0000000080002634 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002634:	7139                	addi	sp,sp,-64
    80002636:	fc06                	sd	ra,56(sp)
    80002638:	f822                	sd	s0,48(sp)
    8000263a:	0080                	addi	s0,sp,64
    8000263c:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002640:	00012797          	auipc	a5,0x12
    80002644:	05878793          	addi	a5,a5,88 # 80014698 <proc>
    80002648:	fef43423          	sd	a5,-24(s0)
    8000264c:	a061                	j	800026d4 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000264e:	fffff097          	auipc	ra,0xfffff
    80002652:	acc080e7          	jalr	-1332(ra) # 8000111a <kalloc>
    80002656:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000265a:	fe043783          	ld	a5,-32(s0)
    8000265e:	eb89                	bnez	a5,80002670 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002660:	00009517          	auipc	a0,0x9
    80002664:	b6050513          	addi	a0,a0,-1184 # 8000b1c0 <etext+0x1c0>
    80002668:	ffffe097          	auipc	ra,0xffffe
    8000266c:	616080e7          	jalr	1558(ra) # 80000c7e <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002670:	fe843703          	ld	a4,-24(s0)
    80002674:	00012797          	auipc	a5,0x12
    80002678:	02478793          	addi	a5,a5,36 # 80014698 <proc>
    8000267c:	40f707b3          	sub	a5,a4,a5
    80002680:	4037d713          	srai	a4,a5,0x3
    80002684:	00009797          	auipc	a5,0x9
    80002688:	c2c78793          	addi	a5,a5,-980 # 8000b2b0 <etext+0x2b0>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	02f707b3          	mul	a5,a4,a5
    80002692:	2781                	sext.w	a5,a5
    80002694:	2785                	addiw	a5,a5,1
    80002696:	2781                	sext.w	a5,a5
    80002698:	00d7979b          	slliw	a5,a5,0xd
    8000269c:	2781                	sext.w	a5,a5
    8000269e:	873e                	mv	a4,a5
    800026a0:	040007b7          	lui	a5,0x4000
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	07b2                	slli	a5,a5,0xc
    800026a8:	8f99                	sub	a5,a5,a4
    800026aa:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026ae:	fe043783          	ld	a5,-32(s0)
    800026b2:	4719                	li	a4,6
    800026b4:	6685                	lui	a3,0x1
    800026b6:	863e                	mv	a2,a5
    800026b8:	fd843583          	ld	a1,-40(s0)
    800026bc:	fc843503          	ld	a0,-56(s0)
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	54c080e7          	jalr	1356(ra) # 80001c0c <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800026d0:	fef43423          	sd	a5,-24(s0)
    800026d4:	fe843703          	ld	a4,-24(s0)
    800026d8:	00018797          	auipc	a5,0x18
    800026dc:	9c078793          	addi	a5,a5,-1600 # 8001a098 <pid_lock>
    800026e0:	f6f767e3          	bltu	a4,a5,8000264e <proc_mapstacks+0x1a>
  }
}
    800026e4:	0001                	nop
    800026e6:	0001                	nop
    800026e8:	70e2                	ld	ra,56(sp)
    800026ea:	7442                	ld	s0,48(sp)
    800026ec:	6121                	addi	sp,sp,64
    800026ee:	8082                	ret

00000000800026f0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026f0:	1101                	addi	sp,sp,-32
    800026f2:	ec06                	sd	ra,24(sp)
    800026f4:	e822                	sd	s0,16(sp)
    800026f6:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026f8:	00009597          	auipc	a1,0x9
    800026fc:	ad058593          	addi	a1,a1,-1328 # 8000b1c8 <etext+0x1c8>
    80002700:	00018517          	auipc	a0,0x18
    80002704:	99850513          	addi	a0,a0,-1640 # 8001a098 <pid_lock>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002710:	00009597          	auipc	a1,0x9
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000b1d0 <etext+0x1d0>
    80002718:	00018517          	auipc	a0,0x18
    8000271c:	99850513          	addi	a0,a0,-1640 # 8001a0b0 <wait_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	f7078793          	addi	a5,a5,-144 # 80014698 <proc>
    80002730:	fef43423          	sd	a5,-24(s0)
    80002734:	a09d                	j	8000279a <procinit+0xaa>
      initlock(&p->lock, "proc");
    80002736:	fe843783          	ld	a5,-24(s0)
    8000273a:	00009597          	auipc	a1,0x9
    8000273e:	aa658593          	addi	a1,a1,-1370 # 8000b1e0 <etext+0x1e0>
    80002742:	853e                	mv	a0,a5
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	afa080e7          	jalr	-1286(ra) # 8000123e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    8000274c:	fe843703          	ld	a4,-24(s0)
    80002750:	00012797          	auipc	a5,0x12
    80002754:	f4878793          	addi	a5,a5,-184 # 80014698 <proc>
    80002758:	40f707b3          	sub	a5,a4,a5
    8000275c:	4037d713          	srai	a4,a5,0x3
    80002760:	00009797          	auipc	a5,0x9
    80002764:	b5078793          	addi	a5,a5,-1200 # 8000b2b0 <etext+0x2b0>
    80002768:	639c                	ld	a5,0(a5)
    8000276a:	02f707b3          	mul	a5,a4,a5
    8000276e:	2781                	sext.w	a5,a5
    80002770:	2785                	addiw	a5,a5,1
    80002772:	2781                	sext.w	a5,a5
    80002774:	00d7979b          	slliw	a5,a5,0xd
    80002778:	2781                	sext.w	a5,a5
    8000277a:	873e                	mv	a4,a5
    8000277c:	040007b7          	lui	a5,0x4000
    80002780:	17fd                	addi	a5,a5,-1
    80002782:	07b2                	slli	a5,a5,0xc
    80002784:	8f99                	sub	a5,a5,a4
    80002786:	873e                	mv	a4,a5
    80002788:	fe843783          	ld	a5,-24(s0)
    8000278c:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    8000278e:	fe843783          	ld	a5,-24(s0)
    80002792:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002796:	fef43423          	sd	a5,-24(s0)
    8000279a:	fe843703          	ld	a4,-24(s0)
    8000279e:	00018797          	auipc	a5,0x18
    800027a2:	8fa78793          	addi	a5,a5,-1798 # 8001a098 <pid_lock>
    800027a6:	f8f768e3          	bltu	a4,a5,80002736 <procinit+0x46>
  }
}
    800027aa:	0001                	nop
    800027ac:	0001                	nop
    800027ae:	60e2                	ld	ra,24(sp)
    800027b0:	6442                	ld	s0,16(sp)
    800027b2:	6105                	addi	sp,sp,32
    800027b4:	8082                	ret

00000000800027b6 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027b6:	1101                	addi	sp,sp,-32
    800027b8:	ec06                	sd	ra,24(sp)
    800027ba:	e822                	sd	s0,16(sp)
    800027bc:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027be:	00000097          	auipc	ra,0x0
    800027c2:	e5e080e7          	jalr	-418(ra) # 8000261c <r_tp>
    800027c6:	87aa                	mv	a5,a0
    800027c8:	fef42623          	sw	a5,-20(s0)
  return id;
    800027cc:	fec42783          	lw	a5,-20(s0)
}
    800027d0:	853e                	mv	a0,a5
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027da:	1101                	addi	sp,sp,-32
    800027dc:	ec06                	sd	ra,24(sp)
    800027de:	e822                	sd	s0,16(sp)
    800027e0:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027e2:	00000097          	auipc	ra,0x0
    800027e6:	fd4080e7          	jalr	-44(ra) # 800027b6 <cpuid>
    800027ea:	87aa                	mv	a5,a0
    800027ec:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027f0:	fec42783          	lw	a5,-20(s0)
    800027f4:	00779713          	slli	a4,a5,0x7
    800027f8:	00012797          	auipc	a5,0x12
    800027fc:	aa078793          	addi	a5,a5,-1376 # 80014298 <cpus>
    80002800:	97ba                	add	a5,a5,a4
    80002802:	fef43023          	sd	a5,-32(s0)
  return c;
    80002806:	fe043783          	ld	a5,-32(s0)
}
    8000280a:	853e                	mv	a0,a5
    8000280c:	60e2                	ld	ra,24(sp)
    8000280e:	6442                	ld	s0,16(sp)
    80002810:	6105                	addi	sp,sp,32
    80002812:	8082                	ret

0000000080002814 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    80002814:	1101                	addi	sp,sp,-32
    80002816:	ec06                	sd	ra,24(sp)
    80002818:	e822                	sd	s0,16(sp)
    8000281a:	1000                	addi	s0,sp,32
  push_off();
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	b50080e7          	jalr	-1200(ra) # 8000136c <push_off>
  struct cpu *c = mycpu();
    80002824:	00000097          	auipc	ra,0x0
    80002828:	fb6080e7          	jalr	-74(ra) # 800027da <mycpu>
    8000282c:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002830:	fe843783          	ld	a5,-24(s0)
    80002834:	639c                	ld	a5,0(a5)
    80002836:	fef43023          	sd	a5,-32(s0)
  pop_off();
    8000283a:	fffff097          	auipc	ra,0xfffff
    8000283e:	b8a080e7          	jalr	-1142(ra) # 800013c4 <pop_off>
  return p;
    80002842:	fe043783          	ld	a5,-32(s0)
}
    80002846:	853e                	mv	a0,a5
    80002848:	60e2                	ld	ra,24(sp)
    8000284a:	6442                	ld	s0,16(sp)
    8000284c:	6105                	addi	sp,sp,32
    8000284e:	8082                	ret

0000000080002850 <allocpid>:

int
allocpid() {
    80002850:	1101                	addi	sp,sp,-32
    80002852:	ec06                	sd	ra,24(sp)
    80002854:	e822                	sd	s0,16(sp)
    80002856:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002858:	00018517          	auipc	a0,0x18
    8000285c:	84050513          	addi	a0,a0,-1984 # 8001a098 <pid_lock>
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	a0e080e7          	jalr	-1522(ra) # 8000126e <acquire>
  pid = nextpid;
    80002868:	00009797          	auipc	a5,0x9
    8000286c:	ec878793          	addi	a5,a5,-312 # 8000b730 <nextpid>
    80002870:	439c                	lw	a5,0(a5)
    80002872:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002876:	00009797          	auipc	a5,0x9
    8000287a:	eba78793          	addi	a5,a5,-326 # 8000b730 <nextpid>
    8000287e:	439c                	lw	a5,0(a5)
    80002880:	2785                	addiw	a5,a5,1
    80002882:	0007871b          	sext.w	a4,a5
    80002886:	00009797          	auipc	a5,0x9
    8000288a:	eaa78793          	addi	a5,a5,-342 # 8000b730 <nextpid>
    8000288e:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002890:	00018517          	auipc	a0,0x18
    80002894:	80850513          	addi	a0,a0,-2040 # 8001a098 <pid_lock>
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	a3a080e7          	jalr	-1478(ra) # 800012d2 <release>

  return pid;
    800028a0:	fec42783          	lw	a5,-20(s0)
}
    800028a4:	853e                	mv	a0,a5
    800028a6:	60e2                	ld	ra,24(sp)
    800028a8:	6442                	ld	s0,16(sp)
    800028aa:	6105                	addi	sp,sp,32
    800028ac:	8082                	ret

00000000800028ae <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028ae:	1101                	addi	sp,sp,-32
    800028b0:	ec06                	sd	ra,24(sp)
    800028b2:	e822                	sd	s0,16(sp)
    800028b4:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028b6:	00012797          	auipc	a5,0x12
    800028ba:	de278793          	addi	a5,a5,-542 # 80014698 <proc>
    800028be:	fef43423          	sd	a5,-24(s0)
    800028c2:	a80d                	j	800028f4 <allocproc+0x46>
    acquire(&p->lock);
    800028c4:	fe843783          	ld	a5,-24(s0)
    800028c8:	853e                	mv	a0,a5
    800028ca:	fffff097          	auipc	ra,0xfffff
    800028ce:	9a4080e7          	jalr	-1628(ra) # 8000126e <acquire>
    if(p->state == UNUSED) {
    800028d2:	fe843783          	ld	a5,-24(s0)
    800028d6:	4f9c                	lw	a5,24(a5)
    800028d8:	cb85                	beqz	a5,80002908 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    800028da:	fe843783          	ld	a5,-24(s0)
    800028de:	853e                	mv	a0,a5
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	9f2080e7          	jalr	-1550(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028e8:	fe843783          	ld	a5,-24(s0)
    800028ec:	16878793          	addi	a5,a5,360
    800028f0:	fef43423          	sd	a5,-24(s0)
    800028f4:	fe843703          	ld	a4,-24(s0)
    800028f8:	00017797          	auipc	a5,0x17
    800028fc:	7a078793          	addi	a5,a5,1952 # 8001a098 <pid_lock>
    80002900:	fcf762e3          	bltu	a4,a5,800028c4 <allocproc+0x16>
    }
  }
  return 0;
    80002904:	4781                	li	a5,0
    80002906:	a0e1                	j	800029ce <allocproc+0x120>
      goto found;
    80002908:	0001                	nop

found:
  p->pid = allocpid();
    8000290a:	00000097          	auipc	ra,0x0
    8000290e:	f46080e7          	jalr	-186(ra) # 80002850 <allocpid>
    80002912:	87aa                	mv	a5,a0
    80002914:	873e                	mv	a4,a5
    80002916:	fe843783          	ld	a5,-24(s0)
    8000291a:	db98                	sw	a4,48(a5)
  p->state = USED;
    8000291c:	fe843783          	ld	a5,-24(s0)
    80002920:	4705                	li	a4,1
    80002922:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002924:	ffffe097          	auipc	ra,0xffffe
    80002928:	7f6080e7          	jalr	2038(ra) # 8000111a <kalloc>
    8000292c:	872a                	mv	a4,a0
    8000292e:	fe843783          	ld	a5,-24(s0)
    80002932:	efb8                	sd	a4,88(a5)
    80002934:	fe843783          	ld	a5,-24(s0)
    80002938:	6fbc                	ld	a5,88(a5)
    8000293a:	e385                	bnez	a5,8000295a <allocproc+0xac>
    freeproc(p);
    8000293c:	fe843503          	ld	a0,-24(s0)
    80002940:	00000097          	auipc	ra,0x0
    80002944:	098080e7          	jalr	152(ra) # 800029d8 <freeproc>
    release(&p->lock);
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	853e                	mv	a0,a5
    8000294e:	fffff097          	auipc	ra,0xfffff
    80002952:	984080e7          	jalr	-1660(ra) # 800012d2 <release>
    return 0;
    80002956:	4781                	li	a5,0
    80002958:	a89d                	j	800029ce <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    8000295a:	fe843503          	ld	a0,-24(s0)
    8000295e:	00000097          	auipc	ra,0x0
    80002962:	118080e7          	jalr	280(ra) # 80002a76 <proc_pagetable>
    80002966:	872a                	mv	a4,a0
    80002968:	fe843783          	ld	a5,-24(s0)
    8000296c:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    8000296e:	fe843783          	ld	a5,-24(s0)
    80002972:	6bbc                	ld	a5,80(a5)
    80002974:	e385                	bnez	a5,80002994 <allocproc+0xe6>
    freeproc(p);
    80002976:	fe843503          	ld	a0,-24(s0)
    8000297a:	00000097          	auipc	ra,0x0
    8000297e:	05e080e7          	jalr	94(ra) # 800029d8 <freeproc>
    release(&p->lock);
    80002982:	fe843783          	ld	a5,-24(s0)
    80002986:	853e                	mv	a0,a5
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	94a080e7          	jalr	-1718(ra) # 800012d2 <release>
    return 0;
    80002990:	4781                	li	a5,0
    80002992:	a835                	j	800029ce <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002994:	fe843783          	ld	a5,-24(s0)
    80002998:	06078793          	addi	a5,a5,96
    8000299c:	07000613          	li	a2,112
    800029a0:	4581                	li	a1,0
    800029a2:	853e                	mv	a0,a5
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	a9e080e7          	jalr	-1378(ra) # 80001442 <memset>
  p->context.ra = (uint64)forkret;
    800029ac:	00001717          	auipc	a4,0x1
    800029b0:	a5c70713          	addi	a4,a4,-1444 # 80003408 <forkret>
    800029b4:	fe843783          	ld	a5,-24(s0)
    800029b8:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029ba:	fe843783          	ld	a5,-24(s0)
    800029be:	63b8                	ld	a4,64(a5)
    800029c0:	6785                	lui	a5,0x1
    800029c2:	973e                	add	a4,a4,a5
    800029c4:	fe843783          	ld	a5,-24(s0)
    800029c8:	f7b8                	sd	a4,104(a5)

  return p;
    800029ca:	fe843783          	ld	a5,-24(s0)
}
    800029ce:	853e                	mv	a0,a5
    800029d0:	60e2                	ld	ra,24(sp)
    800029d2:	6442                	ld	s0,16(sp)
    800029d4:	6105                	addi	sp,sp,32
    800029d6:	8082                	ret

00000000800029d8 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    800029d8:	1101                	addi	sp,sp,-32
    800029da:	ec06                	sd	ra,24(sp)
    800029dc:	e822                	sd	s0,16(sp)
    800029de:	1000                	addi	s0,sp,32
    800029e0:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    800029e4:	fe843783          	ld	a5,-24(s0)
    800029e8:	6fbc                	ld	a5,88(a5)
    800029ea:	cb89                	beqz	a5,800029fc <freeproc+0x24>
    kfree((void*)p->trapframe);
    800029ec:	fe843783          	ld	a5,-24(s0)
    800029f0:	6fbc                	ld	a5,88(a5)
    800029f2:	853e                	mv	a0,a5
    800029f4:	ffffe097          	auipc	ra,0xffffe
    800029f8:	682080e7          	jalr	1666(ra) # 80001076 <kfree>
  p->trapframe = 0;
    800029fc:	fe843783          	ld	a5,-24(s0)
    80002a00:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002a04:	fe843783          	ld	a5,-24(s0)
    80002a08:	6bbc                	ld	a5,80(a5)
    80002a0a:	cf89                	beqz	a5,80002a24 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a0c:	fe843783          	ld	a5,-24(s0)
    80002a10:	6bb8                	ld	a4,80(a5)
    80002a12:	fe843783          	ld	a5,-24(s0)
    80002a16:	67bc                	ld	a5,72(a5)
    80002a18:	85be                	mv	a1,a5
    80002a1a:	853a                	mv	a0,a4
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	11a080e7          	jalr	282(ra) # 80002b36 <proc_freepagetable>
  p->pagetable = 0;
    80002a24:	fe843783          	ld	a5,-24(s0)
    80002a28:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002a2c:	fe843783          	ld	a5,-24(s0)
    80002a30:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002a34:	fe843783          	ld	a5,-24(s0)
    80002a38:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002a3c:	fe843783          	ld	a5,-24(s0)
    80002a40:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002a44:	fe843783          	ld	a5,-24(s0)
    80002a48:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002a4c:	fe843783          	ld	a5,-24(s0)
    80002a50:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002a54:	fe843783          	ld	a5,-24(s0)
    80002a58:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002a5c:	fe843783          	ld	a5,-24(s0)
    80002a60:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002a64:	fe843783          	ld	a5,-24(s0)
    80002a68:	0007ac23          	sw	zero,24(a5)
}
    80002a6c:	0001                	nop
    80002a6e:	60e2                	ld	ra,24(sp)
    80002a70:	6442                	ld	s0,16(sp)
    80002a72:	6105                	addi	sp,sp,32
    80002a74:	8082                	ret

0000000080002a76 <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002a76:	7179                	addi	sp,sp,-48
    80002a78:	f406                	sd	ra,40(sp)
    80002a7a:	f022                	sd	s0,32(sp)
    80002a7c:	1800                	addi	s0,sp,48
    80002a7e:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002a82:	fffff097          	auipc	ra,0xfffff
    80002a86:	3c2080e7          	jalr	962(ra) # 80001e44 <uvmcreate>
    80002a8a:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002a8e:	fe843783          	ld	a5,-24(s0)
    80002a92:	e399                	bnez	a5,80002a98 <proc_pagetable+0x22>
    return 0;
    80002a94:	4781                	li	a5,0
    80002a96:	a859                	j	80002b2c <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002a98:	00007797          	auipc	a5,0x7
    80002a9c:	56878793          	addi	a5,a5,1384 # 8000a000 <_trampoline>
    80002aa0:	4729                	li	a4,10
    80002aa2:	86be                	mv	a3,a5
    80002aa4:	6605                	lui	a2,0x1
    80002aa6:	040007b7          	lui	a5,0x4000
    80002aaa:	17fd                	addi	a5,a5,-1
    80002aac:	00c79593          	slli	a1,a5,0xc
    80002ab0:	fe843503          	ld	a0,-24(s0)
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	1b2080e7          	jalr	434(ra) # 80001c66 <mappages>
    80002abc:	87aa                	mv	a5,a0
    80002abe:	0007db63          	bgez	a5,80002ad4 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002ac2:	4581                	li	a1,0
    80002ac4:	fe843503          	ld	a0,-24(s0)
    80002ac8:	fffff097          	auipc	ra,0xfffff
    80002acc:	66a080e7          	jalr	1642(ra) # 80002132 <uvmfree>
    return 0;
    80002ad0:	4781                	li	a5,0
    80002ad2:	a8a9                	j	80002b2c <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002ad4:	fd843783          	ld	a5,-40(s0)
    80002ad8:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002ada:	4719                	li	a4,6
    80002adc:	86be                	mv	a3,a5
    80002ade:	6605                	lui	a2,0x1
    80002ae0:	020007b7          	lui	a5,0x2000
    80002ae4:	17fd                	addi	a5,a5,-1
    80002ae6:	00d79593          	slli	a1,a5,0xd
    80002aea:	fe843503          	ld	a0,-24(s0)
    80002aee:	fffff097          	auipc	ra,0xfffff
    80002af2:	178080e7          	jalr	376(ra) # 80001c66 <mappages>
    80002af6:	87aa                	mv	a5,a0
    80002af8:	0207d863          	bgez	a5,80002b28 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002afc:	4681                	li	a3,0
    80002afe:	4605                	li	a2,1
    80002b00:	040007b7          	lui	a5,0x4000
    80002b04:	17fd                	addi	a5,a5,-1
    80002b06:	00c79593          	slli	a1,a5,0xc
    80002b0a:	fe843503          	ld	a0,-24(s0)
    80002b0e:	fffff097          	auipc	ra,0xfffff
    80002b12:	236080e7          	jalr	566(ra) # 80001d44 <uvmunmap>
    uvmfree(pagetable, 0);
    80002b16:	4581                	li	a1,0
    80002b18:	fe843503          	ld	a0,-24(s0)
    80002b1c:	fffff097          	auipc	ra,0xfffff
    80002b20:	616080e7          	jalr	1558(ra) # 80002132 <uvmfree>
    return 0;
    80002b24:	4781                	li	a5,0
    80002b26:	a019                	j	80002b2c <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b28:	fe843783          	ld	a5,-24(s0)
}
    80002b2c:	853e                	mv	a0,a5
    80002b2e:	70a2                	ld	ra,40(sp)
    80002b30:	7402                	ld	s0,32(sp)
    80002b32:	6145                	addi	sp,sp,48
    80002b34:	8082                	ret

0000000080002b36 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b36:	1101                	addi	sp,sp,-32
    80002b38:	ec06                	sd	ra,24(sp)
    80002b3a:	e822                	sd	s0,16(sp)
    80002b3c:	1000                	addi	s0,sp,32
    80002b3e:	fea43423          	sd	a0,-24(s0)
    80002b42:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b46:	4681                	li	a3,0
    80002b48:	4605                	li	a2,1
    80002b4a:	040007b7          	lui	a5,0x4000
    80002b4e:	17fd                	addi	a5,a5,-1
    80002b50:	00c79593          	slli	a1,a5,0xc
    80002b54:	fe843503          	ld	a0,-24(s0)
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	1ec080e7          	jalr	492(ra) # 80001d44 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b60:	4681                	li	a3,0
    80002b62:	4605                	li	a2,1
    80002b64:	020007b7          	lui	a5,0x2000
    80002b68:	17fd                	addi	a5,a5,-1
    80002b6a:	00d79593          	slli	a1,a5,0xd
    80002b6e:	fe843503          	ld	a0,-24(s0)
    80002b72:	fffff097          	auipc	ra,0xfffff
    80002b76:	1d2080e7          	jalr	466(ra) # 80001d44 <uvmunmap>
  uvmfree(pagetable, sz);
    80002b7a:	fe043583          	ld	a1,-32(s0)
    80002b7e:	fe843503          	ld	a0,-24(s0)
    80002b82:	fffff097          	auipc	ra,0xfffff
    80002b86:	5b0080e7          	jalr	1456(ra) # 80002132 <uvmfree>
}
    80002b8a:	0001                	nop
    80002b8c:	60e2                	ld	ra,24(sp)
    80002b8e:	6442                	ld	s0,16(sp)
    80002b90:	6105                	addi	sp,sp,32
    80002b92:	8082                	ret

0000000080002b94 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002b94:	1101                	addi	sp,sp,-32
    80002b96:	ec06                	sd	ra,24(sp)
    80002b98:	e822                	sd	s0,16(sp)
    80002b9a:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002b9c:	00000097          	auipc	ra,0x0
    80002ba0:	d12080e7          	jalr	-750(ra) # 800028ae <allocproc>
    80002ba4:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002ba8:	00009797          	auipc	a5,0x9
    80002bac:	47878793          	addi	a5,a5,1144 # 8000c020 <initproc>
    80002bb0:	fe843703          	ld	a4,-24(s0)
    80002bb4:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002bb6:	fe843783          	ld	a5,-24(s0)
    80002bba:	6bbc                	ld	a5,80(a5)
    80002bbc:	03400613          	li	a2,52
    80002bc0:	00009597          	auipc	a1,0x9
    80002bc4:	b9858593          	addi	a1,a1,-1128 # 8000b758 <initcode>
    80002bc8:	853e                	mv	a0,a5
    80002bca:	fffff097          	auipc	ra,0xfffff
    80002bce:	2b6080e7          	jalr	694(ra) # 80001e80 <uvminit>
  p->sz = PGSIZE;
    80002bd2:	fe843783          	ld	a5,-24(s0)
    80002bd6:	6705                	lui	a4,0x1
    80002bd8:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002bda:	fe843783          	ld	a5,-24(s0)
    80002bde:	6fbc                	ld	a5,88(a5)
    80002be0:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002be4:	fe843783          	ld	a5,-24(s0)
    80002be8:	6fbc                	ld	a5,88(a5)
    80002bea:	6705                	lui	a4,0x1
    80002bec:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002bee:	fe843783          	ld	a5,-24(s0)
    80002bf2:	15878793          	addi	a5,a5,344
    80002bf6:	4641                	li	a2,16
    80002bf8:	00008597          	auipc	a1,0x8
    80002bfc:	5f058593          	addi	a1,a1,1520 # 8000b1e8 <etext+0x1e8>
    80002c00:	853e                	mv	a0,a5
    80002c02:	fffff097          	auipc	ra,0xfffff
    80002c06:	b44080e7          	jalr	-1212(ra) # 80001746 <safestrcpy>
  p->cwd = namei("/");
    80002c0a:	00008517          	auipc	a0,0x8
    80002c0e:	5ee50513          	addi	a0,a0,1518 # 8000b1f8 <etext+0x1f8>
    80002c12:	00003097          	auipc	ra,0x3
    80002c16:	134080e7          	jalr	308(ra) # 80005d46 <namei>
    80002c1a:	872a                	mv	a4,a0
    80002c1c:	fe843783          	ld	a5,-24(s0)
    80002c20:	14e7b823          	sd	a4,336(a5)

  put(p);
    80002c24:	fe843503          	ld	a0,-24(s0)
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	60a080e7          	jalr	1546(ra) # 80003232 <put>

  release(&p->lock);
    80002c30:	fe843783          	ld	a5,-24(s0)
    80002c34:	853e                	mv	a0,a5
    80002c36:	ffffe097          	auipc	ra,0xffffe
    80002c3a:	69c080e7          	jalr	1692(ra) # 800012d2 <release>
}
    80002c3e:	0001                	nop
    80002c40:	60e2                	ld	ra,24(sp)
    80002c42:	6442                	ld	s0,16(sp)
    80002c44:	6105                	addi	sp,sp,32
    80002c46:	8082                	ret

0000000080002c48 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c48:	7179                	addi	sp,sp,-48
    80002c4a:	f406                	sd	ra,40(sp)
    80002c4c:	f022                	sd	s0,32(sp)
    80002c4e:	1800                	addi	s0,sp,48
    80002c50:	87aa                	mv	a5,a0
    80002c52:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002c56:	00000097          	auipc	ra,0x0
    80002c5a:	bbe080e7          	jalr	-1090(ra) # 80002814 <myproc>
    80002c5e:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c62:	fe043783          	ld	a5,-32(s0)
    80002c66:	67bc                	ld	a5,72(a5)
    80002c68:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002c6c:	fdc42783          	lw	a5,-36(s0)
    80002c70:	2781                	sext.w	a5,a5
    80002c72:	02f05e63          	blez	a5,80002cae <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002c76:	fe043783          	ld	a5,-32(s0)
    80002c7a:	6bb4                	ld	a3,80(a5)
    80002c7c:	fec46583          	lwu	a1,-20(s0)
    80002c80:	fdc42783          	lw	a5,-36(s0)
    80002c84:	fec42703          	lw	a4,-20(s0)
    80002c88:	9fb9                	addw	a5,a5,a4
    80002c8a:	2781                	sext.w	a5,a5
    80002c8c:	1782                	slli	a5,a5,0x20
    80002c8e:	9381                	srli	a5,a5,0x20
    80002c90:	863e                	mv	a2,a5
    80002c92:	8536                	mv	a0,a3
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	274080e7          	jalr	628(ra) # 80001f08 <uvmalloc>
    80002c9c:	87aa                	mv	a5,a0
    80002c9e:	fef42623          	sw	a5,-20(s0)
    80002ca2:	fec42783          	lw	a5,-20(s0)
    80002ca6:	2781                	sext.w	a5,a5
    80002ca8:	ef95                	bnez	a5,80002ce4 <growproc+0x9c>
      return -1;
    80002caa:	57fd                	li	a5,-1
    80002cac:	a091                	j	80002cf0 <growproc+0xa8>
    }
  } else if(n < 0){
    80002cae:	fdc42783          	lw	a5,-36(s0)
    80002cb2:	2781                	sext.w	a5,a5
    80002cb4:	0207d863          	bgez	a5,80002ce4 <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002cb8:	fe043783          	ld	a5,-32(s0)
    80002cbc:	6bb4                	ld	a3,80(a5)
    80002cbe:	fec46583          	lwu	a1,-20(s0)
    80002cc2:	fdc42783          	lw	a5,-36(s0)
    80002cc6:	fec42703          	lw	a4,-20(s0)
    80002cca:	9fb9                	addw	a5,a5,a4
    80002ccc:	2781                	sext.w	a5,a5
    80002cce:	1782                	slli	a5,a5,0x20
    80002cd0:	9381                	srli	a5,a5,0x20
    80002cd2:	863e                	mv	a2,a5
    80002cd4:	8536                	mv	a0,a3
    80002cd6:	fffff097          	auipc	ra,0xfffff
    80002cda:	316080e7          	jalr	790(ra) # 80001fec <uvmdealloc>
    80002cde:	87aa                	mv	a5,a0
    80002ce0:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002ce4:	fec46703          	lwu	a4,-20(s0)
    80002ce8:	fe043783          	ld	a5,-32(s0)
    80002cec:	e7b8                	sd	a4,72(a5)
  return 0;
    80002cee:	4781                	li	a5,0
}
    80002cf0:	853e                	mv	a0,a5
    80002cf2:	70a2                	ld	ra,40(sp)
    80002cf4:	7402                	ld	s0,32(sp)
    80002cf6:	6145                	addi	sp,sp,48
    80002cf8:	8082                	ret

0000000080002cfa <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002cfa:	7179                	addi	sp,sp,-48
    80002cfc:	f406                	sd	ra,40(sp)
    80002cfe:	f022                	sd	s0,32(sp)
    80002d00:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d02:	00000097          	auipc	ra,0x0
    80002d06:	b12080e7          	jalr	-1262(ra) # 80002814 <myproc>
    80002d0a:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002d0e:	00000097          	auipc	ra,0x0
    80002d12:	ba0080e7          	jalr	-1120(ra) # 800028ae <allocproc>
    80002d16:	fca43c23          	sd	a0,-40(s0)
    80002d1a:	fd843783          	ld	a5,-40(s0)
    80002d1e:	e399                	bnez	a5,80002d24 <fork+0x2a>
    return -1;
    80002d20:	57fd                	li	a5,-1
    80002d22:	a241                	j	80002ea2 <fork+0x1a8>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002d24:	fe043783          	ld	a5,-32(s0)
    80002d28:	6bb8                	ld	a4,80(a5)
    80002d2a:	fd843783          	ld	a5,-40(s0)
    80002d2e:	6bb4                	ld	a3,80(a5)
    80002d30:	fe043783          	ld	a5,-32(s0)
    80002d34:	67bc                	ld	a5,72(a5)
    80002d36:	863e                	mv	a2,a5
    80002d38:	85b6                	mv	a1,a3
    80002d3a:	853a                	mv	a0,a4
    80002d3c:	fffff097          	auipc	ra,0xfffff
    80002d40:	440080e7          	jalr	1088(ra) # 8000217c <uvmcopy>
    80002d44:	87aa                	mv	a5,a0
    80002d46:	0207d163          	bgez	a5,80002d68 <fork+0x6e>
    freeproc(np);
    80002d4a:	fd843503          	ld	a0,-40(s0)
    80002d4e:	00000097          	auipc	ra,0x0
    80002d52:	c8a080e7          	jalr	-886(ra) # 800029d8 <freeproc>
    release(&np->lock);
    80002d56:	fd843783          	ld	a5,-40(s0)
    80002d5a:	853e                	mv	a0,a5
    80002d5c:	ffffe097          	auipc	ra,0xffffe
    80002d60:	576080e7          	jalr	1398(ra) # 800012d2 <release>
    return -1;
    80002d64:	57fd                	li	a5,-1
    80002d66:	aa35                	j	80002ea2 <fork+0x1a8>
  }
  np->sz = p->sz;
    80002d68:	fe043783          	ld	a5,-32(s0)
    80002d6c:	67b8                	ld	a4,72(a5)
    80002d6e:	fd843783          	ld	a5,-40(s0)
    80002d72:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002d74:	fe043783          	ld	a5,-32(s0)
    80002d78:	6fb8                	ld	a4,88(a5)
    80002d7a:	fd843783          	ld	a5,-40(s0)
    80002d7e:	6fbc                	ld	a5,88(a5)
    80002d80:	86be                	mv	a3,a5
    80002d82:	12000793          	li	a5,288
    80002d86:	863e                	mv	a2,a5
    80002d88:	85ba                	mv	a1,a4
    80002d8a:	8536                	mv	a0,a3
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	876080e7          	jalr	-1930(ra) # 80001602 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002d94:	fd843783          	ld	a5,-40(s0)
    80002d98:	6fbc                	ld	a5,88(a5)
    80002d9a:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002d9e:	fe042623          	sw	zero,-20(s0)
    80002da2:	a0a9                	j	80002dec <fork+0xf2>
    if(p->ofile[i])
    80002da4:	fe043703          	ld	a4,-32(s0)
    80002da8:	fec42783          	lw	a5,-20(s0)
    80002dac:	07e9                	addi	a5,a5,26
    80002dae:	078e                	slli	a5,a5,0x3
    80002db0:	97ba                	add	a5,a5,a4
    80002db2:	639c                	ld	a5,0(a5)
    80002db4:	c79d                	beqz	a5,80002de2 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002db6:	fe043703          	ld	a4,-32(s0)
    80002dba:	fec42783          	lw	a5,-20(s0)
    80002dbe:	07e9                	addi	a5,a5,26
    80002dc0:	078e                	slli	a5,a5,0x3
    80002dc2:	97ba                	add	a5,a5,a4
    80002dc4:	639c                	ld	a5,0(a5)
    80002dc6:	853e                	mv	a0,a5
    80002dc8:	00004097          	auipc	ra,0x4
    80002dcc:	916080e7          	jalr	-1770(ra) # 800066de <filedup>
    80002dd0:	86aa                	mv	a3,a0
    80002dd2:	fd843703          	ld	a4,-40(s0)
    80002dd6:	fec42783          	lw	a5,-20(s0)
    80002dda:	07e9                	addi	a5,a5,26
    80002ddc:	078e                	slli	a5,a5,0x3
    80002dde:	97ba                	add	a5,a5,a4
    80002de0:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002de2:	fec42783          	lw	a5,-20(s0)
    80002de6:	2785                	addiw	a5,a5,1
    80002de8:	fef42623          	sw	a5,-20(s0)
    80002dec:	fec42783          	lw	a5,-20(s0)
    80002df0:	0007871b          	sext.w	a4,a5
    80002df4:	47bd                	li	a5,15
    80002df6:	fae7d7e3          	bge	a5,a4,80002da4 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002dfa:	fe043783          	ld	a5,-32(s0)
    80002dfe:	1507b783          	ld	a5,336(a5)
    80002e02:	853e                	mv	a0,a5
    80002e04:	00002097          	auipc	ra,0x2
    80002e08:	200080e7          	jalr	512(ra) # 80005004 <idup>
    80002e0c:	872a                	mv	a4,a0
    80002e0e:	fd843783          	ld	a5,-40(s0)
    80002e12:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002e16:	fd843783          	ld	a5,-40(s0)
    80002e1a:	15878713          	addi	a4,a5,344
    80002e1e:	fe043783          	ld	a5,-32(s0)
    80002e22:	15878793          	addi	a5,a5,344
    80002e26:	4641                	li	a2,16
    80002e28:	85be                	mv	a1,a5
    80002e2a:	853a                	mv	a0,a4
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	91a080e7          	jalr	-1766(ra) # 80001746 <safestrcpy>

  pid = np->pid;
    80002e34:	fd843783          	ld	a5,-40(s0)
    80002e38:	5b9c                	lw	a5,48(a5)
    80002e3a:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002e3e:	fd843783          	ld	a5,-40(s0)
    80002e42:	853e                	mv	a0,a5
    80002e44:	ffffe097          	auipc	ra,0xffffe
    80002e48:	48e080e7          	jalr	1166(ra) # 800012d2 <release>

  acquire(&wait_lock);
    80002e4c:	00017517          	auipc	a0,0x17
    80002e50:	26450513          	addi	a0,a0,612 # 8001a0b0 <wait_lock>
    80002e54:	ffffe097          	auipc	ra,0xffffe
    80002e58:	41a080e7          	jalr	1050(ra) # 8000126e <acquire>
  np->parent = p;
    80002e5c:	fd843783          	ld	a5,-40(s0)
    80002e60:	fe043703          	ld	a4,-32(s0)
    80002e64:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002e66:	00017517          	auipc	a0,0x17
    80002e6a:	24a50513          	addi	a0,a0,586 # 8001a0b0 <wait_lock>
    80002e6e:	ffffe097          	auipc	ra,0xffffe
    80002e72:	464080e7          	jalr	1124(ra) # 800012d2 <release>

  acquire(&np->lock);
    80002e76:	fd843783          	ld	a5,-40(s0)
    80002e7a:	853e                	mv	a0,a5
    80002e7c:	ffffe097          	auipc	ra,0xffffe
    80002e80:	3f2080e7          	jalr	1010(ra) # 8000126e <acquire>
  put(np);
    80002e84:	fd843503          	ld	a0,-40(s0)
    80002e88:	00000097          	auipc	ra,0x0
    80002e8c:	3aa080e7          	jalr	938(ra) # 80003232 <put>
  release(&np->lock);
    80002e90:	fd843783          	ld	a5,-40(s0)
    80002e94:	853e                	mv	a0,a5
    80002e96:	ffffe097          	auipc	ra,0xffffe
    80002e9a:	43c080e7          	jalr	1084(ra) # 800012d2 <release>

  return pid;
    80002e9e:	fd442783          	lw	a5,-44(s0)
}
    80002ea2:	853e                	mv	a0,a5
    80002ea4:	70a2                	ld	ra,40(sp)
    80002ea6:	7402                	ld	s0,32(sp)
    80002ea8:	6145                	addi	sp,sp,48
    80002eaa:	8082                	ret

0000000080002eac <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002eac:	7179                	addi	sp,sp,-48
    80002eae:	f406                	sd	ra,40(sp)
    80002eb0:	f022                	sd	s0,32(sp)
    80002eb2:	1800                	addi	s0,sp,48
    80002eb4:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002eb8:	00011797          	auipc	a5,0x11
    80002ebc:	7e078793          	addi	a5,a5,2016 # 80014698 <proc>
    80002ec0:	fef43423          	sd	a5,-24(s0)
    80002ec4:	a081                	j	80002f04 <reparent+0x58>
    if(pp->parent == p){
    80002ec6:	fe843783          	ld	a5,-24(s0)
    80002eca:	7f9c                	ld	a5,56(a5)
    80002ecc:	fd843703          	ld	a4,-40(s0)
    80002ed0:	02f71463          	bne	a4,a5,80002ef8 <reparent+0x4c>
      pp->parent = initproc;
    80002ed4:	00009797          	auipc	a5,0x9
    80002ed8:	14c78793          	addi	a5,a5,332 # 8000c020 <initproc>
    80002edc:	6398                	ld	a4,0(a5)
    80002ede:	fe843783          	ld	a5,-24(s0)
    80002ee2:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002ee4:	00009797          	auipc	a5,0x9
    80002ee8:	13c78793          	addi	a5,a5,316 # 8000c020 <initproc>
    80002eec:	639c                	ld	a5,0(a5)
    80002eee:	853e                	mv	a0,a5
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	5e4080e7          	jalr	1508(ra) # 800034d4 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002ef8:	fe843783          	ld	a5,-24(s0)
    80002efc:	16878793          	addi	a5,a5,360
    80002f00:	fef43423          	sd	a5,-24(s0)
    80002f04:	fe843703          	ld	a4,-24(s0)
    80002f08:	00017797          	auipc	a5,0x17
    80002f0c:	19078793          	addi	a5,a5,400 # 8001a098 <pid_lock>
    80002f10:	faf76be3          	bltu	a4,a5,80002ec6 <reparent+0x1a>
    }
  }
}
    80002f14:	0001                	nop
    80002f16:	0001                	nop
    80002f18:	70a2                	ld	ra,40(sp)
    80002f1a:	7402                	ld	s0,32(sp)
    80002f1c:	6145                	addi	sp,sp,48
    80002f1e:	8082                	ret

0000000080002f20 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002f20:	7139                	addi	sp,sp,-64
    80002f22:	fc06                	sd	ra,56(sp)
    80002f24:	f822                	sd	s0,48(sp)
    80002f26:	0080                	addi	s0,sp,64
    80002f28:	87aa                	mv	a5,a0
    80002f2a:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002f2e:	00000097          	auipc	ra,0x0
    80002f32:	8e6080e7          	jalr	-1818(ra) # 80002814 <myproc>
    80002f36:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002f3a:	00009797          	auipc	a5,0x9
    80002f3e:	0e678793          	addi	a5,a5,230 # 8000c020 <initproc>
    80002f42:	639c                	ld	a5,0(a5)
    80002f44:	fe043703          	ld	a4,-32(s0)
    80002f48:	00f71a63          	bne	a4,a5,80002f5c <exit+0x3c>
    panic("init exiting");
    80002f4c:	00008517          	auipc	a0,0x8
    80002f50:	2b450513          	addi	a0,a0,692 # 8000b200 <etext+0x200>
    80002f54:	ffffe097          	auipc	ra,0xffffe
    80002f58:	d2a080e7          	jalr	-726(ra) # 80000c7e <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002f5c:	fe042623          	sw	zero,-20(s0)
    80002f60:	a881                	j	80002fb0 <exit+0x90>
    if(p->ofile[fd]){
    80002f62:	fe043703          	ld	a4,-32(s0)
    80002f66:	fec42783          	lw	a5,-20(s0)
    80002f6a:	07e9                	addi	a5,a5,26
    80002f6c:	078e                	slli	a5,a5,0x3
    80002f6e:	97ba                	add	a5,a5,a4
    80002f70:	639c                	ld	a5,0(a5)
    80002f72:	cb95                	beqz	a5,80002fa6 <exit+0x86>
      struct file *f = p->ofile[fd];
    80002f74:	fe043703          	ld	a4,-32(s0)
    80002f78:	fec42783          	lw	a5,-20(s0)
    80002f7c:	07e9                	addi	a5,a5,26
    80002f7e:	078e                	slli	a5,a5,0x3
    80002f80:	97ba                	add	a5,a5,a4
    80002f82:	639c                	ld	a5,0(a5)
    80002f84:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80002f88:	fd843503          	ld	a0,-40(s0)
    80002f8c:	00003097          	auipc	ra,0x3
    80002f90:	7b8080e7          	jalr	1976(ra) # 80006744 <fileclose>
      p->ofile[fd] = 0;
    80002f94:	fe043703          	ld	a4,-32(s0)
    80002f98:	fec42783          	lw	a5,-20(s0)
    80002f9c:	07e9                	addi	a5,a5,26
    80002f9e:	078e                	slli	a5,a5,0x3
    80002fa0:	97ba                	add	a5,a5,a4
    80002fa2:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80002fa6:	fec42783          	lw	a5,-20(s0)
    80002faa:	2785                	addiw	a5,a5,1
    80002fac:	fef42623          	sw	a5,-20(s0)
    80002fb0:	fec42783          	lw	a5,-20(s0)
    80002fb4:	0007871b          	sext.w	a4,a5
    80002fb8:	47bd                	li	a5,15
    80002fba:	fae7d4e3          	bge	a5,a4,80002f62 <exit+0x42>
    }
  }

  begin_op();
    80002fbe:	00003097          	auipc	ra,0x3
    80002fc2:	0ec080e7          	jalr	236(ra) # 800060aa <begin_op>
  iput(p->cwd);
    80002fc6:	fe043783          	ld	a5,-32(s0)
    80002fca:	1507b783          	ld	a5,336(a5)
    80002fce:	853e                	mv	a0,a5
    80002fd0:	00002097          	auipc	ra,0x2
    80002fd4:	20e080e7          	jalr	526(ra) # 800051de <iput>
  end_op();
    80002fd8:	00003097          	auipc	ra,0x3
    80002fdc:	194080e7          	jalr	404(ra) # 8000616c <end_op>
  p->cwd = 0;
    80002fe0:	fe043783          	ld	a5,-32(s0)
    80002fe4:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80002fe8:	00017517          	auipc	a0,0x17
    80002fec:	0c850513          	addi	a0,a0,200 # 8001a0b0 <wait_lock>
    80002ff0:	ffffe097          	auipc	ra,0xffffe
    80002ff4:	27e080e7          	jalr	638(ra) # 8000126e <acquire>

  // Give any children to init.
  reparent(p);
    80002ff8:	fe043503          	ld	a0,-32(s0)
    80002ffc:	00000097          	auipc	ra,0x0
    80003000:	eb0080e7          	jalr	-336(ra) # 80002eac <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003004:	fe043783          	ld	a5,-32(s0)
    80003008:	7f9c                	ld	a5,56(a5)
    8000300a:	853e                	mv	a0,a5
    8000300c:	00000097          	auipc	ra,0x0
    80003010:	4c8080e7          	jalr	1224(ra) # 800034d4 <wakeup>
  
  acquire(&p->lock);
    80003014:	fe043783          	ld	a5,-32(s0)
    80003018:	853e                	mv	a0,a5
    8000301a:	ffffe097          	auipc	ra,0xffffe
    8000301e:	254080e7          	jalr	596(ra) # 8000126e <acquire>

  p->xstate = status;
    80003022:	fe043783          	ld	a5,-32(s0)
    80003026:	fcc42703          	lw	a4,-52(s0)
    8000302a:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    8000302c:	fe043783          	ld	a5,-32(s0)
    80003030:	4715                	li	a4,5
    80003032:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003034:	00017517          	auipc	a0,0x17
    80003038:	07c50513          	addi	a0,a0,124 # 8001a0b0 <wait_lock>
    8000303c:	ffffe097          	auipc	ra,0xffffe
    80003040:	296080e7          	jalr	662(ra) # 800012d2 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003044:	00000097          	auipc	ra,0x0
    80003048:	294080e7          	jalr	660(ra) # 800032d8 <sched>
  panic("zombie exit");
    8000304c:	00008517          	auipc	a0,0x8
    80003050:	1c450513          	addi	a0,a0,452 # 8000b210 <etext+0x210>
    80003054:	ffffe097          	auipc	ra,0xffffe
    80003058:	c2a080e7          	jalr	-982(ra) # 80000c7e <panic>

000000008000305c <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    8000305c:	7139                	addi	sp,sp,-64
    8000305e:	fc06                	sd	ra,56(sp)
    80003060:	f822                	sd	s0,48(sp)
    80003062:	0080                	addi	s0,sp,64
    80003064:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    80003068:	fffff097          	auipc	ra,0xfffff
    8000306c:	7ac080e7          	jalr	1964(ra) # 80002814 <myproc>
    80003070:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003074:	00017517          	auipc	a0,0x17
    80003078:	03c50513          	addi	a0,a0,60 # 8001a0b0 <wait_lock>
    8000307c:	ffffe097          	auipc	ra,0xffffe
    80003080:	1f2080e7          	jalr	498(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003084:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    80003088:	00011797          	auipc	a5,0x11
    8000308c:	61078793          	addi	a5,a5,1552 # 80014698 <proc>
    80003090:	fef43423          	sd	a5,-24(s0)
    80003094:	a8d1                	j	80003168 <wait+0x10c>
      if(np->parent == p){
    80003096:	fe843783          	ld	a5,-24(s0)
    8000309a:	7f9c                	ld	a5,56(a5)
    8000309c:	fd843703          	ld	a4,-40(s0)
    800030a0:	0af71e63          	bne	a4,a5,8000315c <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);
    800030a4:	fe843783          	ld	a5,-24(s0)
    800030a8:	853e                	mv	a0,a5
    800030aa:	ffffe097          	auipc	ra,0xffffe
    800030ae:	1c4080e7          	jalr	452(ra) # 8000126e <acquire>

        havekids = 1;
    800030b2:	4785                	li	a5,1
    800030b4:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    800030b8:	fe843783          	ld	a5,-24(s0)
    800030bc:	4f9c                	lw	a5,24(a5)
    800030be:	873e                	mv	a4,a5
    800030c0:	4795                	li	a5,5
    800030c2:	08f71663          	bne	a4,a5,8000314e <wait+0xf2>
          // Found one.
          pid = np->pid;
    800030c6:	fe843783          	ld	a5,-24(s0)
    800030ca:	5b9c                	lw	a5,48(a5)
    800030cc:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    800030d0:	fc843783          	ld	a5,-56(s0)
    800030d4:	c7a9                	beqz	a5,8000311e <wait+0xc2>
    800030d6:	fd843783          	ld	a5,-40(s0)
    800030da:	6bb8                	ld	a4,80(a5)
    800030dc:	fe843783          	ld	a5,-24(s0)
    800030e0:	02c78793          	addi	a5,a5,44
    800030e4:	4691                	li	a3,4
    800030e6:	863e                	mv	a2,a5
    800030e8:	fc843583          	ld	a1,-56(s0)
    800030ec:	853a                	mv	a0,a4
    800030ee:	fffff097          	auipc	ra,0xfffff
    800030f2:	1f8080e7          	jalr	504(ra) # 800022e6 <copyout>
    800030f6:	87aa                	mv	a5,a0
    800030f8:	0207d363          	bgez	a5,8000311e <wait+0xc2>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    800030fc:	fe843783          	ld	a5,-24(s0)
    80003100:	853e                	mv	a0,a5
    80003102:	ffffe097          	auipc	ra,0xffffe
    80003106:	1d0080e7          	jalr	464(ra) # 800012d2 <release>
            release(&wait_lock);
    8000310a:	00017517          	auipc	a0,0x17
    8000310e:	fa650513          	addi	a0,a0,-90 # 8001a0b0 <wait_lock>
    80003112:	ffffe097          	auipc	ra,0xffffe
    80003116:	1c0080e7          	jalr	448(ra) # 800012d2 <release>
            return -1;
    8000311a:	57fd                	li	a5,-1
    8000311c:	a859                	j	800031b2 <wait+0x156>
          }
          freeproc(np);
    8000311e:	fe843503          	ld	a0,-24(s0)
    80003122:	00000097          	auipc	ra,0x0
    80003126:	8b6080e7          	jalr	-1866(ra) # 800029d8 <freeproc>
          release(&np->lock);
    8000312a:	fe843783          	ld	a5,-24(s0)
    8000312e:	853e                	mv	a0,a5
    80003130:	ffffe097          	auipc	ra,0xffffe
    80003134:	1a2080e7          	jalr	418(ra) # 800012d2 <release>
          release(&wait_lock);
    80003138:	00017517          	auipc	a0,0x17
    8000313c:	f7850513          	addi	a0,a0,-136 # 8001a0b0 <wait_lock>
    80003140:	ffffe097          	auipc	ra,0xffffe
    80003144:	192080e7          	jalr	402(ra) # 800012d2 <release>
          return pid;
    80003148:	fd442783          	lw	a5,-44(s0)
    8000314c:	a09d                	j	800031b2 <wait+0x156>
        }
        release(&np->lock);
    8000314e:	fe843783          	ld	a5,-24(s0)
    80003152:	853e                	mv	a0,a5
    80003154:	ffffe097          	auipc	ra,0xffffe
    80003158:	17e080e7          	jalr	382(ra) # 800012d2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    8000315c:	fe843783          	ld	a5,-24(s0)
    80003160:	16878793          	addi	a5,a5,360
    80003164:	fef43423          	sd	a5,-24(s0)
    80003168:	fe843703          	ld	a4,-24(s0)
    8000316c:	00017797          	auipc	a5,0x17
    80003170:	f2c78793          	addi	a5,a5,-212 # 8001a098 <pid_lock>
    80003174:	f2f761e3          	bltu	a4,a5,80003096 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    80003178:	fe442783          	lw	a5,-28(s0)
    8000317c:	2781                	sext.w	a5,a5
    8000317e:	c789                	beqz	a5,80003188 <wait+0x12c>
    80003180:	fd843783          	ld	a5,-40(s0)
    80003184:	579c                	lw	a5,40(a5)
    80003186:	cb99                	beqz	a5,8000319c <wait+0x140>
      release(&wait_lock);
    80003188:	00017517          	auipc	a0,0x17
    8000318c:	f2850513          	addi	a0,a0,-216 # 8001a0b0 <wait_lock>
    80003190:	ffffe097          	auipc	ra,0xffffe
    80003194:	142080e7          	jalr	322(ra) # 800012d2 <release>
      return -1;
    80003198:	57fd                	li	a5,-1
    8000319a:	a821                	j	800031b2 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    8000319c:	00017597          	auipc	a1,0x17
    800031a0:	f1458593          	addi	a1,a1,-236 # 8001a0b0 <wait_lock>
    800031a4:	fd843503          	ld	a0,-40(s0)
    800031a8:	00000097          	auipc	ra,0x0
    800031ac:	2b0080e7          	jalr	688(ra) # 80003458 <sleep>
    havekids = 0;
    800031b0:	bdd1                	j	80003084 <wait+0x28>
  }
}
    800031b2:	853e                	mv	a0,a5
    800031b4:	70e2                	ld	ra,56(sp)
    800031b6:	7442                	ld	s0,48(sp)
    800031b8:	6121                	addi	sp,sp,64
    800031ba:	8082                	ret

00000000800031bc <get>:
//
//    return 0;
//}
struct proc*
get(void)
{
    800031bc:	1101                	addi	sp,sp,-32
    800031be:	ec06                	sd	ra,24(sp)
    800031c0:	e822                	sd	s0,16(sp)
    800031c2:	1000                	addi	s0,sp,32
    struct proc* p;
    for(p = proc; p < &proc[NPROC]; p++) {
    800031c4:	00011797          	auipc	a5,0x11
    800031c8:	4d478793          	addi	a5,a5,1236 # 80014698 <proc>
    800031cc:	fef43423          	sd	a5,-24(s0)
    800031d0:	a099                	j	80003216 <get+0x5a>
        acquire(&p->lock);
    800031d2:	fe843783          	ld	a5,-24(s0)
    800031d6:	853e                	mv	a0,a5
    800031d8:	ffffe097          	auipc	ra,0xffffe
    800031dc:	096080e7          	jalr	150(ra) # 8000126e <acquire>
        if (p->state == RUNNABLE) {
    800031e0:	fe843783          	ld	a5,-24(s0)
    800031e4:	4f9c                	lw	a5,24(a5)
    800031e6:	873e                	mv	a4,a5
    800031e8:	478d                	li	a5,3
    800031ea:	00f71963          	bne	a4,a5,800031fc <get+0x40>
            p->state = RUNNING;
    800031ee:	fe843783          	ld	a5,-24(s0)
    800031f2:	4711                	li	a4,4
    800031f4:	cf98                	sw	a4,24(a5)
            return p;
    800031f6:	fe843783          	ld	a5,-24(s0)
    800031fa:	a03d                	j	80003228 <get+0x6c>
        }
        release(&p->lock);
    800031fc:	fe843783          	ld	a5,-24(s0)
    80003200:	853e                	mv	a0,a5
    80003202:	ffffe097          	auipc	ra,0xffffe
    80003206:	0d0080e7          	jalr	208(ra) # 800012d2 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8000320a:	fe843783          	ld	a5,-24(s0)
    8000320e:	16878793          	addi	a5,a5,360
    80003212:	fef43423          	sd	a5,-24(s0)
    80003216:	fe843703          	ld	a4,-24(s0)
    8000321a:	00017797          	auipc	a5,0x17
    8000321e:	e7e78793          	addi	a5,a5,-386 # 8001a098 <pid_lock>
    80003222:	faf768e3          	bltu	a4,a5,800031d2 <get+0x16>
    }
    return 0;
    80003226:	4781                	li	a5,0
}
    80003228:	853e                	mv	a0,a5
    8000322a:	60e2                	ld	ra,24(sp)
    8000322c:	6442                	ld	s0,16(sp)
    8000322e:	6105                	addi	sp,sp,32
    80003230:	8082                	ret

0000000080003232 <put>:

void
put(struct proc* p)
{
    80003232:	1101                	addi	sp,sp,-32
    80003234:	ec22                	sd	s0,24(sp)
    80003236:	1000                	addi	s0,sp,32
    80003238:	fea43423          	sd	a0,-24(s0)
    p->state = RUNNABLE;
    8000323c:	fe843783          	ld	a5,-24(s0)
    80003240:	470d                	li	a4,3
    80003242:	cf98                	sw	a4,24(a5)
}
    80003244:	0001                	nop
    80003246:	6462                	ld	s0,24(sp)
    80003248:	6105                	addi	sp,sp,32
    8000324a:	8082                	ret

000000008000324c <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000324c:	1101                	addi	sp,sp,-32
    8000324e:	ec06                	sd	ra,24(sp)
    80003250:	e822                	sd	s0,16(sp)
    80003252:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003254:	fffff097          	auipc	ra,0xfffff
    80003258:	586080e7          	jalr	1414(ra) # 800027da <mycpu>
    8000325c:	fea43423          	sd	a0,-24(s0)
  
  c->proc = 0;
    80003260:	fe843783          	ld	a5,-24(s0)
    80003264:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003268:	fffff097          	auipc	ra,0xfffff
    8000326c:	35c080e7          	jalr	860(ra) # 800025c4 <intr_on>
    p=get();
    80003270:	00000097          	auipc	ra,0x0
    80003274:	f4c080e7          	jalr	-180(ra) # 800031bc <get>
    80003278:	fea43023          	sd	a0,-32(s0)
    if(p)
    8000327c:	fe043783          	ld	a5,-32(s0)
    80003280:	d7e5                	beqz	a5,80003268 <scheduler+0x1c>
    {
        printf(p->name);
    80003282:	fe043783          	ld	a5,-32(s0)
    80003286:	15878793          	addi	a5,a5,344
    8000328a:	853e                	mv	a0,a5
    8000328c:	ffffd097          	auipc	ra,0xffffd
    80003290:	79c080e7          	jalr	1948(ra) # 80000a28 <printf>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.

        c->proc = p;
    80003294:	fe843783          	ld	a5,-24(s0)
    80003298:	fe043703          	ld	a4,-32(s0)
    8000329c:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000329e:	fe843783          	ld	a5,-24(s0)
    800032a2:	00878713          	addi	a4,a5,8
    800032a6:	fe043783          	ld	a5,-32(s0)
    800032aa:	06078793          	addi	a5,a5,96
    800032ae:	85be                	mv	a1,a5
    800032b0:	853a                	mv	a0,a4
    800032b2:	00000097          	auipc	ra,0x0
    800032b6:	528080e7          	jalr	1320(ra) # 800037da <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800032ba:	fe843783          	ld	a5,-24(s0)
    800032be:	0007b023          	sd	zero,0(a5)
        if(&p->lock.locked) release(&p->lock);
    800032c2:	fe043783          	ld	a5,-32(s0)
    800032c6:	d3cd                	beqz	a5,80003268 <scheduler+0x1c>
    800032c8:	fe043783          	ld	a5,-32(s0)
    800032cc:	853e                	mv	a0,a5
    800032ce:	ffffe097          	auipc	ra,0xffffe
    800032d2:	004080e7          	jalr	4(ra) # 800012d2 <release>
    intr_on();
    800032d6:	bf49                	j	80003268 <scheduler+0x1c>

00000000800032d8 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800032d8:	7179                	addi	sp,sp,-48
    800032da:	f406                	sd	ra,40(sp)
    800032dc:	f022                	sd	s0,32(sp)
    800032de:	ec26                	sd	s1,24(sp)
    800032e0:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800032e2:	fffff097          	auipc	ra,0xfffff
    800032e6:	532080e7          	jalr	1330(ra) # 80002814 <myproc>
    800032ea:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800032ee:	fd843783          	ld	a5,-40(s0)
    800032f2:	853e                	mv	a0,a5
    800032f4:	ffffe097          	auipc	ra,0xffffe
    800032f8:	034080e7          	jalr	52(ra) # 80001328 <holding>
    800032fc:	87aa                	mv	a5,a0
    800032fe:	eb89                	bnez	a5,80003310 <sched+0x38>
    panic("sched p->lock");
    80003300:	00008517          	auipc	a0,0x8
    80003304:	f2050513          	addi	a0,a0,-224 # 8000b220 <etext+0x220>
    80003308:	ffffe097          	auipc	ra,0xffffe
    8000330c:	976080e7          	jalr	-1674(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    80003310:	fffff097          	auipc	ra,0xfffff
    80003314:	4ca080e7          	jalr	1226(ra) # 800027da <mycpu>
    80003318:	87aa                	mv	a5,a0
    8000331a:	5fbc                	lw	a5,120(a5)
    8000331c:	873e                	mv	a4,a5
    8000331e:	4785                	li	a5,1
    80003320:	00f70a63          	beq	a4,a5,80003334 <sched+0x5c>
    panic("sched locks");
    80003324:	00008517          	auipc	a0,0x8
    80003328:	f0c50513          	addi	a0,a0,-244 # 8000b230 <etext+0x230>
    8000332c:	ffffe097          	auipc	ra,0xffffe
    80003330:	952080e7          	jalr	-1710(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    80003334:	fd843783          	ld	a5,-40(s0)
    80003338:	4f9c                	lw	a5,24(a5)
    8000333a:	873e                	mv	a4,a5
    8000333c:	4791                	li	a5,4
    8000333e:	00f71a63          	bne	a4,a5,80003352 <sched+0x7a>
    panic("sched running");
    80003342:	00008517          	auipc	a0,0x8
    80003346:	efe50513          	addi	a0,a0,-258 # 8000b240 <etext+0x240>
    8000334a:	ffffe097          	auipc	ra,0xffffe
    8000334e:	934080e7          	jalr	-1740(ra) # 80000c7e <panic>
  if(intr_get())
    80003352:	fffff097          	auipc	ra,0xfffff
    80003356:	29c080e7          	jalr	668(ra) # 800025ee <intr_get>
    8000335a:	87aa                	mv	a5,a0
    8000335c:	cb89                	beqz	a5,8000336e <sched+0x96>
    panic("sched interruptible");
    8000335e:	00008517          	auipc	a0,0x8
    80003362:	ef250513          	addi	a0,a0,-270 # 8000b250 <etext+0x250>
    80003366:	ffffe097          	auipc	ra,0xffffe
    8000336a:	918080e7          	jalr	-1768(ra) # 80000c7e <panic>

  intena = mycpu()->intena;
    8000336e:	fffff097          	auipc	ra,0xfffff
    80003372:	46c080e7          	jalr	1132(ra) # 800027da <mycpu>
    80003376:	87aa                	mv	a5,a0
    80003378:	5ffc                	lw	a5,124(a5)
    8000337a:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    8000337e:	fd843783          	ld	a5,-40(s0)
    80003382:	06078493          	addi	s1,a5,96
    80003386:	fffff097          	auipc	ra,0xfffff
    8000338a:	454080e7          	jalr	1108(ra) # 800027da <mycpu>
    8000338e:	87aa                	mv	a5,a0
    80003390:	07a1                	addi	a5,a5,8
    80003392:	85be                	mv	a1,a5
    80003394:	8526                	mv	a0,s1
    80003396:	00000097          	auipc	ra,0x0
    8000339a:	444080e7          	jalr	1092(ra) # 800037da <swtch>
  mycpu()->intena = intena;
    8000339e:	fffff097          	auipc	ra,0xfffff
    800033a2:	43c080e7          	jalr	1084(ra) # 800027da <mycpu>
    800033a6:	872a                	mv	a4,a0
    800033a8:	fd442783          	lw	a5,-44(s0)
    800033ac:	df7c                	sw	a5,124(a4)
}
    800033ae:	0001                	nop
    800033b0:	70a2                	ld	ra,40(sp)
    800033b2:	7402                	ld	s0,32(sp)
    800033b4:	64e2                	ld	s1,24(sp)
    800033b6:	6145                	addi	sp,sp,48
    800033b8:	8082                	ret

00000000800033ba <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800033ba:	1101                	addi	sp,sp,-32
    800033bc:	ec06                	sd	ra,24(sp)
    800033be:	e822                	sd	s0,16(sp)
    800033c0:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800033c2:	fffff097          	auipc	ra,0xfffff
    800033c6:	452080e7          	jalr	1106(ra) # 80002814 <myproc>
    800033ca:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800033ce:	fe843783          	ld	a5,-24(s0)
    800033d2:	853e                	mv	a0,a5
    800033d4:	ffffe097          	auipc	ra,0xffffe
    800033d8:	e9a080e7          	jalr	-358(ra) # 8000126e <acquire>
  put(p);
    800033dc:	fe843503          	ld	a0,-24(s0)
    800033e0:	00000097          	auipc	ra,0x0
    800033e4:	e52080e7          	jalr	-430(ra) # 80003232 <put>
  sched();
    800033e8:	00000097          	auipc	ra,0x0
    800033ec:	ef0080e7          	jalr	-272(ra) # 800032d8 <sched>
  release(&p->lock);
    800033f0:	fe843783          	ld	a5,-24(s0)
    800033f4:	853e                	mv	a0,a5
    800033f6:	ffffe097          	auipc	ra,0xffffe
    800033fa:	edc080e7          	jalr	-292(ra) # 800012d2 <release>
}
    800033fe:	0001                	nop
    80003400:	60e2                	ld	ra,24(sp)
    80003402:	6442                	ld	s0,16(sp)
    80003404:	6105                	addi	sp,sp,32
    80003406:	8082                	ret

0000000080003408 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003408:	1141                	addi	sp,sp,-16
    8000340a:	e406                	sd	ra,8(sp)
    8000340c:	e022                	sd	s0,0(sp)
    8000340e:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003410:	fffff097          	auipc	ra,0xfffff
    80003414:	404080e7          	jalr	1028(ra) # 80002814 <myproc>
    80003418:	87aa                	mv	a5,a0
    8000341a:	853e                	mv	a0,a5
    8000341c:	ffffe097          	auipc	ra,0xffffe
    80003420:	eb6080e7          	jalr	-330(ra) # 800012d2 <release>

  if (first) {
    80003424:	00008797          	auipc	a5,0x8
    80003428:	31078793          	addi	a5,a5,784 # 8000b734 <first.1683>
    8000342c:	439c                	lw	a5,0(a5)
    8000342e:	cf81                	beqz	a5,80003446 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003430:	00008797          	auipc	a5,0x8
    80003434:	30478793          	addi	a5,a5,772 # 8000b734 <first.1683>
    80003438:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000343c:	4505                	li	a0,1
    8000343e:	00001097          	auipc	ra,0x1
    80003442:	4a0080e7          	jalr	1184(ra) # 800048de <fsinit>
  }

  usertrapret();
    80003446:	00000097          	auipc	ra,0x0
    8000344a:	732080e7          	jalr	1842(ra) # 80003b78 <usertrapret>
}
    8000344e:	0001                	nop
    80003450:	60a2                	ld	ra,8(sp)
    80003452:	6402                	ld	s0,0(sp)
    80003454:	0141                	addi	sp,sp,16
    80003456:	8082                	ret

0000000080003458 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003458:	7179                	addi	sp,sp,-48
    8000345a:	f406                	sd	ra,40(sp)
    8000345c:	f022                	sd	s0,32(sp)
    8000345e:	1800                	addi	s0,sp,48
    80003460:	fca43c23          	sd	a0,-40(s0)
    80003464:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	3ac080e7          	jalr	940(ra) # 80002814 <myproc>
    80003470:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003474:	fe843783          	ld	a5,-24(s0)
    80003478:	853e                	mv	a0,a5
    8000347a:	ffffe097          	auipc	ra,0xffffe
    8000347e:	df4080e7          	jalr	-524(ra) # 8000126e <acquire>
  release(lk);
    80003482:	fd043503          	ld	a0,-48(s0)
    80003486:	ffffe097          	auipc	ra,0xffffe
    8000348a:	e4c080e7          	jalr	-436(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    8000348e:	fe843783          	ld	a5,-24(s0)
    80003492:	fd843703          	ld	a4,-40(s0)
    80003496:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003498:	fe843783          	ld	a5,-24(s0)
    8000349c:	4709                	li	a4,2
    8000349e:	cf98                	sw	a4,24(a5)

  sched();
    800034a0:	00000097          	auipc	ra,0x0
    800034a4:	e38080e7          	jalr	-456(ra) # 800032d8 <sched>

  // Tidy up.
  p->chan = 0;
    800034a8:	fe843783          	ld	a5,-24(s0)
    800034ac:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800034b0:	fe843783          	ld	a5,-24(s0)
    800034b4:	853e                	mv	a0,a5
    800034b6:	ffffe097          	auipc	ra,0xffffe
    800034ba:	e1c080e7          	jalr	-484(ra) # 800012d2 <release>
  acquire(lk);
    800034be:	fd043503          	ld	a0,-48(s0)
    800034c2:	ffffe097          	auipc	ra,0xffffe
    800034c6:	dac080e7          	jalr	-596(ra) # 8000126e <acquire>
}
    800034ca:	0001                	nop
    800034cc:	70a2                	ld	ra,40(sp)
    800034ce:	7402                	ld	s0,32(sp)
    800034d0:	6145                	addi	sp,sp,48
    800034d2:	8082                	ret

00000000800034d4 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800034d4:	7179                	addi	sp,sp,-48
    800034d6:	f406                	sd	ra,40(sp)
    800034d8:	f022                	sd	s0,32(sp)
    800034da:	1800                	addi	s0,sp,48
    800034dc:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800034e0:	00011797          	auipc	a5,0x11
    800034e4:	1b878793          	addi	a5,a5,440 # 80014698 <proc>
    800034e8:	fef43423          	sd	a5,-24(s0)
    800034ec:	a095                	j	80003550 <wakeup+0x7c>
    if(p != myproc()){
    800034ee:	fffff097          	auipc	ra,0xfffff
    800034f2:	326080e7          	jalr	806(ra) # 80002814 <myproc>
    800034f6:	872a                	mv	a4,a0
    800034f8:	fe843783          	ld	a5,-24(s0)
    800034fc:	04e78463          	beq	a5,a4,80003544 <wakeup+0x70>
      acquire(&p->lock);
    80003500:	fe843783          	ld	a5,-24(s0)
    80003504:	853e                	mv	a0,a5
    80003506:	ffffe097          	auipc	ra,0xffffe
    8000350a:	d68080e7          	jalr	-664(ra) # 8000126e <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    8000350e:	fe843783          	ld	a5,-24(s0)
    80003512:	4f9c                	lw	a5,24(a5)
    80003514:	873e                	mv	a4,a5
    80003516:	4789                	li	a5,2
    80003518:	00f71f63          	bne	a4,a5,80003536 <wakeup+0x62>
    8000351c:	fe843783          	ld	a5,-24(s0)
    80003520:	739c                	ld	a5,32(a5)
    80003522:	fd843703          	ld	a4,-40(s0)
    80003526:	00f71863          	bne	a4,a5,80003536 <wakeup+0x62>
          put(p);
    8000352a:	fe843503          	ld	a0,-24(s0)
    8000352e:	00000097          	auipc	ra,0x0
    80003532:	d04080e7          	jalr	-764(ra) # 80003232 <put>
      }
      release(&p->lock);
    80003536:	fe843783          	ld	a5,-24(s0)
    8000353a:	853e                	mv	a0,a5
    8000353c:	ffffe097          	auipc	ra,0xffffe
    80003540:	d96080e7          	jalr	-618(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003544:	fe843783          	ld	a5,-24(s0)
    80003548:	16878793          	addi	a5,a5,360
    8000354c:	fef43423          	sd	a5,-24(s0)
    80003550:	fe843703          	ld	a4,-24(s0)
    80003554:	00017797          	auipc	a5,0x17
    80003558:	b4478793          	addi	a5,a5,-1212 # 8001a098 <pid_lock>
    8000355c:	f8f769e3          	bltu	a4,a5,800034ee <wakeup+0x1a>
    }
  }
}
    80003560:	0001                	nop
    80003562:	0001                	nop
    80003564:	70a2                	ld	ra,40(sp)
    80003566:	7402                	ld	s0,32(sp)
    80003568:	6145                	addi	sp,sp,48
    8000356a:	8082                	ret

000000008000356c <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8000356c:	7179                	addi	sp,sp,-48
    8000356e:	f406                	sd	ra,40(sp)
    80003570:	f022                	sd	s0,32(sp)
    80003572:	1800                	addi	s0,sp,48
    80003574:	87aa                	mv	a5,a0
    80003576:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8000357a:	00011797          	auipc	a5,0x11
    8000357e:	11e78793          	addi	a5,a5,286 # 80014698 <proc>
    80003582:	fef43423          	sd	a5,-24(s0)
    80003586:	a0bd                	j	800035f4 <kill+0x88>
    acquire(&p->lock);
    80003588:	fe843783          	ld	a5,-24(s0)
    8000358c:	853e                	mv	a0,a5
    8000358e:	ffffe097          	auipc	ra,0xffffe
    80003592:	ce0080e7          	jalr	-800(ra) # 8000126e <acquire>
    if(p->pid == pid){
    80003596:	fe843783          	ld	a5,-24(s0)
    8000359a:	5b98                	lw	a4,48(a5)
    8000359c:	fdc42783          	lw	a5,-36(s0)
    800035a0:	2781                	sext.w	a5,a5
    800035a2:	02e79c63          	bne	a5,a4,800035da <kill+0x6e>
      p->killed = 1;
    800035a6:	fe843783          	ld	a5,-24(s0)
    800035aa:	4705                	li	a4,1
    800035ac:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800035ae:	fe843783          	ld	a5,-24(s0)
    800035b2:	4f9c                	lw	a5,24(a5)
    800035b4:	873e                	mv	a4,a5
    800035b6:	4789                	li	a5,2
    800035b8:	00f71863          	bne	a4,a5,800035c8 <kill+0x5c>
        // Wake process from sleep().
        put(p);
    800035bc:	fe843503          	ld	a0,-24(s0)
    800035c0:	00000097          	auipc	ra,0x0
    800035c4:	c72080e7          	jalr	-910(ra) # 80003232 <put>
      }
      release(&p->lock);
    800035c8:	fe843783          	ld	a5,-24(s0)
    800035cc:	853e                	mv	a0,a5
    800035ce:	ffffe097          	auipc	ra,0xffffe
    800035d2:	d04080e7          	jalr	-764(ra) # 800012d2 <release>
      return 0;
    800035d6:	4781                	li	a5,0
    800035d8:	a03d                	j	80003606 <kill+0x9a>
    }
    release(&p->lock);
    800035da:	fe843783          	ld	a5,-24(s0)
    800035de:	853e                	mv	a0,a5
    800035e0:	ffffe097          	auipc	ra,0xffffe
    800035e4:	cf2080e7          	jalr	-782(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    800035e8:	fe843783          	ld	a5,-24(s0)
    800035ec:	16878793          	addi	a5,a5,360
    800035f0:	fef43423          	sd	a5,-24(s0)
    800035f4:	fe843703          	ld	a4,-24(s0)
    800035f8:	00017797          	auipc	a5,0x17
    800035fc:	aa078793          	addi	a5,a5,-1376 # 8001a098 <pid_lock>
    80003600:	f8f764e3          	bltu	a4,a5,80003588 <kill+0x1c>
  }
  return -1;
    80003604:	57fd                	li	a5,-1
}
    80003606:	853e                	mv	a0,a5
    80003608:	70a2                	ld	ra,40(sp)
    8000360a:	7402                	ld	s0,32(sp)
    8000360c:	6145                	addi	sp,sp,48
    8000360e:	8082                	ret

0000000080003610 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003610:	7139                	addi	sp,sp,-64
    80003612:	fc06                	sd	ra,56(sp)
    80003614:	f822                	sd	s0,48(sp)
    80003616:	0080                	addi	s0,sp,64
    80003618:	87aa                	mv	a5,a0
    8000361a:	fcb43823          	sd	a1,-48(s0)
    8000361e:	fcc43423          	sd	a2,-56(s0)
    80003622:	fcd43023          	sd	a3,-64(s0)
    80003626:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000362a:	fffff097          	auipc	ra,0xfffff
    8000362e:	1ea080e7          	jalr	490(ra) # 80002814 <myproc>
    80003632:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003636:	fdc42783          	lw	a5,-36(s0)
    8000363a:	2781                	sext.w	a5,a5
    8000363c:	c38d                	beqz	a5,8000365e <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    8000363e:	fe843783          	ld	a5,-24(s0)
    80003642:	6bbc                	ld	a5,80(a5)
    80003644:	fc043683          	ld	a3,-64(s0)
    80003648:	fc843603          	ld	a2,-56(s0)
    8000364c:	fd043583          	ld	a1,-48(s0)
    80003650:	853e                	mv	a0,a5
    80003652:	fffff097          	auipc	ra,0xfffff
    80003656:	c94080e7          	jalr	-876(ra) # 800022e6 <copyout>
    8000365a:	87aa                	mv	a5,a0
    8000365c:	a839                	j	8000367a <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    8000365e:	fd043783          	ld	a5,-48(s0)
    80003662:	fc043703          	ld	a4,-64(s0)
    80003666:	2701                	sext.w	a4,a4
    80003668:	863a                	mv	a2,a4
    8000366a:	fc843583          	ld	a1,-56(s0)
    8000366e:	853e                	mv	a0,a5
    80003670:	ffffe097          	auipc	ra,0xffffe
    80003674:	eb6080e7          	jalr	-330(ra) # 80001526 <memmove>
    return 0;
    80003678:	4781                	li	a5,0
  }
}
    8000367a:	853e                	mv	a0,a5
    8000367c:	70e2                	ld	ra,56(sp)
    8000367e:	7442                	ld	s0,48(sp)
    80003680:	6121                	addi	sp,sp,64
    80003682:	8082                	ret

0000000080003684 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003684:	7139                	addi	sp,sp,-64
    80003686:	fc06                	sd	ra,56(sp)
    80003688:	f822                	sd	s0,48(sp)
    8000368a:	0080                	addi	s0,sp,64
    8000368c:	fca43c23          	sd	a0,-40(s0)
    80003690:	87ae                	mv	a5,a1
    80003692:	fcc43423          	sd	a2,-56(s0)
    80003696:	fcd43023          	sd	a3,-64(s0)
    8000369a:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    8000369e:	fffff097          	auipc	ra,0xfffff
    800036a2:	176080e7          	jalr	374(ra) # 80002814 <myproc>
    800036a6:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800036aa:	fd442783          	lw	a5,-44(s0)
    800036ae:	2781                	sext.w	a5,a5
    800036b0:	c38d                	beqz	a5,800036d2 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800036b2:	fe843783          	ld	a5,-24(s0)
    800036b6:	6bbc                	ld	a5,80(a5)
    800036b8:	fc043683          	ld	a3,-64(s0)
    800036bc:	fc843603          	ld	a2,-56(s0)
    800036c0:	fd843583          	ld	a1,-40(s0)
    800036c4:	853e                	mv	a0,a5
    800036c6:	fffff097          	auipc	ra,0xfffff
    800036ca:	cee080e7          	jalr	-786(ra) # 800023b4 <copyin>
    800036ce:	87aa                	mv	a5,a0
    800036d0:	a839                	j	800036ee <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800036d2:	fc843783          	ld	a5,-56(s0)
    800036d6:	fc043703          	ld	a4,-64(s0)
    800036da:	2701                	sext.w	a4,a4
    800036dc:	863a                	mv	a2,a4
    800036de:	85be                	mv	a1,a5
    800036e0:	fd843503          	ld	a0,-40(s0)
    800036e4:	ffffe097          	auipc	ra,0xffffe
    800036e8:	e42080e7          	jalr	-446(ra) # 80001526 <memmove>
    return 0;
    800036ec:	4781                	li	a5,0
  }
}
    800036ee:	853e                	mv	a0,a5
    800036f0:	70e2                	ld	ra,56(sp)
    800036f2:	7442                	ld	s0,48(sp)
    800036f4:	6121                	addi	sp,sp,64
    800036f6:	8082                	ret

00000000800036f8 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    800036f8:	1101                	addi	sp,sp,-32
    800036fa:	ec06                	sd	ra,24(sp)
    800036fc:	e822                	sd	s0,16(sp)
    800036fe:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003700:	00008517          	auipc	a0,0x8
    80003704:	b6850513          	addi	a0,a0,-1176 # 8000b268 <etext+0x268>
    80003708:	ffffd097          	auipc	ra,0xffffd
    8000370c:	320080e7          	jalr	800(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003710:	00011797          	auipc	a5,0x11
    80003714:	f8878793          	addi	a5,a5,-120 # 80014698 <proc>
    80003718:	fef43423          	sd	a5,-24(s0)
    8000371c:	a04d                	j	800037be <procdump+0xc6>
    if(p->state == UNUSED)
    8000371e:	fe843783          	ld	a5,-24(s0)
    80003722:	4f9c                	lw	a5,24(a5)
    80003724:	c7d1                	beqz	a5,800037b0 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003726:	fe843783          	ld	a5,-24(s0)
    8000372a:	4f9c                	lw	a5,24(a5)
    8000372c:	873e                	mv	a4,a5
    8000372e:	4795                	li	a5,5
    80003730:	02e7ee63          	bltu	a5,a4,8000376c <procdump+0x74>
    80003734:	fe843783          	ld	a5,-24(s0)
    80003738:	4f9c                	lw	a5,24(a5)
    8000373a:	00008717          	auipc	a4,0x8
    8000373e:	05670713          	addi	a4,a4,86 # 8000b790 <states.1720>
    80003742:	1782                	slli	a5,a5,0x20
    80003744:	9381                	srli	a5,a5,0x20
    80003746:	078e                	slli	a5,a5,0x3
    80003748:	97ba                	add	a5,a5,a4
    8000374a:	639c                	ld	a5,0(a5)
    8000374c:	c385                	beqz	a5,8000376c <procdump+0x74>
      state = states[p->state];
    8000374e:	fe843783          	ld	a5,-24(s0)
    80003752:	4f9c                	lw	a5,24(a5)
    80003754:	00008717          	auipc	a4,0x8
    80003758:	03c70713          	addi	a4,a4,60 # 8000b790 <states.1720>
    8000375c:	1782                	slli	a5,a5,0x20
    8000375e:	9381                	srli	a5,a5,0x20
    80003760:	078e                	slli	a5,a5,0x3
    80003762:	97ba                	add	a5,a5,a4
    80003764:	639c                	ld	a5,0(a5)
    80003766:	fef43023          	sd	a5,-32(s0)
    8000376a:	a039                	j	80003778 <procdump+0x80>
    else
      state = "???";
    8000376c:	00008797          	auipc	a5,0x8
    80003770:	b0478793          	addi	a5,a5,-1276 # 8000b270 <etext+0x270>
    80003774:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003778:	fe843783          	ld	a5,-24(s0)
    8000377c:	5b98                	lw	a4,48(a5)
    8000377e:	fe843783          	ld	a5,-24(s0)
    80003782:	15878793          	addi	a5,a5,344
    80003786:	86be                	mv	a3,a5
    80003788:	fe043603          	ld	a2,-32(s0)
    8000378c:	85ba                	mv	a1,a4
    8000378e:	00008517          	auipc	a0,0x8
    80003792:	aea50513          	addi	a0,a0,-1302 # 8000b278 <etext+0x278>
    80003796:	ffffd097          	auipc	ra,0xffffd
    8000379a:	292080e7          	jalr	658(ra) # 80000a28 <printf>
    printf("\n");
    8000379e:	00008517          	auipc	a0,0x8
    800037a2:	aca50513          	addi	a0,a0,-1334 # 8000b268 <etext+0x268>
    800037a6:	ffffd097          	auipc	ra,0xffffd
    800037aa:	282080e7          	jalr	642(ra) # 80000a28 <printf>
    800037ae:	a011                	j	800037b2 <procdump+0xba>
      continue;
    800037b0:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800037b2:	fe843783          	ld	a5,-24(s0)
    800037b6:	16878793          	addi	a5,a5,360
    800037ba:	fef43423          	sd	a5,-24(s0)
    800037be:	fe843703          	ld	a4,-24(s0)
    800037c2:	00017797          	auipc	a5,0x17
    800037c6:	8d678793          	addi	a5,a5,-1834 # 8001a098 <pid_lock>
    800037ca:	f4f76ae3          	bltu	a4,a5,8000371e <procdump+0x26>
  }
}
    800037ce:	0001                	nop
    800037d0:	0001                	nop
    800037d2:	60e2                	ld	ra,24(sp)
    800037d4:	6442                	ld	s0,16(sp)
    800037d6:	6105                	addi	sp,sp,32
    800037d8:	8082                	ret

00000000800037da <swtch>:
    800037da:	00153023          	sd	ra,0(a0)
    800037de:	00253423          	sd	sp,8(a0)
    800037e2:	e900                	sd	s0,16(a0)
    800037e4:	ed04                	sd	s1,24(a0)
    800037e6:	03253023          	sd	s2,32(a0)
    800037ea:	03353423          	sd	s3,40(a0)
    800037ee:	03453823          	sd	s4,48(a0)
    800037f2:	03553c23          	sd	s5,56(a0)
    800037f6:	05653023          	sd	s6,64(a0)
    800037fa:	05753423          	sd	s7,72(a0)
    800037fe:	05853823          	sd	s8,80(a0)
    80003802:	05953c23          	sd	s9,88(a0)
    80003806:	07a53023          	sd	s10,96(a0)
    8000380a:	07b53423          	sd	s11,104(a0)
    8000380e:	0005b083          	ld	ra,0(a1)
    80003812:	0085b103          	ld	sp,8(a1)
    80003816:	6980                	ld	s0,16(a1)
    80003818:	6d84                	ld	s1,24(a1)
    8000381a:	0205b903          	ld	s2,32(a1)
    8000381e:	0285b983          	ld	s3,40(a1)
    80003822:	0305ba03          	ld	s4,48(a1)
    80003826:	0385ba83          	ld	s5,56(a1)
    8000382a:	0405bb03          	ld	s6,64(a1)
    8000382e:	0485bb83          	ld	s7,72(a1)
    80003832:	0505bc03          	ld	s8,80(a1)
    80003836:	0585bc83          	ld	s9,88(a1)
    8000383a:	0605bd03          	ld	s10,96(a1)
    8000383e:	0685bd83          	ld	s11,104(a1)
    80003842:	8082                	ret

0000000080003844 <r_sstatus>:
{
    80003844:	1101                	addi	sp,sp,-32
    80003846:	ec22                	sd	s0,24(sp)
    80003848:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000384a:	100027f3          	csrr	a5,sstatus
    8000384e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003852:	fe843783          	ld	a5,-24(s0)
}
    80003856:	853e                	mv	a0,a5
    80003858:	6462                	ld	s0,24(sp)
    8000385a:	6105                	addi	sp,sp,32
    8000385c:	8082                	ret

000000008000385e <w_sstatus>:
{
    8000385e:	1101                	addi	sp,sp,-32
    80003860:	ec22                	sd	s0,24(sp)
    80003862:	1000                	addi	s0,sp,32
    80003864:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003868:	fe843783          	ld	a5,-24(s0)
    8000386c:	10079073          	csrw	sstatus,a5
}
    80003870:	0001                	nop
    80003872:	6462                	ld	s0,24(sp)
    80003874:	6105                	addi	sp,sp,32
    80003876:	8082                	ret

0000000080003878 <r_sip>:
{
    80003878:	1101                	addi	sp,sp,-32
    8000387a:	ec22                	sd	s0,24(sp)
    8000387c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    8000387e:	144027f3          	csrr	a5,sip
    80003882:	fef43423          	sd	a5,-24(s0)
  return x;
    80003886:	fe843783          	ld	a5,-24(s0)
}
    8000388a:	853e                	mv	a0,a5
    8000388c:	6462                	ld	s0,24(sp)
    8000388e:	6105                	addi	sp,sp,32
    80003890:	8082                	ret

0000000080003892 <w_sip>:
{
    80003892:	1101                	addi	sp,sp,-32
    80003894:	ec22                	sd	s0,24(sp)
    80003896:	1000                	addi	s0,sp,32
    80003898:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    8000389c:	fe843783          	ld	a5,-24(s0)
    800038a0:	14479073          	csrw	sip,a5
}
    800038a4:	0001                	nop
    800038a6:	6462                	ld	s0,24(sp)
    800038a8:	6105                	addi	sp,sp,32
    800038aa:	8082                	ret

00000000800038ac <w_sepc>:
{
    800038ac:	1101                	addi	sp,sp,-32
    800038ae:	ec22                	sd	s0,24(sp)
    800038b0:	1000                	addi	s0,sp,32
    800038b2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    800038b6:	fe843783          	ld	a5,-24(s0)
    800038ba:	14179073          	csrw	sepc,a5
}
    800038be:	0001                	nop
    800038c0:	6462                	ld	s0,24(sp)
    800038c2:	6105                	addi	sp,sp,32
    800038c4:	8082                	ret

00000000800038c6 <r_sepc>:
{
    800038c6:	1101                	addi	sp,sp,-32
    800038c8:	ec22                	sd	s0,24(sp)
    800038ca:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    800038cc:	141027f3          	csrr	a5,sepc
    800038d0:	fef43423          	sd	a5,-24(s0)
  return x;
    800038d4:	fe843783          	ld	a5,-24(s0)
}
    800038d8:	853e                	mv	a0,a5
    800038da:	6462                	ld	s0,24(sp)
    800038dc:	6105                	addi	sp,sp,32
    800038de:	8082                	ret

00000000800038e0 <w_stvec>:
{
    800038e0:	1101                	addi	sp,sp,-32
    800038e2:	ec22                	sd	s0,24(sp)
    800038e4:	1000                	addi	s0,sp,32
    800038e6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    800038ea:	fe843783          	ld	a5,-24(s0)
    800038ee:	10579073          	csrw	stvec,a5
}
    800038f2:	0001                	nop
    800038f4:	6462                	ld	s0,24(sp)
    800038f6:	6105                	addi	sp,sp,32
    800038f8:	8082                	ret

00000000800038fa <r_satp>:
{
    800038fa:	1101                	addi	sp,sp,-32
    800038fc:	ec22                	sd	s0,24(sp)
    800038fe:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003900:	180027f3          	csrr	a5,satp
    80003904:	fef43423          	sd	a5,-24(s0)
  return x;
    80003908:	fe843783          	ld	a5,-24(s0)
}
    8000390c:	853e                	mv	a0,a5
    8000390e:	6462                	ld	s0,24(sp)
    80003910:	6105                	addi	sp,sp,32
    80003912:	8082                	ret

0000000080003914 <r_scause>:
{
    80003914:	1101                	addi	sp,sp,-32
    80003916:	ec22                	sd	s0,24(sp)
    80003918:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    8000391a:	142027f3          	csrr	a5,scause
    8000391e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003922:	fe843783          	ld	a5,-24(s0)
}
    80003926:	853e                	mv	a0,a5
    80003928:	6462                	ld	s0,24(sp)
    8000392a:	6105                	addi	sp,sp,32
    8000392c:	8082                	ret

000000008000392e <r_stval>:
{
    8000392e:	1101                	addi	sp,sp,-32
    80003930:	ec22                	sd	s0,24(sp)
    80003932:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003934:	143027f3          	csrr	a5,stval
    80003938:	fef43423          	sd	a5,-24(s0)
  return x;
    8000393c:	fe843783          	ld	a5,-24(s0)
}
    80003940:	853e                	mv	a0,a5
    80003942:	6462                	ld	s0,24(sp)
    80003944:	6105                	addi	sp,sp,32
    80003946:	8082                	ret

0000000080003948 <intr_on>:
{
    80003948:	1141                	addi	sp,sp,-16
    8000394a:	e406                	sd	ra,8(sp)
    8000394c:	e022                	sd	s0,0(sp)
    8000394e:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003950:	00000097          	auipc	ra,0x0
    80003954:	ef4080e7          	jalr	-268(ra) # 80003844 <r_sstatus>
    80003958:	87aa                	mv	a5,a0
    8000395a:	0027e793          	ori	a5,a5,2
    8000395e:	853e                	mv	a0,a5
    80003960:	00000097          	auipc	ra,0x0
    80003964:	efe080e7          	jalr	-258(ra) # 8000385e <w_sstatus>
}
    80003968:	0001                	nop
    8000396a:	60a2                	ld	ra,8(sp)
    8000396c:	6402                	ld	s0,0(sp)
    8000396e:	0141                	addi	sp,sp,16
    80003970:	8082                	ret

0000000080003972 <intr_off>:
{
    80003972:	1141                	addi	sp,sp,-16
    80003974:	e406                	sd	ra,8(sp)
    80003976:	e022                	sd	s0,0(sp)
    80003978:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8000397a:	00000097          	auipc	ra,0x0
    8000397e:	eca080e7          	jalr	-310(ra) # 80003844 <r_sstatus>
    80003982:	87aa                	mv	a5,a0
    80003984:	9bf5                	andi	a5,a5,-3
    80003986:	853e                	mv	a0,a5
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	ed6080e7          	jalr	-298(ra) # 8000385e <w_sstatus>
}
    80003990:	0001                	nop
    80003992:	60a2                	ld	ra,8(sp)
    80003994:	6402                	ld	s0,0(sp)
    80003996:	0141                	addi	sp,sp,16
    80003998:	8082                	ret

000000008000399a <intr_get>:
{
    8000399a:	1101                	addi	sp,sp,-32
    8000399c:	ec06                	sd	ra,24(sp)
    8000399e:	e822                	sd	s0,16(sp)
    800039a0:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800039a2:	00000097          	auipc	ra,0x0
    800039a6:	ea2080e7          	jalr	-350(ra) # 80003844 <r_sstatus>
    800039aa:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800039ae:	fe843783          	ld	a5,-24(s0)
    800039b2:	8b89                	andi	a5,a5,2
    800039b4:	00f037b3          	snez	a5,a5
    800039b8:	0ff7f793          	andi	a5,a5,255
    800039bc:	2781                	sext.w	a5,a5
}
    800039be:	853e                	mv	a0,a5
    800039c0:	60e2                	ld	ra,24(sp)
    800039c2:	6442                	ld	s0,16(sp)
    800039c4:	6105                	addi	sp,sp,32
    800039c6:	8082                	ret

00000000800039c8 <r_tp>:
{
    800039c8:	1101                	addi	sp,sp,-32
    800039ca:	ec22                	sd	s0,24(sp)
    800039cc:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800039ce:	8792                	mv	a5,tp
    800039d0:	fef43423          	sd	a5,-24(s0)
  return x;
    800039d4:	fe843783          	ld	a5,-24(s0)
}
    800039d8:	853e                	mv	a0,a5
    800039da:	6462                	ld	s0,24(sp)
    800039dc:	6105                	addi	sp,sp,32
    800039de:	8082                	ret

00000000800039e0 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    800039e0:	1141                	addi	sp,sp,-16
    800039e2:	e406                	sd	ra,8(sp)
    800039e4:	e022                	sd	s0,0(sp)
    800039e6:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    800039e8:	00008597          	auipc	a1,0x8
    800039ec:	8d058593          	addi	a1,a1,-1840 # 8000b2b8 <etext+0x2b8>
    800039f0:	00016517          	auipc	a0,0x16
    800039f4:	6d850513          	addi	a0,a0,1752 # 8001a0c8 <tickslock>
    800039f8:	ffffe097          	auipc	ra,0xffffe
    800039fc:	846080e7          	jalr	-1978(ra) # 8000123e <initlock>
}
    80003a00:	0001                	nop
    80003a02:	60a2                	ld	ra,8(sp)
    80003a04:	6402                	ld	s0,0(sp)
    80003a06:	0141                	addi	sp,sp,16
    80003a08:	8082                	ret

0000000080003a0a <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003a0a:	1141                	addi	sp,sp,-16
    80003a0c:	e406                	sd	ra,8(sp)
    80003a0e:	e022                	sd	s0,0(sp)
    80003a10:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003a12:	00005797          	auipc	a5,0x5
    80003a16:	d3e78793          	addi	a5,a5,-706 # 80008750 <kernelvec>
    80003a1a:	853e                	mv	a0,a5
    80003a1c:	00000097          	auipc	ra,0x0
    80003a20:	ec4080e7          	jalr	-316(ra) # 800038e0 <w_stvec>
}
    80003a24:	0001                	nop
    80003a26:	60a2                	ld	ra,8(sp)
    80003a28:	6402                	ld	s0,0(sp)
    80003a2a:	0141                	addi	sp,sp,16
    80003a2c:	8082                	ret

0000000080003a2e <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003a2e:	7179                	addi	sp,sp,-48
    80003a30:	f406                	sd	ra,40(sp)
    80003a32:	f022                	sd	s0,32(sp)
    80003a34:	ec26                	sd	s1,24(sp)
    80003a36:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003a38:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003a3c:	00000097          	auipc	ra,0x0
    80003a40:	e08080e7          	jalr	-504(ra) # 80003844 <r_sstatus>
    80003a44:	87aa                	mv	a5,a0
    80003a46:	1007f793          	andi	a5,a5,256
    80003a4a:	cb89                	beqz	a5,80003a5c <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003a4c:	00008517          	auipc	a0,0x8
    80003a50:	87450513          	addi	a0,a0,-1932 # 8000b2c0 <etext+0x2c0>
    80003a54:	ffffd097          	auipc	ra,0xffffd
    80003a58:	22a080e7          	jalr	554(ra) # 80000c7e <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003a5c:	00005797          	auipc	a5,0x5
    80003a60:	cf478793          	addi	a5,a5,-780 # 80008750 <kernelvec>
    80003a64:	853e                	mv	a0,a5
    80003a66:	00000097          	auipc	ra,0x0
    80003a6a:	e7a080e7          	jalr	-390(ra) # 800038e0 <w_stvec>

  struct proc *p = myproc();
    80003a6e:	fffff097          	auipc	ra,0xfffff
    80003a72:	da6080e7          	jalr	-602(ra) # 80002814 <myproc>
    80003a76:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003a7a:	fd043783          	ld	a5,-48(s0)
    80003a7e:	6fa4                	ld	s1,88(a5)
    80003a80:	00000097          	auipc	ra,0x0
    80003a84:	e46080e7          	jalr	-442(ra) # 800038c6 <r_sepc>
    80003a88:	87aa                	mv	a5,a0
    80003a8a:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003a8c:	00000097          	auipc	ra,0x0
    80003a90:	e88080e7          	jalr	-376(ra) # 80003914 <r_scause>
    80003a94:	872a                	mv	a4,a0
    80003a96:	47a1                	li	a5,8
    80003a98:	02f71d63          	bne	a4,a5,80003ad2 <usertrap+0xa4>
    // system call

    if(p->killed)
    80003a9c:	fd043783          	ld	a5,-48(s0)
    80003aa0:	579c                	lw	a5,40(a5)
    80003aa2:	c791                	beqz	a5,80003aae <usertrap+0x80>
      exit(-1);
    80003aa4:	557d                	li	a0,-1
    80003aa6:	fffff097          	auipc	ra,0xfffff
    80003aaa:	47a080e7          	jalr	1146(ra) # 80002f20 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003aae:	fd043783          	ld	a5,-48(s0)
    80003ab2:	6fbc                	ld	a5,88(a5)
    80003ab4:	6f98                	ld	a4,24(a5)
    80003ab6:	fd043783          	ld	a5,-48(s0)
    80003aba:	6fbc                	ld	a5,88(a5)
    80003abc:	0711                	addi	a4,a4,4
    80003abe:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003ac0:	00000097          	auipc	ra,0x0
    80003ac4:	e88080e7          	jalr	-376(ra) # 80003948 <intr_on>

    syscall();
    80003ac8:	00000097          	auipc	ra,0x0
    80003acc:	67e080e7          	jalr	1662(ra) # 80004146 <syscall>
    80003ad0:	a0b5                	j	80003b3c <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80003ad2:	00000097          	auipc	ra,0x0
    80003ad6:	346080e7          	jalr	838(ra) # 80003e18 <devintr>
    80003ada:	87aa                	mv	a5,a0
    80003adc:	fcf42e23          	sw	a5,-36(s0)
    80003ae0:	fdc42783          	lw	a5,-36(s0)
    80003ae4:	2781                	sext.w	a5,a5
    80003ae6:	ebb9                	bnez	a5,80003b3c <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003ae8:	00000097          	auipc	ra,0x0
    80003aec:	e2c080e7          	jalr	-468(ra) # 80003914 <r_scause>
    80003af0:	872a                	mv	a4,a0
    80003af2:	fd043783          	ld	a5,-48(s0)
    80003af6:	5b9c                	lw	a5,48(a5)
    80003af8:	863e                	mv	a2,a5
    80003afa:	85ba                	mv	a1,a4
    80003afc:	00007517          	auipc	a0,0x7
    80003b00:	7e450513          	addi	a0,a0,2020 # 8000b2e0 <etext+0x2e0>
    80003b04:	ffffd097          	auipc	ra,0xffffd
    80003b08:	f24080e7          	jalr	-220(ra) # 80000a28 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	dba080e7          	jalr	-582(ra) # 800038c6 <r_sepc>
    80003b14:	84aa                	mv	s1,a0
    80003b16:	00000097          	auipc	ra,0x0
    80003b1a:	e18080e7          	jalr	-488(ra) # 8000392e <r_stval>
    80003b1e:	87aa                	mv	a5,a0
    80003b20:	863e                	mv	a2,a5
    80003b22:	85a6                	mv	a1,s1
    80003b24:	00007517          	auipc	a0,0x7
    80003b28:	7ec50513          	addi	a0,a0,2028 # 8000b310 <etext+0x310>
    80003b2c:	ffffd097          	auipc	ra,0xffffd
    80003b30:	efc080e7          	jalr	-260(ra) # 80000a28 <printf>
    p->killed = 1;
    80003b34:	fd043783          	ld	a5,-48(s0)
    80003b38:	4705                	li	a4,1
    80003b3a:	d798                	sw	a4,40(a5)
  }

  if(p->killed)
    80003b3c:	fd043783          	ld	a5,-48(s0)
    80003b40:	579c                	lw	a5,40(a5)
    80003b42:	c791                	beqz	a5,80003b4e <usertrap+0x120>
    exit(-1);
    80003b44:	557d                	li	a0,-1
    80003b46:	fffff097          	auipc	ra,0xfffff
    80003b4a:	3da080e7          	jalr	986(ra) # 80002f20 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003b4e:	fdc42783          	lw	a5,-36(s0)
    80003b52:	0007871b          	sext.w	a4,a5
    80003b56:	4789                	li	a5,2
    80003b58:	00f71663          	bne	a4,a5,80003b64 <usertrap+0x136>
    yield();
    80003b5c:	00000097          	auipc	ra,0x0
    80003b60:	85e080e7          	jalr	-1954(ra) # 800033ba <yield>

  usertrapret();
    80003b64:	00000097          	auipc	ra,0x0
    80003b68:	014080e7          	jalr	20(ra) # 80003b78 <usertrapret>
}
    80003b6c:	0001                	nop
    80003b6e:	70a2                	ld	ra,40(sp)
    80003b70:	7402                	ld	s0,32(sp)
    80003b72:	64e2                	ld	s1,24(sp)
    80003b74:	6145                	addi	sp,sp,48
    80003b76:	8082                	ret

0000000080003b78 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003b78:	7139                	addi	sp,sp,-64
    80003b7a:	fc06                	sd	ra,56(sp)
    80003b7c:	f822                	sd	s0,48(sp)
    80003b7e:	f426                	sd	s1,40(sp)
    80003b80:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80003b82:	fffff097          	auipc	ra,0xfffff
    80003b86:	c92080e7          	jalr	-878(ra) # 80002814 <myproc>
    80003b8a:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003b8e:	00000097          	auipc	ra,0x0
    80003b92:	de4080e7          	jalr	-540(ra) # 80003972 <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003b96:	00006717          	auipc	a4,0x6
    80003b9a:	46a70713          	addi	a4,a4,1130 # 8000a000 <_trampoline>
    80003b9e:	00006797          	auipc	a5,0x6
    80003ba2:	46278793          	addi	a5,a5,1122 # 8000a000 <_trampoline>
    80003ba6:	8f1d                	sub	a4,a4,a5
    80003ba8:	040007b7          	lui	a5,0x4000
    80003bac:	17fd                	addi	a5,a5,-1
    80003bae:	07b2                	slli	a5,a5,0xc
    80003bb0:	97ba                	add	a5,a5,a4
    80003bb2:	853e                	mv	a0,a5
    80003bb4:	00000097          	auipc	ra,0x0
    80003bb8:	d2c080e7          	jalr	-724(ra) # 800038e0 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003bbc:	fd843783          	ld	a5,-40(s0)
    80003bc0:	6fa4                	ld	s1,88(a5)
    80003bc2:	00000097          	auipc	ra,0x0
    80003bc6:	d38080e7          	jalr	-712(ra) # 800038fa <r_satp>
    80003bca:	87aa                	mv	a5,a0
    80003bcc:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003bce:	fd843783          	ld	a5,-40(s0)
    80003bd2:	63b4                	ld	a3,64(a5)
    80003bd4:	fd843783          	ld	a5,-40(s0)
    80003bd8:	6fbc                	ld	a5,88(a5)
    80003bda:	6705                	lui	a4,0x1
    80003bdc:	9736                	add	a4,a4,a3
    80003bde:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003be0:	fd843783          	ld	a5,-40(s0)
    80003be4:	6fbc                	ld	a5,88(a5)
    80003be6:	00000717          	auipc	a4,0x0
    80003bea:	e4870713          	addi	a4,a4,-440 # 80003a2e <usertrap>
    80003bee:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003bf0:	fd843783          	ld	a5,-40(s0)
    80003bf4:	6fa4                	ld	s1,88(a5)
    80003bf6:	00000097          	auipc	ra,0x0
    80003bfa:	dd2080e7          	jalr	-558(ra) # 800039c8 <r_tp>
    80003bfe:	87aa                	mv	a5,a0
    80003c00:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003c02:	00000097          	auipc	ra,0x0
    80003c06:	c42080e7          	jalr	-958(ra) # 80003844 <r_sstatus>
    80003c0a:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003c0e:	fd043783          	ld	a5,-48(s0)
    80003c12:	eff7f793          	andi	a5,a5,-257
    80003c16:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003c1a:	fd043783          	ld	a5,-48(s0)
    80003c1e:	0207e793          	ori	a5,a5,32
    80003c22:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    80003c26:	fd043503          	ld	a0,-48(s0)
    80003c2a:	00000097          	auipc	ra,0x0
    80003c2e:	c34080e7          	jalr	-972(ra) # 8000385e <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003c32:	fd843783          	ld	a5,-40(s0)
    80003c36:	6fbc                	ld	a5,88(a5)
    80003c38:	6f9c                	ld	a5,24(a5)
    80003c3a:	853e                	mv	a0,a5
    80003c3c:	00000097          	auipc	ra,0x0
    80003c40:	c70080e7          	jalr	-912(ra) # 800038ac <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003c44:	fd843783          	ld	a5,-40(s0)
    80003c48:	6bbc                	ld	a5,80(a5)
    80003c4a:	00c7d713          	srli	a4,a5,0xc
    80003c4e:	57fd                	li	a5,-1
    80003c50:	17fe                	slli	a5,a5,0x3f
    80003c52:	8fd9                	or	a5,a5,a4
    80003c54:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80003c58:	00006717          	auipc	a4,0x6
    80003c5c:	43870713          	addi	a4,a4,1080 # 8000a090 <userret>
    80003c60:	00006797          	auipc	a5,0x6
    80003c64:	3a078793          	addi	a5,a5,928 # 8000a000 <_trampoline>
    80003c68:	8f1d                	sub	a4,a4,a5
    80003c6a:	040007b7          	lui	a5,0x4000
    80003c6e:	17fd                	addi	a5,a5,-1
    80003c70:	07b2                	slli	a5,a5,0xc
    80003c72:	97ba                	add	a5,a5,a4
    80003c74:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80003c78:	fc043703          	ld	a4,-64(s0)
    80003c7c:	fc843583          	ld	a1,-56(s0)
    80003c80:	020007b7          	lui	a5,0x2000
    80003c84:	17fd                	addi	a5,a5,-1
    80003c86:	00d79513          	slli	a0,a5,0xd
    80003c8a:	9702                	jalr	a4
}
    80003c8c:	0001                	nop
    80003c8e:	70e2                	ld	ra,56(sp)
    80003c90:	7442                	ld	s0,48(sp)
    80003c92:	74a2                	ld	s1,40(sp)
    80003c94:	6121                	addi	sp,sp,64
    80003c96:	8082                	ret

0000000080003c98 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003c98:	7139                	addi	sp,sp,-64
    80003c9a:	fc06                	sd	ra,56(sp)
    80003c9c:	f822                	sd	s0,48(sp)
    80003c9e:	f426                	sd	s1,40(sp)
    80003ca0:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003ca2:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003ca6:	00000097          	auipc	ra,0x0
    80003caa:	c20080e7          	jalr	-992(ra) # 800038c6 <r_sepc>
    80003cae:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003cb2:	00000097          	auipc	ra,0x0
    80003cb6:	b92080e7          	jalr	-1134(ra) # 80003844 <r_sstatus>
    80003cba:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003cbe:	00000097          	auipc	ra,0x0
    80003cc2:	c56080e7          	jalr	-938(ra) # 80003914 <r_scause>
    80003cc6:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003cca:	fc843783          	ld	a5,-56(s0)
    80003cce:	1007f793          	andi	a5,a5,256
    80003cd2:	eb89                	bnez	a5,80003ce4 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003cd4:	00007517          	auipc	a0,0x7
    80003cd8:	65c50513          	addi	a0,a0,1628 # 8000b330 <etext+0x330>
    80003cdc:	ffffd097          	auipc	ra,0xffffd
    80003ce0:	fa2080e7          	jalr	-94(ra) # 80000c7e <panic>
  if(intr_get() != 0)
    80003ce4:	00000097          	auipc	ra,0x0
    80003ce8:	cb6080e7          	jalr	-842(ra) # 8000399a <intr_get>
    80003cec:	87aa                	mv	a5,a0
    80003cee:	cb89                	beqz	a5,80003d00 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003cf0:	00007517          	auipc	a0,0x7
    80003cf4:	66850513          	addi	a0,a0,1640 # 8000b358 <etext+0x358>
    80003cf8:	ffffd097          	auipc	ra,0xffffd
    80003cfc:	f86080e7          	jalr	-122(ra) # 80000c7e <panic>

  if((which_dev = devintr()) == 0){
    80003d00:	00000097          	auipc	ra,0x0
    80003d04:	118080e7          	jalr	280(ra) # 80003e18 <devintr>
    80003d08:	87aa                	mv	a5,a0
    80003d0a:	fcf42e23          	sw	a5,-36(s0)
    80003d0e:	fdc42783          	lw	a5,-36(s0)
    80003d12:	2781                	sext.w	a5,a5
    80003d14:	e7b9                	bnez	a5,80003d62 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003d16:	fc043583          	ld	a1,-64(s0)
    80003d1a:	00007517          	auipc	a0,0x7
    80003d1e:	65e50513          	addi	a0,a0,1630 # 8000b378 <etext+0x378>
    80003d22:	ffffd097          	auipc	ra,0xffffd
    80003d26:	d06080e7          	jalr	-762(ra) # 80000a28 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003d2a:	00000097          	auipc	ra,0x0
    80003d2e:	b9c080e7          	jalr	-1124(ra) # 800038c6 <r_sepc>
    80003d32:	84aa                	mv	s1,a0
    80003d34:	00000097          	auipc	ra,0x0
    80003d38:	bfa080e7          	jalr	-1030(ra) # 8000392e <r_stval>
    80003d3c:	87aa                	mv	a5,a0
    80003d3e:	863e                	mv	a2,a5
    80003d40:	85a6                	mv	a1,s1
    80003d42:	00007517          	auipc	a0,0x7
    80003d46:	64650513          	addi	a0,a0,1606 # 8000b388 <etext+0x388>
    80003d4a:	ffffd097          	auipc	ra,0xffffd
    80003d4e:	cde080e7          	jalr	-802(ra) # 80000a28 <printf>
    panic("kerneltrap");
    80003d52:	00007517          	auipc	a0,0x7
    80003d56:	64e50513          	addi	a0,a0,1614 # 8000b3a0 <etext+0x3a0>
    80003d5a:	ffffd097          	auipc	ra,0xffffd
    80003d5e:	f24080e7          	jalr	-220(ra) # 80000c7e <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003d62:	fdc42783          	lw	a5,-36(s0)
    80003d66:	0007871b          	sext.w	a4,a5
    80003d6a:	4789                	li	a5,2
    80003d6c:	02f71663          	bne	a4,a5,80003d98 <kerneltrap+0x100>
    80003d70:	fffff097          	auipc	ra,0xfffff
    80003d74:	aa4080e7          	jalr	-1372(ra) # 80002814 <myproc>
    80003d78:	87aa                	mv	a5,a0
    80003d7a:	cf99                	beqz	a5,80003d98 <kerneltrap+0x100>
    80003d7c:	fffff097          	auipc	ra,0xfffff
    80003d80:	a98080e7          	jalr	-1384(ra) # 80002814 <myproc>
    80003d84:	87aa                	mv	a5,a0
    80003d86:	4f9c                	lw	a5,24(a5)
    80003d88:	873e                	mv	a4,a5
    80003d8a:	4791                	li	a5,4
    80003d8c:	00f71663          	bne	a4,a5,80003d98 <kerneltrap+0x100>
    yield();
    80003d90:	fffff097          	auipc	ra,0xfffff
    80003d94:	62a080e7          	jalr	1578(ra) # 800033ba <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003d98:	fd043503          	ld	a0,-48(s0)
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	b10080e7          	jalr	-1264(ra) # 800038ac <w_sepc>
  w_sstatus(sstatus);
    80003da4:	fc843503          	ld	a0,-56(s0)
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	ab6080e7          	jalr	-1354(ra) # 8000385e <w_sstatus>
}
    80003db0:	0001                	nop
    80003db2:	70e2                	ld	ra,56(sp)
    80003db4:	7442                	ld	s0,48(sp)
    80003db6:	74a2                	ld	s1,40(sp)
    80003db8:	6121                	addi	sp,sp,64
    80003dba:	8082                	ret

0000000080003dbc <clockintr>:

void
clockintr()
{
    80003dbc:	1141                	addi	sp,sp,-16
    80003dbe:	e406                	sd	ra,8(sp)
    80003dc0:	e022                	sd	s0,0(sp)
    80003dc2:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80003dc4:	00016517          	auipc	a0,0x16
    80003dc8:	30450513          	addi	a0,a0,772 # 8001a0c8 <tickslock>
    80003dcc:	ffffd097          	auipc	ra,0xffffd
    80003dd0:	4a2080e7          	jalr	1186(ra) # 8000126e <acquire>
  ticks++;
    80003dd4:	00008797          	auipc	a5,0x8
    80003dd8:	25478793          	addi	a5,a5,596 # 8000c028 <ticks>
    80003ddc:	439c                	lw	a5,0(a5)
    80003dde:	2785                	addiw	a5,a5,1
    80003de0:	0007871b          	sext.w	a4,a5
    80003de4:	00008797          	auipc	a5,0x8
    80003de8:	24478793          	addi	a5,a5,580 # 8000c028 <ticks>
    80003dec:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80003dee:	00008517          	auipc	a0,0x8
    80003df2:	23a50513          	addi	a0,a0,570 # 8000c028 <ticks>
    80003df6:	fffff097          	auipc	ra,0xfffff
    80003dfa:	6de080e7          	jalr	1758(ra) # 800034d4 <wakeup>
  release(&tickslock);
    80003dfe:	00016517          	auipc	a0,0x16
    80003e02:	2ca50513          	addi	a0,a0,714 # 8001a0c8 <tickslock>
    80003e06:	ffffd097          	auipc	ra,0xffffd
    80003e0a:	4cc080e7          	jalr	1228(ra) # 800012d2 <release>
}
    80003e0e:	0001                	nop
    80003e10:	60a2                	ld	ra,8(sp)
    80003e12:	6402                	ld	s0,0(sp)
    80003e14:	0141                	addi	sp,sp,16
    80003e16:	8082                	ret

0000000080003e18 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80003e18:	1101                	addi	sp,sp,-32
    80003e1a:	ec06                	sd	ra,24(sp)
    80003e1c:	e822                	sd	s0,16(sp)
    80003e1e:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80003e20:	00000097          	auipc	ra,0x0
    80003e24:	af4080e7          	jalr	-1292(ra) # 80003914 <r_scause>
    80003e28:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80003e2c:	fe843783          	ld	a5,-24(s0)
    80003e30:	0807d463          	bgez	a5,80003eb8 <devintr+0xa0>
     (scause & 0xff) == 9){
    80003e34:	fe843783          	ld	a5,-24(s0)
    80003e38:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80003e3c:	47a5                	li	a5,9
    80003e3e:	06f71d63          	bne	a4,a5,80003eb8 <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80003e42:	00005097          	auipc	ra,0x5
    80003e46:	a40080e7          	jalr	-1472(ra) # 80008882 <plic_claim>
    80003e4a:	87aa                	mv	a5,a0
    80003e4c:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80003e50:	fe442783          	lw	a5,-28(s0)
    80003e54:	0007871b          	sext.w	a4,a5
    80003e58:	47a9                	li	a5,10
    80003e5a:	00f71763          	bne	a4,a5,80003e68 <devintr+0x50>
      uartintr();
    80003e5e:	ffffd097          	auipc	ra,0xffffd
    80003e62:	118080e7          	jalr	280(ra) # 80000f76 <uartintr>
    80003e66:	a825                	j	80003e9e <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    80003e68:	fe442783          	lw	a5,-28(s0)
    80003e6c:	0007871b          	sext.w	a4,a5
    80003e70:	4785                	li	a5,1
    80003e72:	00f71763          	bne	a4,a5,80003e80 <devintr+0x68>
      virtio_disk_intr();
    80003e76:	00005097          	auipc	ra,0x5
    80003e7a:	320080e7          	jalr	800(ra) # 80009196 <virtio_disk_intr>
    80003e7e:	a005                	j	80003e9e <devintr+0x86>
    } else if(irq){
    80003e80:	fe442783          	lw	a5,-28(s0)
    80003e84:	2781                	sext.w	a5,a5
    80003e86:	cf81                	beqz	a5,80003e9e <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    80003e88:	fe442783          	lw	a5,-28(s0)
    80003e8c:	85be                	mv	a1,a5
    80003e8e:	00007517          	auipc	a0,0x7
    80003e92:	52250513          	addi	a0,a0,1314 # 8000b3b0 <etext+0x3b0>
    80003e96:	ffffd097          	auipc	ra,0xffffd
    80003e9a:	b92080e7          	jalr	-1134(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80003e9e:	fe442783          	lw	a5,-28(s0)
    80003ea2:	2781                	sext.w	a5,a5
    80003ea4:	cb81                	beqz	a5,80003eb4 <devintr+0x9c>
      plic_complete(irq);
    80003ea6:	fe442783          	lw	a5,-28(s0)
    80003eaa:	853e                	mv	a0,a5
    80003eac:	00005097          	auipc	ra,0x5
    80003eb0:	a14080e7          	jalr	-1516(ra) # 800088c0 <plic_complete>

    return 1;
    80003eb4:	4785                	li	a5,1
    80003eb6:	a081                	j	80003ef6 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    80003eb8:	fe843703          	ld	a4,-24(s0)
    80003ebc:	57fd                	li	a5,-1
    80003ebe:	17fe                	slli	a5,a5,0x3f
    80003ec0:	0785                	addi	a5,a5,1
    80003ec2:	02f71963          	bne	a4,a5,80003ef4 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80003ec6:	fffff097          	auipc	ra,0xfffff
    80003eca:	8f0080e7          	jalr	-1808(ra) # 800027b6 <cpuid>
    80003ece:	87aa                	mv	a5,a0
    80003ed0:	e789                	bnez	a5,80003eda <devintr+0xc2>
      clockintr();
    80003ed2:	00000097          	auipc	ra,0x0
    80003ed6:	eea080e7          	jalr	-278(ra) # 80003dbc <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80003eda:	00000097          	auipc	ra,0x0
    80003ede:	99e080e7          	jalr	-1634(ra) # 80003878 <r_sip>
    80003ee2:	87aa                	mv	a5,a0
    80003ee4:	9bf5                	andi	a5,a5,-3
    80003ee6:	853e                	mv	a0,a5
    80003ee8:	00000097          	auipc	ra,0x0
    80003eec:	9aa080e7          	jalr	-1622(ra) # 80003892 <w_sip>

    return 2;
    80003ef0:	4789                	li	a5,2
    80003ef2:	a011                	j	80003ef6 <devintr+0xde>
  } else {
    return 0;
    80003ef4:	4781                	li	a5,0
  }
}
    80003ef6:	853e                	mv	a0,a5
    80003ef8:	60e2                	ld	ra,24(sp)
    80003efa:	6442                	ld	s0,16(sp)
    80003efc:	6105                	addi	sp,sp,32
    80003efe:	8082                	ret

0000000080003f00 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80003f00:	7179                	addi	sp,sp,-48
    80003f02:	f406                	sd	ra,40(sp)
    80003f04:	f022                	sd	s0,32(sp)
    80003f06:	1800                	addi	s0,sp,48
    80003f08:	fca43c23          	sd	a0,-40(s0)
    80003f0c:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003f10:	fffff097          	auipc	ra,0xfffff
    80003f14:	904080e7          	jalr	-1788(ra) # 80002814 <myproc>
    80003f18:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80003f1c:	fe843783          	ld	a5,-24(s0)
    80003f20:	67bc                	ld	a5,72(a5)
    80003f22:	fd843703          	ld	a4,-40(s0)
    80003f26:	00f77b63          	bgeu	a4,a5,80003f3c <fetchaddr+0x3c>
    80003f2a:	fd843783          	ld	a5,-40(s0)
    80003f2e:	00878713          	addi	a4,a5,8
    80003f32:	fe843783          	ld	a5,-24(s0)
    80003f36:	67bc                	ld	a5,72(a5)
    80003f38:	00e7f463          	bgeu	a5,a4,80003f40 <fetchaddr+0x40>
    return -1;
    80003f3c:	57fd                	li	a5,-1
    80003f3e:	a01d                	j	80003f64 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80003f40:	fe843783          	ld	a5,-24(s0)
    80003f44:	6bbc                	ld	a5,80(a5)
    80003f46:	46a1                	li	a3,8
    80003f48:	fd843603          	ld	a2,-40(s0)
    80003f4c:	fd043583          	ld	a1,-48(s0)
    80003f50:	853e                	mv	a0,a5
    80003f52:	ffffe097          	auipc	ra,0xffffe
    80003f56:	462080e7          	jalr	1122(ra) # 800023b4 <copyin>
    80003f5a:	87aa                	mv	a5,a0
    80003f5c:	c399                	beqz	a5,80003f62 <fetchaddr+0x62>
    return -1;
    80003f5e:	57fd                	li	a5,-1
    80003f60:	a011                	j	80003f64 <fetchaddr+0x64>
  return 0;
    80003f62:	4781                	li	a5,0
}
    80003f64:	853e                	mv	a0,a5
    80003f66:	70a2                	ld	ra,40(sp)
    80003f68:	7402                	ld	s0,32(sp)
    80003f6a:	6145                	addi	sp,sp,48
    80003f6c:	8082                	ret

0000000080003f6e <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80003f6e:	7139                	addi	sp,sp,-64
    80003f70:	fc06                	sd	ra,56(sp)
    80003f72:	f822                	sd	s0,48(sp)
    80003f74:	0080                	addi	s0,sp,64
    80003f76:	fca43c23          	sd	a0,-40(s0)
    80003f7a:	fcb43823          	sd	a1,-48(s0)
    80003f7e:	87b2                	mv	a5,a2
    80003f80:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003f84:	fffff097          	auipc	ra,0xfffff
    80003f88:	890080e7          	jalr	-1904(ra) # 80002814 <myproc>
    80003f8c:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    80003f90:	fe843783          	ld	a5,-24(s0)
    80003f94:	6bbc                	ld	a5,80(a5)
    80003f96:	fcc42703          	lw	a4,-52(s0)
    80003f9a:	86ba                	mv	a3,a4
    80003f9c:	fd843603          	ld	a2,-40(s0)
    80003fa0:	fd043583          	ld	a1,-48(s0)
    80003fa4:	853e                	mv	a0,a5
    80003fa6:	ffffe097          	auipc	ra,0xffffe
    80003faa:	4dc080e7          	jalr	1244(ra) # 80002482 <copyinstr>
    80003fae:	87aa                	mv	a5,a0
    80003fb0:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    80003fb4:	fe442783          	lw	a5,-28(s0)
    80003fb8:	2781                	sext.w	a5,a5
    80003fba:	0007d563          	bgez	a5,80003fc4 <fetchstr+0x56>
    return err;
    80003fbe:	fe442783          	lw	a5,-28(s0)
    80003fc2:	a801                	j	80003fd2 <fetchstr+0x64>
  return strlen(buf);
    80003fc4:	fd043503          	ld	a0,-48(s0)
    80003fc8:	ffffd097          	auipc	ra,0xffffd
    80003fcc:	7f8080e7          	jalr	2040(ra) # 800017c0 <strlen>
    80003fd0:	87aa                	mv	a5,a0
}
    80003fd2:	853e                	mv	a0,a5
    80003fd4:	70e2                	ld	ra,56(sp)
    80003fd6:	7442                	ld	s0,48(sp)
    80003fd8:	6121                	addi	sp,sp,64
    80003fda:	8082                	ret

0000000080003fdc <argraw>:

static uint64
argraw(int n)
{
    80003fdc:	7179                	addi	sp,sp,-48
    80003fde:	f406                	sd	ra,40(sp)
    80003fe0:	f022                	sd	s0,32(sp)
    80003fe2:	1800                	addi	s0,sp,48
    80003fe4:	87aa                	mv	a5,a0
    80003fe6:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003fea:	fffff097          	auipc	ra,0xfffff
    80003fee:	82a080e7          	jalr	-2006(ra) # 80002814 <myproc>
    80003ff2:	fea43423          	sd	a0,-24(s0)
    80003ff6:	fdc42783          	lw	a5,-36(s0)
    80003ffa:	0007871b          	sext.w	a4,a5
    80003ffe:	4795                	li	a5,5
    80004000:	06e7e263          	bltu	a5,a4,80004064 <argraw+0x88>
    80004004:	fdc46783          	lwu	a5,-36(s0)
    80004008:	00279713          	slli	a4,a5,0x2
    8000400c:	00007797          	auipc	a5,0x7
    80004010:	3cc78793          	addi	a5,a5,972 # 8000b3d8 <etext+0x3d8>
    80004014:	97ba                	add	a5,a5,a4
    80004016:	439c                	lw	a5,0(a5)
    80004018:	0007871b          	sext.w	a4,a5
    8000401c:	00007797          	auipc	a5,0x7
    80004020:	3bc78793          	addi	a5,a5,956 # 8000b3d8 <etext+0x3d8>
    80004024:	97ba                	add	a5,a5,a4
    80004026:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80004028:	fe843783          	ld	a5,-24(s0)
    8000402c:	6fbc                	ld	a5,88(a5)
    8000402e:	7bbc                	ld	a5,112(a5)
    80004030:	a091                	j	80004074 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004032:	fe843783          	ld	a5,-24(s0)
    80004036:	6fbc                	ld	a5,88(a5)
    80004038:	7fbc                	ld	a5,120(a5)
    8000403a:	a82d                	j	80004074 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000403c:	fe843783          	ld	a5,-24(s0)
    80004040:	6fbc                	ld	a5,88(a5)
    80004042:	63dc                	ld	a5,128(a5)
    80004044:	a805                	j	80004074 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004046:	fe843783          	ld	a5,-24(s0)
    8000404a:	6fbc                	ld	a5,88(a5)
    8000404c:	67dc                	ld	a5,136(a5)
    8000404e:	a01d                	j	80004074 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004050:	fe843783          	ld	a5,-24(s0)
    80004054:	6fbc                	ld	a5,88(a5)
    80004056:	6bdc                	ld	a5,144(a5)
    80004058:	a831                	j	80004074 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000405a:	fe843783          	ld	a5,-24(s0)
    8000405e:	6fbc                	ld	a5,88(a5)
    80004060:	6fdc                	ld	a5,152(a5)
    80004062:	a809                	j	80004074 <argraw+0x98>
  }
  panic("argraw");
    80004064:	00007517          	auipc	a0,0x7
    80004068:	36c50513          	addi	a0,a0,876 # 8000b3d0 <etext+0x3d0>
    8000406c:	ffffd097          	auipc	ra,0xffffd
    80004070:	c12080e7          	jalr	-1006(ra) # 80000c7e <panic>
  return -1;
}
    80004074:	853e                	mv	a0,a5
    80004076:	70a2                	ld	ra,40(sp)
    80004078:	7402                	ld	s0,32(sp)
    8000407a:	6145                	addi	sp,sp,48
    8000407c:	8082                	ret

000000008000407e <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    8000407e:	1101                	addi	sp,sp,-32
    80004080:	ec06                	sd	ra,24(sp)
    80004082:	e822                	sd	s0,16(sp)
    80004084:	1000                	addi	s0,sp,32
    80004086:	87aa                	mv	a5,a0
    80004088:	feb43023          	sd	a1,-32(s0)
    8000408c:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004090:	fec42783          	lw	a5,-20(s0)
    80004094:	853e                	mv	a0,a5
    80004096:	00000097          	auipc	ra,0x0
    8000409a:	f46080e7          	jalr	-186(ra) # 80003fdc <argraw>
    8000409e:	87aa                	mv	a5,a0
    800040a0:	0007871b          	sext.w	a4,a5
    800040a4:	fe043783          	ld	a5,-32(s0)
    800040a8:	c398                	sw	a4,0(a5)
  return 0;
    800040aa:	4781                	li	a5,0
}
    800040ac:	853e                	mv	a0,a5
    800040ae:	60e2                	ld	ra,24(sp)
    800040b0:	6442                	ld	s0,16(sp)
    800040b2:	6105                	addi	sp,sp,32
    800040b4:	8082                	ret

00000000800040b6 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    800040b6:	1101                	addi	sp,sp,-32
    800040b8:	ec06                	sd	ra,24(sp)
    800040ba:	e822                	sd	s0,16(sp)
    800040bc:	1000                	addi	s0,sp,32
    800040be:	87aa                	mv	a5,a0
    800040c0:	feb43023          	sd	a1,-32(s0)
    800040c4:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800040c8:	fec42783          	lw	a5,-20(s0)
    800040cc:	853e                	mv	a0,a5
    800040ce:	00000097          	auipc	ra,0x0
    800040d2:	f0e080e7          	jalr	-242(ra) # 80003fdc <argraw>
    800040d6:	872a                	mv	a4,a0
    800040d8:	fe043783          	ld	a5,-32(s0)
    800040dc:	e398                	sd	a4,0(a5)
  return 0;
    800040de:	4781                	li	a5,0
}
    800040e0:	853e                	mv	a0,a5
    800040e2:	60e2                	ld	ra,24(sp)
    800040e4:	6442                	ld	s0,16(sp)
    800040e6:	6105                	addi	sp,sp,32
    800040e8:	8082                	ret

00000000800040ea <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800040ea:	7179                	addi	sp,sp,-48
    800040ec:	f406                	sd	ra,40(sp)
    800040ee:	f022                	sd	s0,32(sp)
    800040f0:	1800                	addi	s0,sp,48
    800040f2:	87aa                	mv	a5,a0
    800040f4:	fcb43823          	sd	a1,-48(s0)
    800040f8:	8732                	mv	a4,a2
    800040fa:	fcf42e23          	sw	a5,-36(s0)
    800040fe:	87ba                	mv	a5,a4
    80004100:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    80004104:	fe840713          	addi	a4,s0,-24
    80004108:	fdc42783          	lw	a5,-36(s0)
    8000410c:	85ba                	mv	a1,a4
    8000410e:	853e                	mv	a0,a5
    80004110:	00000097          	auipc	ra,0x0
    80004114:	fa6080e7          	jalr	-90(ra) # 800040b6 <argaddr>
    80004118:	87aa                	mv	a5,a0
    8000411a:	0007d463          	bgez	a5,80004122 <argstr+0x38>
    return -1;
    8000411e:	57fd                	li	a5,-1
    80004120:	a831                	j	8000413c <argstr+0x52>
  return fetchstr(addr, buf, max);
    80004122:	fe843783          	ld	a5,-24(s0)
    80004126:	fd842703          	lw	a4,-40(s0)
    8000412a:	863a                	mv	a2,a4
    8000412c:	fd043583          	ld	a1,-48(s0)
    80004130:	853e                	mv	a0,a5
    80004132:	00000097          	auipc	ra,0x0
    80004136:	e3c080e7          	jalr	-452(ra) # 80003f6e <fetchstr>
    8000413a:	87aa                	mv	a5,a0
}
    8000413c:	853e                	mv	a0,a5
    8000413e:	70a2                	ld	ra,40(sp)
    80004140:	7402                	ld	s0,32(sp)
    80004142:	6145                	addi	sp,sp,48
    80004144:	8082                	ret

0000000080004146 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    80004146:	7179                	addi	sp,sp,-48
    80004148:	f406                	sd	ra,40(sp)
    8000414a:	f022                	sd	s0,32(sp)
    8000414c:	ec26                	sd	s1,24(sp)
    8000414e:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004150:	ffffe097          	auipc	ra,0xffffe
    80004154:	6c4080e7          	jalr	1732(ra) # 80002814 <myproc>
    80004158:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    8000415c:	fd843783          	ld	a5,-40(s0)
    80004160:	6fbc                	ld	a5,88(a5)
    80004162:	77dc                	ld	a5,168(a5)
    80004164:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80004168:	fd442783          	lw	a5,-44(s0)
    8000416c:	2781                	sext.w	a5,a5
    8000416e:	04f05263          	blez	a5,800041b2 <syscall+0x6c>
    80004172:	fd442783          	lw	a5,-44(s0)
    80004176:	873e                	mv	a4,a5
    80004178:	47d5                	li	a5,21
    8000417a:	02e7ec63          	bltu	a5,a4,800041b2 <syscall+0x6c>
    8000417e:	00007717          	auipc	a4,0x7
    80004182:	64270713          	addi	a4,a4,1602 # 8000b7c0 <syscalls>
    80004186:	fd442783          	lw	a5,-44(s0)
    8000418a:	078e                	slli	a5,a5,0x3
    8000418c:	97ba                	add	a5,a5,a4
    8000418e:	639c                	ld	a5,0(a5)
    80004190:	c38d                	beqz	a5,800041b2 <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    80004192:	00007717          	auipc	a4,0x7
    80004196:	62e70713          	addi	a4,a4,1582 # 8000b7c0 <syscalls>
    8000419a:	fd442783          	lw	a5,-44(s0)
    8000419e:	078e                	slli	a5,a5,0x3
    800041a0:	97ba                	add	a5,a5,a4
    800041a2:	6398                	ld	a4,0(a5)
    800041a4:	fd843783          	ld	a5,-40(s0)
    800041a8:	6fa4                	ld	s1,88(a5)
    800041aa:	9702                	jalr	a4
    800041ac:	87aa                	mv	a5,a0
    800041ae:	f8bc                	sd	a5,112(s1)
    800041b0:	a815                	j	800041e4 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800041b2:	fd843783          	ld	a5,-40(s0)
    800041b6:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800041b8:	fd843783          	ld	a5,-40(s0)
    800041bc:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800041c0:	fd442683          	lw	a3,-44(s0)
    800041c4:	863e                	mv	a2,a5
    800041c6:	85ba                	mv	a1,a4
    800041c8:	00007517          	auipc	a0,0x7
    800041cc:	22850513          	addi	a0,a0,552 # 8000b3f0 <etext+0x3f0>
    800041d0:	ffffd097          	auipc	ra,0xffffd
    800041d4:	858080e7          	jalr	-1960(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    800041d8:	fd843783          	ld	a5,-40(s0)
    800041dc:	6fbc                	ld	a5,88(a5)
    800041de:	577d                	li	a4,-1
    800041e0:	fbb8                	sd	a4,112(a5)
  }
}
    800041e2:	0001                	nop
    800041e4:	0001                	nop
    800041e6:	70a2                	ld	ra,40(sp)
    800041e8:	7402                	ld	s0,32(sp)
    800041ea:	64e2                	ld	s1,24(sp)
    800041ec:	6145                	addi	sp,sp,48
    800041ee:	8082                	ret

00000000800041f0 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800041f0:	1101                	addi	sp,sp,-32
    800041f2:	ec06                	sd	ra,24(sp)
    800041f4:	e822                	sd	s0,16(sp)
    800041f6:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    800041f8:	fec40793          	addi	a5,s0,-20
    800041fc:	85be                	mv	a1,a5
    800041fe:	4501                	li	a0,0
    80004200:	00000097          	auipc	ra,0x0
    80004204:	e7e080e7          	jalr	-386(ra) # 8000407e <argint>
    80004208:	87aa                	mv	a5,a0
    8000420a:	0007d463          	bgez	a5,80004212 <sys_exit+0x22>
    return -1;
    8000420e:	57fd                	li	a5,-1
    80004210:	a809                	j	80004222 <sys_exit+0x32>
  exit(n);
    80004212:	fec42783          	lw	a5,-20(s0)
    80004216:	853e                	mv	a0,a5
    80004218:	fffff097          	auipc	ra,0xfffff
    8000421c:	d08080e7          	jalr	-760(ra) # 80002f20 <exit>
  return 0;  // not reached
    80004220:	4781                	li	a5,0
}
    80004222:	853e                	mv	a0,a5
    80004224:	60e2                	ld	ra,24(sp)
    80004226:	6442                	ld	s0,16(sp)
    80004228:	6105                	addi	sp,sp,32
    8000422a:	8082                	ret

000000008000422c <sys_getpid>:

uint64
sys_getpid(void)
{
    8000422c:	1141                	addi	sp,sp,-16
    8000422e:	e406                	sd	ra,8(sp)
    80004230:	e022                	sd	s0,0(sp)
    80004232:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004234:	ffffe097          	auipc	ra,0xffffe
    80004238:	5e0080e7          	jalr	1504(ra) # 80002814 <myproc>
    8000423c:	87aa                	mv	a5,a0
    8000423e:	5b9c                	lw	a5,48(a5)
}
    80004240:	853e                	mv	a0,a5
    80004242:	60a2                	ld	ra,8(sp)
    80004244:	6402                	ld	s0,0(sp)
    80004246:	0141                	addi	sp,sp,16
    80004248:	8082                	ret

000000008000424a <sys_fork>:

uint64
sys_fork(void)
{
    8000424a:	1141                	addi	sp,sp,-16
    8000424c:	e406                	sd	ra,8(sp)
    8000424e:	e022                	sd	s0,0(sp)
    80004250:	0800                	addi	s0,sp,16
  return fork();
    80004252:	fffff097          	auipc	ra,0xfffff
    80004256:	aa8080e7          	jalr	-1368(ra) # 80002cfa <fork>
    8000425a:	87aa                	mv	a5,a0
}
    8000425c:	853e                	mv	a0,a5
    8000425e:	60a2                	ld	ra,8(sp)
    80004260:	6402                	ld	s0,0(sp)
    80004262:	0141                	addi	sp,sp,16
    80004264:	8082                	ret

0000000080004266 <sys_wait>:

uint64
sys_wait(void)
{
    80004266:	1101                	addi	sp,sp,-32
    80004268:	ec06                	sd	ra,24(sp)
    8000426a:	e822                	sd	s0,16(sp)
    8000426c:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8000426e:	fe840793          	addi	a5,s0,-24
    80004272:	85be                	mv	a1,a5
    80004274:	4501                	li	a0,0
    80004276:	00000097          	auipc	ra,0x0
    8000427a:	e40080e7          	jalr	-448(ra) # 800040b6 <argaddr>
    8000427e:	87aa                	mv	a5,a0
    80004280:	0007d463          	bgez	a5,80004288 <sys_wait+0x22>
    return -1;
    80004284:	57fd                	li	a5,-1
    80004286:	a809                	j	80004298 <sys_wait+0x32>
  return wait(p);
    80004288:	fe843783          	ld	a5,-24(s0)
    8000428c:	853e                	mv	a0,a5
    8000428e:	fffff097          	auipc	ra,0xfffff
    80004292:	dce080e7          	jalr	-562(ra) # 8000305c <wait>
    80004296:	87aa                	mv	a5,a0
}
    80004298:	853e                	mv	a0,a5
    8000429a:	60e2                	ld	ra,24(sp)
    8000429c:	6442                	ld	s0,16(sp)
    8000429e:	6105                	addi	sp,sp,32
    800042a0:	8082                	ret

00000000800042a2 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800042a2:	1101                	addi	sp,sp,-32
    800042a4:	ec06                	sd	ra,24(sp)
    800042a6:	e822                	sd	s0,16(sp)
    800042a8:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800042aa:	fe840793          	addi	a5,s0,-24
    800042ae:	85be                	mv	a1,a5
    800042b0:	4501                	li	a0,0
    800042b2:	00000097          	auipc	ra,0x0
    800042b6:	dcc080e7          	jalr	-564(ra) # 8000407e <argint>
    800042ba:	87aa                	mv	a5,a0
    800042bc:	0007d463          	bgez	a5,800042c4 <sys_sbrk+0x22>
    return -1;
    800042c0:	57fd                	li	a5,-1
    800042c2:	a03d                	j	800042f0 <sys_sbrk+0x4e>
  addr = myproc()->sz;
    800042c4:	ffffe097          	auipc	ra,0xffffe
    800042c8:	550080e7          	jalr	1360(ra) # 80002814 <myproc>
    800042cc:	87aa                	mv	a5,a0
    800042ce:	67bc                	ld	a5,72(a5)
    800042d0:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    800042d4:	fe842783          	lw	a5,-24(s0)
    800042d8:	853e                	mv	a0,a5
    800042da:	fffff097          	auipc	ra,0xfffff
    800042de:	96e080e7          	jalr	-1682(ra) # 80002c48 <growproc>
    800042e2:	87aa                	mv	a5,a0
    800042e4:	0007d463          	bgez	a5,800042ec <sys_sbrk+0x4a>
    return -1;
    800042e8:	57fd                	li	a5,-1
    800042ea:	a019                	j	800042f0 <sys_sbrk+0x4e>
  return addr;
    800042ec:	fec42783          	lw	a5,-20(s0)
}
    800042f0:	853e                	mv	a0,a5
    800042f2:	60e2                	ld	ra,24(sp)
    800042f4:	6442                	ld	s0,16(sp)
    800042f6:	6105                	addi	sp,sp,32
    800042f8:	8082                	ret

00000000800042fa <sys_sleep>:

uint64
sys_sleep(void)
{
    800042fa:	1101                	addi	sp,sp,-32
    800042fc:	ec06                	sd	ra,24(sp)
    800042fe:	e822                	sd	s0,16(sp)
    80004300:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80004302:	fe840793          	addi	a5,s0,-24
    80004306:	85be                	mv	a1,a5
    80004308:	4501                	li	a0,0
    8000430a:	00000097          	auipc	ra,0x0
    8000430e:	d74080e7          	jalr	-652(ra) # 8000407e <argint>
    80004312:	87aa                	mv	a5,a0
    80004314:	0007d463          	bgez	a5,8000431c <sys_sleep+0x22>
    return -1;
    80004318:	57fd                	li	a5,-1
    8000431a:	a079                	j	800043a8 <sys_sleep+0xae>
  acquire(&tickslock);
    8000431c:	00016517          	auipc	a0,0x16
    80004320:	dac50513          	addi	a0,a0,-596 # 8001a0c8 <tickslock>
    80004324:	ffffd097          	auipc	ra,0xffffd
    80004328:	f4a080e7          	jalr	-182(ra) # 8000126e <acquire>
  ticks0 = ticks;
    8000432c:	00008797          	auipc	a5,0x8
    80004330:	cfc78793          	addi	a5,a5,-772 # 8000c028 <ticks>
    80004334:	439c                	lw	a5,0(a5)
    80004336:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000433a:	a835                	j	80004376 <sys_sleep+0x7c>
    if(myproc()->killed){
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	4d8080e7          	jalr	1240(ra) # 80002814 <myproc>
    80004344:	87aa                	mv	a5,a0
    80004346:	579c                	lw	a5,40(a5)
    80004348:	cb99                	beqz	a5,8000435e <sys_sleep+0x64>
      release(&tickslock);
    8000434a:	00016517          	auipc	a0,0x16
    8000434e:	d7e50513          	addi	a0,a0,-642 # 8001a0c8 <tickslock>
    80004352:	ffffd097          	auipc	ra,0xffffd
    80004356:	f80080e7          	jalr	-128(ra) # 800012d2 <release>
      return -1;
    8000435a:	57fd                	li	a5,-1
    8000435c:	a0b1                	j	800043a8 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    8000435e:	00016597          	auipc	a1,0x16
    80004362:	d6a58593          	addi	a1,a1,-662 # 8001a0c8 <tickslock>
    80004366:	00008517          	auipc	a0,0x8
    8000436a:	cc250513          	addi	a0,a0,-830 # 8000c028 <ticks>
    8000436e:	fffff097          	auipc	ra,0xfffff
    80004372:	0ea080e7          	jalr	234(ra) # 80003458 <sleep>
  while(ticks - ticks0 < n){
    80004376:	00008797          	auipc	a5,0x8
    8000437a:	cb278793          	addi	a5,a5,-846 # 8000c028 <ticks>
    8000437e:	4398                	lw	a4,0(a5)
    80004380:	fec42783          	lw	a5,-20(s0)
    80004384:	40f707bb          	subw	a5,a4,a5
    80004388:	0007871b          	sext.w	a4,a5
    8000438c:	fe842783          	lw	a5,-24(s0)
    80004390:	2781                	sext.w	a5,a5
    80004392:	faf765e3          	bltu	a4,a5,8000433c <sys_sleep+0x42>
  }
  release(&tickslock);
    80004396:	00016517          	auipc	a0,0x16
    8000439a:	d3250513          	addi	a0,a0,-718 # 8001a0c8 <tickslock>
    8000439e:	ffffd097          	auipc	ra,0xffffd
    800043a2:	f34080e7          	jalr	-204(ra) # 800012d2 <release>
  return 0;
    800043a6:	4781                	li	a5,0
}
    800043a8:	853e                	mv	a0,a5
    800043aa:	60e2                	ld	ra,24(sp)
    800043ac:	6442                	ld	s0,16(sp)
    800043ae:	6105                	addi	sp,sp,32
    800043b0:	8082                	ret

00000000800043b2 <sys_kill>:

uint64
sys_kill(void)
{
    800043b2:	1101                	addi	sp,sp,-32
    800043b4:	ec06                	sd	ra,24(sp)
    800043b6:	e822                	sd	s0,16(sp)
    800043b8:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800043ba:	fec40793          	addi	a5,s0,-20
    800043be:	85be                	mv	a1,a5
    800043c0:	4501                	li	a0,0
    800043c2:	00000097          	auipc	ra,0x0
    800043c6:	cbc080e7          	jalr	-836(ra) # 8000407e <argint>
    800043ca:	87aa                	mv	a5,a0
    800043cc:	0007d463          	bgez	a5,800043d4 <sys_kill+0x22>
    return -1;
    800043d0:	57fd                	li	a5,-1
    800043d2:	a809                	j	800043e4 <sys_kill+0x32>
  return kill(pid);
    800043d4:	fec42783          	lw	a5,-20(s0)
    800043d8:	853e                	mv	a0,a5
    800043da:	fffff097          	auipc	ra,0xfffff
    800043de:	192080e7          	jalr	402(ra) # 8000356c <kill>
    800043e2:	87aa                	mv	a5,a0
}
    800043e4:	853e                	mv	a0,a5
    800043e6:	60e2                	ld	ra,24(sp)
    800043e8:	6442                	ld	s0,16(sp)
    800043ea:	6105                	addi	sp,sp,32
    800043ec:	8082                	ret

00000000800043ee <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800043ee:	1101                	addi	sp,sp,-32
    800043f0:	ec06                	sd	ra,24(sp)
    800043f2:	e822                	sd	s0,16(sp)
    800043f4:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800043f6:	00016517          	auipc	a0,0x16
    800043fa:	cd250513          	addi	a0,a0,-814 # 8001a0c8 <tickslock>
    800043fe:	ffffd097          	auipc	ra,0xffffd
    80004402:	e70080e7          	jalr	-400(ra) # 8000126e <acquire>
  xticks = ticks;
    80004406:	00008797          	auipc	a5,0x8
    8000440a:	c2278793          	addi	a5,a5,-990 # 8000c028 <ticks>
    8000440e:	439c                	lw	a5,0(a5)
    80004410:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004414:	00016517          	auipc	a0,0x16
    80004418:	cb450513          	addi	a0,a0,-844 # 8001a0c8 <tickslock>
    8000441c:	ffffd097          	auipc	ra,0xffffd
    80004420:	eb6080e7          	jalr	-330(ra) # 800012d2 <release>
  return xticks;
    80004424:	fec46783          	lwu	a5,-20(s0)
}
    80004428:	853e                	mv	a0,a5
    8000442a:	60e2                	ld	ra,24(sp)
    8000442c:	6442                	ld	s0,16(sp)
    8000442e:	6105                	addi	sp,sp,32
    80004430:	8082                	ret

0000000080004432 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004432:	1101                	addi	sp,sp,-32
    80004434:	ec06                	sd	ra,24(sp)
    80004436:	e822                	sd	s0,16(sp)
    80004438:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8000443a:	00007597          	auipc	a1,0x7
    8000443e:	fd658593          	addi	a1,a1,-42 # 8000b410 <etext+0x410>
    80004442:	00016517          	auipc	a0,0x16
    80004446:	c9e50513          	addi	a0,a0,-866 # 8001a0e0 <bcache>
    8000444a:	ffffd097          	auipc	ra,0xffffd
    8000444e:	df4080e7          	jalr	-524(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004452:	00016717          	auipc	a4,0x16
    80004456:	c8e70713          	addi	a4,a4,-882 # 8001a0e0 <bcache>
    8000445a:	67a1                	lui	a5,0x8
    8000445c:	97ba                	add	a5,a5,a4
    8000445e:	0001e717          	auipc	a4,0x1e
    80004462:	eea70713          	addi	a4,a4,-278 # 80022348 <bcache+0x8268>
    80004466:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    8000446a:	00016717          	auipc	a4,0x16
    8000446e:	c7670713          	addi	a4,a4,-906 # 8001a0e0 <bcache>
    80004472:	67a1                	lui	a5,0x8
    80004474:	97ba                	add	a5,a5,a4
    80004476:	0001e717          	auipc	a4,0x1e
    8000447a:	ed270713          	addi	a4,a4,-302 # 80022348 <bcache+0x8268>
    8000447e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004482:	00016797          	auipc	a5,0x16
    80004486:	c7678793          	addi	a5,a5,-906 # 8001a0f8 <bcache+0x18>
    8000448a:	fef43423          	sd	a5,-24(s0)
    8000448e:	a895                	j	80004502 <binit+0xd0>
    b->next = bcache.head.next;
    80004490:	00016717          	auipc	a4,0x16
    80004494:	c5070713          	addi	a4,a4,-944 # 8001a0e0 <bcache>
    80004498:	67a1                	lui	a5,0x8
    8000449a:	97ba                	add	a5,a5,a4
    8000449c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    800044a0:	fe843783          	ld	a5,-24(s0)
    800044a4:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    800044a6:	fe843783          	ld	a5,-24(s0)
    800044aa:	0001e717          	auipc	a4,0x1e
    800044ae:	e9e70713          	addi	a4,a4,-354 # 80022348 <bcache+0x8268>
    800044b2:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    800044b4:	fe843783          	ld	a5,-24(s0)
    800044b8:	07c1                	addi	a5,a5,16
    800044ba:	00007597          	auipc	a1,0x7
    800044be:	f5e58593          	addi	a1,a1,-162 # 8000b418 <etext+0x418>
    800044c2:	853e                	mv	a0,a5
    800044c4:	00002097          	auipc	ra,0x2
    800044c8:	ff8080e7          	jalr	-8(ra) # 800064bc <initsleeplock>
    bcache.head.next->prev = b;
    800044cc:	00016717          	auipc	a4,0x16
    800044d0:	c1470713          	addi	a4,a4,-1004 # 8001a0e0 <bcache>
    800044d4:	67a1                	lui	a5,0x8
    800044d6:	97ba                	add	a5,a5,a4
    800044d8:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800044dc:	fe843703          	ld	a4,-24(s0)
    800044e0:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800044e2:	00016717          	auipc	a4,0x16
    800044e6:	bfe70713          	addi	a4,a4,-1026 # 8001a0e0 <bcache>
    800044ea:	67a1                	lui	a5,0x8
    800044ec:	97ba                	add	a5,a5,a4
    800044ee:	fe843703          	ld	a4,-24(s0)
    800044f2:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800044f6:	fe843783          	ld	a5,-24(s0)
    800044fa:	45878793          	addi	a5,a5,1112
    800044fe:	fef43423          	sd	a5,-24(s0)
    80004502:	0001e797          	auipc	a5,0x1e
    80004506:	e4678793          	addi	a5,a5,-442 # 80022348 <bcache+0x8268>
    8000450a:	fe843703          	ld	a4,-24(s0)
    8000450e:	f8f761e3          	bltu	a4,a5,80004490 <binit+0x5e>
  }
}
    80004512:	0001                	nop
    80004514:	0001                	nop
    80004516:	60e2                	ld	ra,24(sp)
    80004518:	6442                	ld	s0,16(sp)
    8000451a:	6105                	addi	sp,sp,32
    8000451c:	8082                	ret

000000008000451e <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    8000451e:	7179                	addi	sp,sp,-48
    80004520:	f406                	sd	ra,40(sp)
    80004522:	f022                	sd	s0,32(sp)
    80004524:	1800                	addi	s0,sp,48
    80004526:	87aa                	mv	a5,a0
    80004528:	872e                	mv	a4,a1
    8000452a:	fcf42e23          	sw	a5,-36(s0)
    8000452e:	87ba                	mv	a5,a4
    80004530:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004534:	00016517          	auipc	a0,0x16
    80004538:	bac50513          	addi	a0,a0,-1108 # 8001a0e0 <bcache>
    8000453c:	ffffd097          	auipc	ra,0xffffd
    80004540:	d32080e7          	jalr	-718(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004544:	00016717          	auipc	a4,0x16
    80004548:	b9c70713          	addi	a4,a4,-1124 # 8001a0e0 <bcache>
    8000454c:	67a1                	lui	a5,0x8
    8000454e:	97ba                	add	a5,a5,a4
    80004550:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004554:	fef43423          	sd	a5,-24(s0)
    80004558:	a095                	j	800045bc <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    8000455a:	fe843783          	ld	a5,-24(s0)
    8000455e:	4798                	lw	a4,8(a5)
    80004560:	fdc42783          	lw	a5,-36(s0)
    80004564:	2781                	sext.w	a5,a5
    80004566:	04e79663          	bne	a5,a4,800045b2 <bget+0x94>
    8000456a:	fe843783          	ld	a5,-24(s0)
    8000456e:	47d8                	lw	a4,12(a5)
    80004570:	fd842783          	lw	a5,-40(s0)
    80004574:	2781                	sext.w	a5,a5
    80004576:	02e79e63          	bne	a5,a4,800045b2 <bget+0x94>
      b->refcnt++;
    8000457a:	fe843783          	ld	a5,-24(s0)
    8000457e:	43bc                	lw	a5,64(a5)
    80004580:	2785                	addiw	a5,a5,1
    80004582:	0007871b          	sext.w	a4,a5
    80004586:	fe843783          	ld	a5,-24(s0)
    8000458a:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000458c:	00016517          	auipc	a0,0x16
    80004590:	b5450513          	addi	a0,a0,-1196 # 8001a0e0 <bcache>
    80004594:	ffffd097          	auipc	ra,0xffffd
    80004598:	d3e080e7          	jalr	-706(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    8000459c:	fe843783          	ld	a5,-24(s0)
    800045a0:	07c1                	addi	a5,a5,16
    800045a2:	853e                	mv	a0,a5
    800045a4:	00002097          	auipc	ra,0x2
    800045a8:	f64080e7          	jalr	-156(ra) # 80006508 <acquiresleep>
      return b;
    800045ac:	fe843783          	ld	a5,-24(s0)
    800045b0:	a07d                	j	8000465e <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800045b2:	fe843783          	ld	a5,-24(s0)
    800045b6:	6bbc                	ld	a5,80(a5)
    800045b8:	fef43423          	sd	a5,-24(s0)
    800045bc:	fe843703          	ld	a4,-24(s0)
    800045c0:	0001e797          	auipc	a5,0x1e
    800045c4:	d8878793          	addi	a5,a5,-632 # 80022348 <bcache+0x8268>
    800045c8:	f8f719e3          	bne	a4,a5,8000455a <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800045cc:	00016717          	auipc	a4,0x16
    800045d0:	b1470713          	addi	a4,a4,-1260 # 8001a0e0 <bcache>
    800045d4:	67a1                	lui	a5,0x8
    800045d6:	97ba                	add	a5,a5,a4
    800045d8:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800045dc:	fef43423          	sd	a5,-24(s0)
    800045e0:	a8b9                	j	8000463e <bget+0x120>
    if(b->refcnt == 0) {
    800045e2:	fe843783          	ld	a5,-24(s0)
    800045e6:	43bc                	lw	a5,64(a5)
    800045e8:	e7b1                	bnez	a5,80004634 <bget+0x116>
      b->dev = dev;
    800045ea:	fe843783          	ld	a5,-24(s0)
    800045ee:	fdc42703          	lw	a4,-36(s0)
    800045f2:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    800045f4:	fe843783          	ld	a5,-24(s0)
    800045f8:	fd842703          	lw	a4,-40(s0)
    800045fc:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800045fe:	fe843783          	ld	a5,-24(s0)
    80004602:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004606:	fe843783          	ld	a5,-24(s0)
    8000460a:	4705                	li	a4,1
    8000460c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000460e:	00016517          	auipc	a0,0x16
    80004612:	ad250513          	addi	a0,a0,-1326 # 8001a0e0 <bcache>
    80004616:	ffffd097          	auipc	ra,0xffffd
    8000461a:	cbc080e7          	jalr	-836(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    8000461e:	fe843783          	ld	a5,-24(s0)
    80004622:	07c1                	addi	a5,a5,16
    80004624:	853e                	mv	a0,a5
    80004626:	00002097          	auipc	ra,0x2
    8000462a:	ee2080e7          	jalr	-286(ra) # 80006508 <acquiresleep>
      return b;
    8000462e:	fe843783          	ld	a5,-24(s0)
    80004632:	a035                	j	8000465e <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004634:	fe843783          	ld	a5,-24(s0)
    80004638:	67bc                	ld	a5,72(a5)
    8000463a:	fef43423          	sd	a5,-24(s0)
    8000463e:	fe843703          	ld	a4,-24(s0)
    80004642:	0001e797          	auipc	a5,0x1e
    80004646:	d0678793          	addi	a5,a5,-762 # 80022348 <bcache+0x8268>
    8000464a:	f8f71ce3          	bne	a4,a5,800045e2 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    8000464e:	00007517          	auipc	a0,0x7
    80004652:	dd250513          	addi	a0,a0,-558 # 8000b420 <etext+0x420>
    80004656:	ffffc097          	auipc	ra,0xffffc
    8000465a:	628080e7          	jalr	1576(ra) # 80000c7e <panic>
}
    8000465e:	853e                	mv	a0,a5
    80004660:	70a2                	ld	ra,40(sp)
    80004662:	7402                	ld	s0,32(sp)
    80004664:	6145                	addi	sp,sp,48
    80004666:	8082                	ret

0000000080004668 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004668:	7179                	addi	sp,sp,-48
    8000466a:	f406                	sd	ra,40(sp)
    8000466c:	f022                	sd	s0,32(sp)
    8000466e:	1800                	addi	s0,sp,48
    80004670:	87aa                	mv	a5,a0
    80004672:	872e                	mv	a4,a1
    80004674:	fcf42e23          	sw	a5,-36(s0)
    80004678:	87ba                	mv	a5,a4
    8000467a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    8000467e:	fd842703          	lw	a4,-40(s0)
    80004682:	fdc42783          	lw	a5,-36(s0)
    80004686:	85ba                	mv	a1,a4
    80004688:	853e                	mv	a0,a5
    8000468a:	00000097          	auipc	ra,0x0
    8000468e:	e94080e7          	jalr	-364(ra) # 8000451e <bget>
    80004692:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004696:	fe843783          	ld	a5,-24(s0)
    8000469a:	439c                	lw	a5,0(a5)
    8000469c:	ef81                	bnez	a5,800046b4 <bread+0x4c>
    virtio_disk_rw(b, 0);
    8000469e:	4581                	li	a1,0
    800046a0:	fe843503          	ld	a0,-24(s0)
    800046a4:	00004097          	auipc	ra,0x4
    800046a8:	756080e7          	jalr	1878(ra) # 80008dfa <virtio_disk_rw>
    b->valid = 1;
    800046ac:	fe843783          	ld	a5,-24(s0)
    800046b0:	4705                	li	a4,1
    800046b2:	c398                	sw	a4,0(a5)
  }
  return b;
    800046b4:	fe843783          	ld	a5,-24(s0)
}
    800046b8:	853e                	mv	a0,a5
    800046ba:	70a2                	ld	ra,40(sp)
    800046bc:	7402                	ld	s0,32(sp)
    800046be:	6145                	addi	sp,sp,48
    800046c0:	8082                	ret

00000000800046c2 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    800046c2:	1101                	addi	sp,sp,-32
    800046c4:	ec06                	sd	ra,24(sp)
    800046c6:	e822                	sd	s0,16(sp)
    800046c8:	1000                	addi	s0,sp,32
    800046ca:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800046ce:	fe843783          	ld	a5,-24(s0)
    800046d2:	07c1                	addi	a5,a5,16
    800046d4:	853e                	mv	a0,a5
    800046d6:	00002097          	auipc	ra,0x2
    800046da:	ef2080e7          	jalr	-270(ra) # 800065c8 <holdingsleep>
    800046de:	87aa                	mv	a5,a0
    800046e0:	eb89                	bnez	a5,800046f2 <bwrite+0x30>
    panic("bwrite");
    800046e2:	00007517          	auipc	a0,0x7
    800046e6:	d5650513          	addi	a0,a0,-682 # 8000b438 <etext+0x438>
    800046ea:	ffffc097          	auipc	ra,0xffffc
    800046ee:	594080e7          	jalr	1428(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    800046f2:	4585                	li	a1,1
    800046f4:	fe843503          	ld	a0,-24(s0)
    800046f8:	00004097          	auipc	ra,0x4
    800046fc:	702080e7          	jalr	1794(ra) # 80008dfa <virtio_disk_rw>
}
    80004700:	0001                	nop
    80004702:	60e2                	ld	ra,24(sp)
    80004704:	6442                	ld	s0,16(sp)
    80004706:	6105                	addi	sp,sp,32
    80004708:	8082                	ret

000000008000470a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    8000470a:	1101                	addi	sp,sp,-32
    8000470c:	ec06                	sd	ra,24(sp)
    8000470e:	e822                	sd	s0,16(sp)
    80004710:	1000                	addi	s0,sp,32
    80004712:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004716:	fe843783          	ld	a5,-24(s0)
    8000471a:	07c1                	addi	a5,a5,16
    8000471c:	853e                	mv	a0,a5
    8000471e:	00002097          	auipc	ra,0x2
    80004722:	eaa080e7          	jalr	-342(ra) # 800065c8 <holdingsleep>
    80004726:	87aa                	mv	a5,a0
    80004728:	eb89                	bnez	a5,8000473a <brelse+0x30>
    panic("brelse");
    8000472a:	00007517          	auipc	a0,0x7
    8000472e:	d1650513          	addi	a0,a0,-746 # 8000b440 <etext+0x440>
    80004732:	ffffc097          	auipc	ra,0xffffc
    80004736:	54c080e7          	jalr	1356(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    8000473a:	fe843783          	ld	a5,-24(s0)
    8000473e:	07c1                	addi	a5,a5,16
    80004740:	853e                	mv	a0,a5
    80004742:	00002097          	auipc	ra,0x2
    80004746:	e34080e7          	jalr	-460(ra) # 80006576 <releasesleep>

  acquire(&bcache.lock);
    8000474a:	00016517          	auipc	a0,0x16
    8000474e:	99650513          	addi	a0,a0,-1642 # 8001a0e0 <bcache>
    80004752:	ffffd097          	auipc	ra,0xffffd
    80004756:	b1c080e7          	jalr	-1252(ra) # 8000126e <acquire>
  b->refcnt--;
    8000475a:	fe843783          	ld	a5,-24(s0)
    8000475e:	43bc                	lw	a5,64(a5)
    80004760:	37fd                	addiw	a5,a5,-1
    80004762:	0007871b          	sext.w	a4,a5
    80004766:	fe843783          	ld	a5,-24(s0)
    8000476a:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    8000476c:	fe843783          	ld	a5,-24(s0)
    80004770:	43bc                	lw	a5,64(a5)
    80004772:	e7b5                	bnez	a5,800047de <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004774:	fe843783          	ld	a5,-24(s0)
    80004778:	6bbc                	ld	a5,80(a5)
    8000477a:	fe843703          	ld	a4,-24(s0)
    8000477e:	6738                	ld	a4,72(a4)
    80004780:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004782:	fe843783          	ld	a5,-24(s0)
    80004786:	67bc                	ld	a5,72(a5)
    80004788:	fe843703          	ld	a4,-24(s0)
    8000478c:	6b38                	ld	a4,80(a4)
    8000478e:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004790:	00016717          	auipc	a4,0x16
    80004794:	95070713          	addi	a4,a4,-1712 # 8001a0e0 <bcache>
    80004798:	67a1                	lui	a5,0x8
    8000479a:	97ba                	add	a5,a5,a4
    8000479c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047a0:	fe843783          	ld	a5,-24(s0)
    800047a4:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    800047a6:	fe843783          	ld	a5,-24(s0)
    800047aa:	0001e717          	auipc	a4,0x1e
    800047ae:	b9e70713          	addi	a4,a4,-1122 # 80022348 <bcache+0x8268>
    800047b2:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    800047b4:	00016717          	auipc	a4,0x16
    800047b8:	92c70713          	addi	a4,a4,-1748 # 8001a0e0 <bcache>
    800047bc:	67a1                	lui	a5,0x8
    800047be:	97ba                	add	a5,a5,a4
    800047c0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047c4:	fe843703          	ld	a4,-24(s0)
    800047c8:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800047ca:	00016717          	auipc	a4,0x16
    800047ce:	91670713          	addi	a4,a4,-1770 # 8001a0e0 <bcache>
    800047d2:	67a1                	lui	a5,0x8
    800047d4:	97ba                	add	a5,a5,a4
    800047d6:	fe843703          	ld	a4,-24(s0)
    800047da:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    800047de:	00016517          	auipc	a0,0x16
    800047e2:	90250513          	addi	a0,a0,-1790 # 8001a0e0 <bcache>
    800047e6:	ffffd097          	auipc	ra,0xffffd
    800047ea:	aec080e7          	jalr	-1300(ra) # 800012d2 <release>
}
    800047ee:	0001                	nop
    800047f0:	60e2                	ld	ra,24(sp)
    800047f2:	6442                	ld	s0,16(sp)
    800047f4:	6105                	addi	sp,sp,32
    800047f6:	8082                	ret

00000000800047f8 <bpin>:

void
bpin(struct buf *b) {
    800047f8:	1101                	addi	sp,sp,-32
    800047fa:	ec06                	sd	ra,24(sp)
    800047fc:	e822                	sd	s0,16(sp)
    800047fe:	1000                	addi	s0,sp,32
    80004800:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004804:	00016517          	auipc	a0,0x16
    80004808:	8dc50513          	addi	a0,a0,-1828 # 8001a0e0 <bcache>
    8000480c:	ffffd097          	auipc	ra,0xffffd
    80004810:	a62080e7          	jalr	-1438(ra) # 8000126e <acquire>
  b->refcnt++;
    80004814:	fe843783          	ld	a5,-24(s0)
    80004818:	43bc                	lw	a5,64(a5)
    8000481a:	2785                	addiw	a5,a5,1
    8000481c:	0007871b          	sext.w	a4,a5
    80004820:	fe843783          	ld	a5,-24(s0)
    80004824:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004826:	00016517          	auipc	a0,0x16
    8000482a:	8ba50513          	addi	a0,a0,-1862 # 8001a0e0 <bcache>
    8000482e:	ffffd097          	auipc	ra,0xffffd
    80004832:	aa4080e7          	jalr	-1372(ra) # 800012d2 <release>
}
    80004836:	0001                	nop
    80004838:	60e2                	ld	ra,24(sp)
    8000483a:	6442                	ld	s0,16(sp)
    8000483c:	6105                	addi	sp,sp,32
    8000483e:	8082                	ret

0000000080004840 <bunpin>:

void
bunpin(struct buf *b) {
    80004840:	1101                	addi	sp,sp,-32
    80004842:	ec06                	sd	ra,24(sp)
    80004844:	e822                	sd	s0,16(sp)
    80004846:	1000                	addi	s0,sp,32
    80004848:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    8000484c:	00016517          	auipc	a0,0x16
    80004850:	89450513          	addi	a0,a0,-1900 # 8001a0e0 <bcache>
    80004854:	ffffd097          	auipc	ra,0xffffd
    80004858:	a1a080e7          	jalr	-1510(ra) # 8000126e <acquire>
  b->refcnt--;
    8000485c:	fe843783          	ld	a5,-24(s0)
    80004860:	43bc                	lw	a5,64(a5)
    80004862:	37fd                	addiw	a5,a5,-1
    80004864:	0007871b          	sext.w	a4,a5
    80004868:	fe843783          	ld	a5,-24(s0)
    8000486c:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    8000486e:	00016517          	auipc	a0,0x16
    80004872:	87250513          	addi	a0,a0,-1934 # 8001a0e0 <bcache>
    80004876:	ffffd097          	auipc	ra,0xffffd
    8000487a:	a5c080e7          	jalr	-1444(ra) # 800012d2 <release>
}
    8000487e:	0001                	nop
    80004880:	60e2                	ld	ra,24(sp)
    80004882:	6442                	ld	s0,16(sp)
    80004884:	6105                	addi	sp,sp,32
    80004886:	8082                	ret

0000000080004888 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004888:	7179                	addi	sp,sp,-48
    8000488a:	f406                	sd	ra,40(sp)
    8000488c:	f022                	sd	s0,32(sp)
    8000488e:	1800                	addi	s0,sp,48
    80004890:	87aa                	mv	a5,a0
    80004892:	fcb43823          	sd	a1,-48(s0)
    80004896:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    8000489a:	fdc42783          	lw	a5,-36(s0)
    8000489e:	4585                	li	a1,1
    800048a0:	853e                	mv	a0,a5
    800048a2:	00000097          	auipc	ra,0x0
    800048a6:	dc6080e7          	jalr	-570(ra) # 80004668 <bread>
    800048aa:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    800048ae:	fe843783          	ld	a5,-24(s0)
    800048b2:	05878793          	addi	a5,a5,88
    800048b6:	02000613          	li	a2,32
    800048ba:	85be                	mv	a1,a5
    800048bc:	fd043503          	ld	a0,-48(s0)
    800048c0:	ffffd097          	auipc	ra,0xffffd
    800048c4:	c66080e7          	jalr	-922(ra) # 80001526 <memmove>
  brelse(bp);
    800048c8:	fe843503          	ld	a0,-24(s0)
    800048cc:	00000097          	auipc	ra,0x0
    800048d0:	e3e080e7          	jalr	-450(ra) # 8000470a <brelse>
}
    800048d4:	0001                	nop
    800048d6:	70a2                	ld	ra,40(sp)
    800048d8:	7402                	ld	s0,32(sp)
    800048da:	6145                	addi	sp,sp,48
    800048dc:	8082                	ret

00000000800048de <fsinit>:

// Init fs
void
fsinit(int dev) {
    800048de:	1101                	addi	sp,sp,-32
    800048e0:	ec06                	sd	ra,24(sp)
    800048e2:	e822                	sd	s0,16(sp)
    800048e4:	1000                	addi	s0,sp,32
    800048e6:	87aa                	mv	a5,a0
    800048e8:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    800048ec:	fec42783          	lw	a5,-20(s0)
    800048f0:	0001e597          	auipc	a1,0x1e
    800048f4:	eb058593          	addi	a1,a1,-336 # 800227a0 <sb>
    800048f8:	853e                	mv	a0,a5
    800048fa:	00000097          	auipc	ra,0x0
    800048fe:	f8e080e7          	jalr	-114(ra) # 80004888 <readsb>
  if(sb.magic != FSMAGIC)
    80004902:	0001e797          	auipc	a5,0x1e
    80004906:	e9e78793          	addi	a5,a5,-354 # 800227a0 <sb>
    8000490a:	439c                	lw	a5,0(a5)
    8000490c:	873e                	mv	a4,a5
    8000490e:	102037b7          	lui	a5,0x10203
    80004912:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004916:	00f70a63          	beq	a4,a5,8000492a <fsinit+0x4c>
    panic("invalid file system");
    8000491a:	00007517          	auipc	a0,0x7
    8000491e:	b2e50513          	addi	a0,a0,-1234 # 8000b448 <etext+0x448>
    80004922:	ffffc097          	auipc	ra,0xffffc
    80004926:	35c080e7          	jalr	860(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    8000492a:	fec42783          	lw	a5,-20(s0)
    8000492e:	0001e597          	auipc	a1,0x1e
    80004932:	e7258593          	addi	a1,a1,-398 # 800227a0 <sb>
    80004936:	853e                	mv	a0,a5
    80004938:	00001097          	auipc	ra,0x1
    8000493c:	468080e7          	jalr	1128(ra) # 80005da0 <initlog>
}
    80004940:	0001                	nop
    80004942:	60e2                	ld	ra,24(sp)
    80004944:	6442                	ld	s0,16(sp)
    80004946:	6105                	addi	sp,sp,32
    80004948:	8082                	ret

000000008000494a <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    8000494a:	7179                	addi	sp,sp,-48
    8000494c:	f406                	sd	ra,40(sp)
    8000494e:	f022                	sd	s0,32(sp)
    80004950:	1800                	addi	s0,sp,48
    80004952:	87aa                	mv	a5,a0
    80004954:	872e                	mv	a4,a1
    80004956:	fcf42e23          	sw	a5,-36(s0)
    8000495a:	87ba                	mv	a5,a4
    8000495c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004960:	fdc42783          	lw	a5,-36(s0)
    80004964:	fd842703          	lw	a4,-40(s0)
    80004968:	85ba                	mv	a1,a4
    8000496a:	853e                	mv	a0,a5
    8000496c:	00000097          	auipc	ra,0x0
    80004970:	cfc080e7          	jalr	-772(ra) # 80004668 <bread>
    80004974:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004978:	fe843783          	ld	a5,-24(s0)
    8000497c:	05878793          	addi	a5,a5,88
    80004980:	40000613          	li	a2,1024
    80004984:	4581                	li	a1,0
    80004986:	853e                	mv	a0,a5
    80004988:	ffffd097          	auipc	ra,0xffffd
    8000498c:	aba080e7          	jalr	-1350(ra) # 80001442 <memset>
  log_write(bp);
    80004990:	fe843503          	ld	a0,-24(s0)
    80004994:	00002097          	auipc	ra,0x2
    80004998:	9f4080e7          	jalr	-1548(ra) # 80006388 <log_write>
  brelse(bp);
    8000499c:	fe843503          	ld	a0,-24(s0)
    800049a0:	00000097          	auipc	ra,0x0
    800049a4:	d6a080e7          	jalr	-662(ra) # 8000470a <brelse>
}
    800049a8:	0001                	nop
    800049aa:	70a2                	ld	ra,40(sp)
    800049ac:	7402                	ld	s0,32(sp)
    800049ae:	6145                	addi	sp,sp,48
    800049b0:	8082                	ret

00000000800049b2 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    800049b2:	7139                	addi	sp,sp,-64
    800049b4:	fc06                	sd	ra,56(sp)
    800049b6:	f822                	sd	s0,48(sp)
    800049b8:	0080                	addi	s0,sp,64
    800049ba:	87aa                	mv	a5,a0
    800049bc:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    800049c0:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    800049c4:	fe042623          	sw	zero,-20(s0)
    800049c8:	a2b5                	j	80004b34 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    800049ca:	fec42783          	lw	a5,-20(s0)
    800049ce:	41f7d71b          	sraiw	a4,a5,0x1f
    800049d2:	0137571b          	srliw	a4,a4,0x13
    800049d6:	9fb9                	addw	a5,a5,a4
    800049d8:	40d7d79b          	sraiw	a5,a5,0xd
    800049dc:	2781                	sext.w	a5,a5
    800049de:	0007871b          	sext.w	a4,a5
    800049e2:	0001e797          	auipc	a5,0x1e
    800049e6:	dbe78793          	addi	a5,a5,-578 # 800227a0 <sb>
    800049ea:	4fdc                	lw	a5,28(a5)
    800049ec:	9fb9                	addw	a5,a5,a4
    800049ee:	0007871b          	sext.w	a4,a5
    800049f2:	fcc42783          	lw	a5,-52(s0)
    800049f6:	85ba                	mv	a1,a4
    800049f8:	853e                	mv	a0,a5
    800049fa:	00000097          	auipc	ra,0x0
    800049fe:	c6e080e7          	jalr	-914(ra) # 80004668 <bread>
    80004a02:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004a06:	fe042423          	sw	zero,-24(s0)
    80004a0a:	a0dd                	j	80004af0 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004a0c:	fe842703          	lw	a4,-24(s0)
    80004a10:	41f7579b          	sraiw	a5,a4,0x1f
    80004a14:	01d7d79b          	srliw	a5,a5,0x1d
    80004a18:	9f3d                	addw	a4,a4,a5
    80004a1a:	8b1d                	andi	a4,a4,7
    80004a1c:	40f707bb          	subw	a5,a4,a5
    80004a20:	2781                	sext.w	a5,a5
    80004a22:	4705                	li	a4,1
    80004a24:	00f717bb          	sllw	a5,a4,a5
    80004a28:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004a2c:	fe842783          	lw	a5,-24(s0)
    80004a30:	41f7d71b          	sraiw	a4,a5,0x1f
    80004a34:	01d7571b          	srliw	a4,a4,0x1d
    80004a38:	9fb9                	addw	a5,a5,a4
    80004a3a:	4037d79b          	sraiw	a5,a5,0x3
    80004a3e:	2781                	sext.w	a5,a5
    80004a40:	fe043703          	ld	a4,-32(s0)
    80004a44:	97ba                	add	a5,a5,a4
    80004a46:	0587c783          	lbu	a5,88(a5)
    80004a4a:	0007871b          	sext.w	a4,a5
    80004a4e:	fdc42783          	lw	a5,-36(s0)
    80004a52:	8ff9                	and	a5,a5,a4
    80004a54:	2781                	sext.w	a5,a5
    80004a56:	ebc1                	bnez	a5,80004ae6 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004a58:	fe842783          	lw	a5,-24(s0)
    80004a5c:	41f7d71b          	sraiw	a4,a5,0x1f
    80004a60:	01d7571b          	srliw	a4,a4,0x1d
    80004a64:	9fb9                	addw	a5,a5,a4
    80004a66:	4037d79b          	sraiw	a5,a5,0x3
    80004a6a:	2781                	sext.w	a5,a5
    80004a6c:	fe043703          	ld	a4,-32(s0)
    80004a70:	973e                	add	a4,a4,a5
    80004a72:	05874703          	lbu	a4,88(a4)
    80004a76:	0187169b          	slliw	a3,a4,0x18
    80004a7a:	4186d69b          	sraiw	a3,a3,0x18
    80004a7e:	fdc42703          	lw	a4,-36(s0)
    80004a82:	0187171b          	slliw	a4,a4,0x18
    80004a86:	4187571b          	sraiw	a4,a4,0x18
    80004a8a:	8f55                	or	a4,a4,a3
    80004a8c:	0187171b          	slliw	a4,a4,0x18
    80004a90:	4187571b          	sraiw	a4,a4,0x18
    80004a94:	0ff77713          	andi	a4,a4,255
    80004a98:	fe043683          	ld	a3,-32(s0)
    80004a9c:	97b6                	add	a5,a5,a3
    80004a9e:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004aa2:	fe043503          	ld	a0,-32(s0)
    80004aa6:	00002097          	auipc	ra,0x2
    80004aaa:	8e2080e7          	jalr	-1822(ra) # 80006388 <log_write>
        brelse(bp);
    80004aae:	fe043503          	ld	a0,-32(s0)
    80004ab2:	00000097          	auipc	ra,0x0
    80004ab6:	c58080e7          	jalr	-936(ra) # 8000470a <brelse>
        bzero(dev, b + bi);
    80004aba:	fcc42683          	lw	a3,-52(s0)
    80004abe:	fec42703          	lw	a4,-20(s0)
    80004ac2:	fe842783          	lw	a5,-24(s0)
    80004ac6:	9fb9                	addw	a5,a5,a4
    80004ac8:	2781                	sext.w	a5,a5
    80004aca:	85be                	mv	a1,a5
    80004acc:	8536                	mv	a0,a3
    80004ace:	00000097          	auipc	ra,0x0
    80004ad2:	e7c080e7          	jalr	-388(ra) # 8000494a <bzero>
        return b + bi;
    80004ad6:	fec42703          	lw	a4,-20(s0)
    80004ada:	fe842783          	lw	a5,-24(s0)
    80004ade:	9fb9                	addw	a5,a5,a4
    80004ae0:	2781                	sext.w	a5,a5
    80004ae2:	2781                	sext.w	a5,a5
    80004ae4:	a88d                	j	80004b56 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004ae6:	fe842783          	lw	a5,-24(s0)
    80004aea:	2785                	addiw	a5,a5,1
    80004aec:	fef42423          	sw	a5,-24(s0)
    80004af0:	fe842783          	lw	a5,-24(s0)
    80004af4:	0007871b          	sext.w	a4,a5
    80004af8:	6789                	lui	a5,0x2
    80004afa:	02f75163          	bge	a4,a5,80004b1c <balloc+0x16a>
    80004afe:	fec42703          	lw	a4,-20(s0)
    80004b02:	fe842783          	lw	a5,-24(s0)
    80004b06:	9fb9                	addw	a5,a5,a4
    80004b08:	2781                	sext.w	a5,a5
    80004b0a:	0007871b          	sext.w	a4,a5
    80004b0e:	0001e797          	auipc	a5,0x1e
    80004b12:	c9278793          	addi	a5,a5,-878 # 800227a0 <sb>
    80004b16:	43dc                	lw	a5,4(a5)
    80004b18:	eef76ae3          	bltu	a4,a5,80004a0c <balloc+0x5a>
      }
    }
    brelse(bp);
    80004b1c:	fe043503          	ld	a0,-32(s0)
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	bea080e7          	jalr	-1046(ra) # 8000470a <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004b28:	fec42703          	lw	a4,-20(s0)
    80004b2c:	6789                	lui	a5,0x2
    80004b2e:	9fb9                	addw	a5,a5,a4
    80004b30:	fef42623          	sw	a5,-20(s0)
    80004b34:	0001e797          	auipc	a5,0x1e
    80004b38:	c6c78793          	addi	a5,a5,-916 # 800227a0 <sb>
    80004b3c:	43d8                	lw	a4,4(a5)
    80004b3e:	fec42783          	lw	a5,-20(s0)
    80004b42:	e8e7e4e3          	bltu	a5,a4,800049ca <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004b46:	00007517          	auipc	a0,0x7
    80004b4a:	91a50513          	addi	a0,a0,-1766 # 8000b460 <etext+0x460>
    80004b4e:	ffffc097          	auipc	ra,0xffffc
    80004b52:	130080e7          	jalr	304(ra) # 80000c7e <panic>
}
    80004b56:	853e                	mv	a0,a5
    80004b58:	70e2                	ld	ra,56(sp)
    80004b5a:	7442                	ld	s0,48(sp)
    80004b5c:	6121                	addi	sp,sp,64
    80004b5e:	8082                	ret

0000000080004b60 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004b60:	7179                	addi	sp,sp,-48
    80004b62:	f406                	sd	ra,40(sp)
    80004b64:	f022                	sd	s0,32(sp)
    80004b66:	1800                	addi	s0,sp,48
    80004b68:	87aa                	mv	a5,a0
    80004b6a:	872e                	mv	a4,a1
    80004b6c:	fcf42e23          	sw	a5,-36(s0)
    80004b70:	87ba                	mv	a5,a4
    80004b72:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004b76:	fdc42683          	lw	a3,-36(s0)
    80004b7a:	fd842783          	lw	a5,-40(s0)
    80004b7e:	00d7d79b          	srliw	a5,a5,0xd
    80004b82:	0007871b          	sext.w	a4,a5
    80004b86:	0001e797          	auipc	a5,0x1e
    80004b8a:	c1a78793          	addi	a5,a5,-998 # 800227a0 <sb>
    80004b8e:	4fdc                	lw	a5,28(a5)
    80004b90:	9fb9                	addw	a5,a5,a4
    80004b92:	2781                	sext.w	a5,a5
    80004b94:	85be                	mv	a1,a5
    80004b96:	8536                	mv	a0,a3
    80004b98:	00000097          	auipc	ra,0x0
    80004b9c:	ad0080e7          	jalr	-1328(ra) # 80004668 <bread>
    80004ba0:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004ba4:	fd842703          	lw	a4,-40(s0)
    80004ba8:	6789                	lui	a5,0x2
    80004baa:	17fd                	addi	a5,a5,-1
    80004bac:	8ff9                	and	a5,a5,a4
    80004bae:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004bb2:	fe442703          	lw	a4,-28(s0)
    80004bb6:	41f7579b          	sraiw	a5,a4,0x1f
    80004bba:	01d7d79b          	srliw	a5,a5,0x1d
    80004bbe:	9f3d                	addw	a4,a4,a5
    80004bc0:	8b1d                	andi	a4,a4,7
    80004bc2:	40f707bb          	subw	a5,a4,a5
    80004bc6:	2781                	sext.w	a5,a5
    80004bc8:	4705                	li	a4,1
    80004bca:	00f717bb          	sllw	a5,a4,a5
    80004bce:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004bd2:	fe442783          	lw	a5,-28(s0)
    80004bd6:	41f7d71b          	sraiw	a4,a5,0x1f
    80004bda:	01d7571b          	srliw	a4,a4,0x1d
    80004bde:	9fb9                	addw	a5,a5,a4
    80004be0:	4037d79b          	sraiw	a5,a5,0x3
    80004be4:	2781                	sext.w	a5,a5
    80004be6:	fe843703          	ld	a4,-24(s0)
    80004bea:	97ba                	add	a5,a5,a4
    80004bec:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004bf0:	0007871b          	sext.w	a4,a5
    80004bf4:	fe042783          	lw	a5,-32(s0)
    80004bf8:	8ff9                	and	a5,a5,a4
    80004bfa:	2781                	sext.w	a5,a5
    80004bfc:	eb89                	bnez	a5,80004c0e <bfree+0xae>
    panic("freeing free block");
    80004bfe:	00007517          	auipc	a0,0x7
    80004c02:	87a50513          	addi	a0,a0,-1926 # 8000b478 <etext+0x478>
    80004c06:	ffffc097          	auipc	ra,0xffffc
    80004c0a:	078080e7          	jalr	120(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    80004c0e:	fe442783          	lw	a5,-28(s0)
    80004c12:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c16:	01d7571b          	srliw	a4,a4,0x1d
    80004c1a:	9fb9                	addw	a5,a5,a4
    80004c1c:	4037d79b          	sraiw	a5,a5,0x3
    80004c20:	2781                	sext.w	a5,a5
    80004c22:	fe843703          	ld	a4,-24(s0)
    80004c26:	973e                	add	a4,a4,a5
    80004c28:	05874703          	lbu	a4,88(a4)
    80004c2c:	0187169b          	slliw	a3,a4,0x18
    80004c30:	4186d69b          	sraiw	a3,a3,0x18
    80004c34:	fe042703          	lw	a4,-32(s0)
    80004c38:	0187171b          	slliw	a4,a4,0x18
    80004c3c:	4187571b          	sraiw	a4,a4,0x18
    80004c40:	fff74713          	not	a4,a4
    80004c44:	0187171b          	slliw	a4,a4,0x18
    80004c48:	4187571b          	sraiw	a4,a4,0x18
    80004c4c:	8f75                	and	a4,a4,a3
    80004c4e:	0187171b          	slliw	a4,a4,0x18
    80004c52:	4187571b          	sraiw	a4,a4,0x18
    80004c56:	0ff77713          	andi	a4,a4,255
    80004c5a:	fe843683          	ld	a3,-24(s0)
    80004c5e:	97b6                	add	a5,a5,a3
    80004c60:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004c64:	fe843503          	ld	a0,-24(s0)
    80004c68:	00001097          	auipc	ra,0x1
    80004c6c:	720080e7          	jalr	1824(ra) # 80006388 <log_write>
  brelse(bp);
    80004c70:	fe843503          	ld	a0,-24(s0)
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	a96080e7          	jalr	-1386(ra) # 8000470a <brelse>
}
    80004c7c:	0001                	nop
    80004c7e:	70a2                	ld	ra,40(sp)
    80004c80:	7402                	ld	s0,32(sp)
    80004c82:	6145                	addi	sp,sp,48
    80004c84:	8082                	ret

0000000080004c86 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004c86:	1101                	addi	sp,sp,-32
    80004c88:	ec06                	sd	ra,24(sp)
    80004c8a:	e822                	sd	s0,16(sp)
    80004c8c:	1000                	addi	s0,sp,32
  int i = 0;
    80004c8e:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004c92:	00006597          	auipc	a1,0x6
    80004c96:	7fe58593          	addi	a1,a1,2046 # 8000b490 <etext+0x490>
    80004c9a:	0001e517          	auipc	a0,0x1e
    80004c9e:	b2650513          	addi	a0,a0,-1242 # 800227c0 <itable>
    80004ca2:	ffffc097          	auipc	ra,0xffffc
    80004ca6:	59c080e7          	jalr	1436(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    80004caa:	fe042623          	sw	zero,-20(s0)
    80004cae:	a82d                	j	80004ce8 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004cb0:	fec42703          	lw	a4,-20(s0)
    80004cb4:	87ba                	mv	a5,a4
    80004cb6:	0792                	slli	a5,a5,0x4
    80004cb8:	97ba                	add	a5,a5,a4
    80004cba:	078e                	slli	a5,a5,0x3
    80004cbc:	02078713          	addi	a4,a5,32
    80004cc0:	0001e797          	auipc	a5,0x1e
    80004cc4:	b0078793          	addi	a5,a5,-1280 # 800227c0 <itable>
    80004cc8:	97ba                	add	a5,a5,a4
    80004cca:	07a1                	addi	a5,a5,8
    80004ccc:	00006597          	auipc	a1,0x6
    80004cd0:	7cc58593          	addi	a1,a1,1996 # 8000b498 <etext+0x498>
    80004cd4:	853e                	mv	a0,a5
    80004cd6:	00001097          	auipc	ra,0x1
    80004cda:	7e6080e7          	jalr	2022(ra) # 800064bc <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004cde:	fec42783          	lw	a5,-20(s0)
    80004ce2:	2785                	addiw	a5,a5,1
    80004ce4:	fef42623          	sw	a5,-20(s0)
    80004ce8:	fec42783          	lw	a5,-20(s0)
    80004cec:	0007871b          	sext.w	a4,a5
    80004cf0:	03100793          	li	a5,49
    80004cf4:	fae7dee3          	bge	a5,a4,80004cb0 <iinit+0x2a>
  }
}
    80004cf8:	0001                	nop
    80004cfa:	0001                	nop
    80004cfc:	60e2                	ld	ra,24(sp)
    80004cfe:	6442                	ld	s0,16(sp)
    80004d00:	6105                	addi	sp,sp,32
    80004d02:	8082                	ret

0000000080004d04 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80004d04:	7139                	addi	sp,sp,-64
    80004d06:	fc06                	sd	ra,56(sp)
    80004d08:	f822                	sd	s0,48(sp)
    80004d0a:	0080                	addi	s0,sp,64
    80004d0c:	87aa                	mv	a5,a0
    80004d0e:	872e                	mv	a4,a1
    80004d10:	fcf42623          	sw	a5,-52(s0)
    80004d14:	87ba                	mv	a5,a4
    80004d16:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004d1a:	4785                	li	a5,1
    80004d1c:	fef42623          	sw	a5,-20(s0)
    80004d20:	a855                	j	80004dd4 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004d22:	fec42783          	lw	a5,-20(s0)
    80004d26:	8391                	srli	a5,a5,0x4
    80004d28:	0007871b          	sext.w	a4,a5
    80004d2c:	0001e797          	auipc	a5,0x1e
    80004d30:	a7478793          	addi	a5,a5,-1420 # 800227a0 <sb>
    80004d34:	4f9c                	lw	a5,24(a5)
    80004d36:	9fb9                	addw	a5,a5,a4
    80004d38:	0007871b          	sext.w	a4,a5
    80004d3c:	fcc42783          	lw	a5,-52(s0)
    80004d40:	85ba                	mv	a1,a4
    80004d42:	853e                	mv	a0,a5
    80004d44:	00000097          	auipc	ra,0x0
    80004d48:	924080e7          	jalr	-1756(ra) # 80004668 <bread>
    80004d4c:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004d50:	fe043783          	ld	a5,-32(s0)
    80004d54:	05878713          	addi	a4,a5,88
    80004d58:	fec42783          	lw	a5,-20(s0)
    80004d5c:	8bbd                	andi	a5,a5,15
    80004d5e:	079a                	slli	a5,a5,0x6
    80004d60:	97ba                	add	a5,a5,a4
    80004d62:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004d66:	fd843783          	ld	a5,-40(s0)
    80004d6a:	00079783          	lh	a5,0(a5)
    80004d6e:	eba1                	bnez	a5,80004dbe <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004d70:	04000613          	li	a2,64
    80004d74:	4581                	li	a1,0
    80004d76:	fd843503          	ld	a0,-40(s0)
    80004d7a:	ffffc097          	auipc	ra,0xffffc
    80004d7e:	6c8080e7          	jalr	1736(ra) # 80001442 <memset>
      dip->type = type;
    80004d82:	fd843783          	ld	a5,-40(s0)
    80004d86:	fca45703          	lhu	a4,-54(s0)
    80004d8a:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004d8e:	fe043503          	ld	a0,-32(s0)
    80004d92:	00001097          	auipc	ra,0x1
    80004d96:	5f6080e7          	jalr	1526(ra) # 80006388 <log_write>
      brelse(bp);
    80004d9a:	fe043503          	ld	a0,-32(s0)
    80004d9e:	00000097          	auipc	ra,0x0
    80004da2:	96c080e7          	jalr	-1684(ra) # 8000470a <brelse>
      return iget(dev, inum);
    80004da6:	fec42703          	lw	a4,-20(s0)
    80004daa:	fcc42783          	lw	a5,-52(s0)
    80004dae:	85ba                	mv	a1,a4
    80004db0:	853e                	mv	a0,a5
    80004db2:	00000097          	auipc	ra,0x0
    80004db6:	136080e7          	jalr	310(ra) # 80004ee8 <iget>
    80004dba:	87aa                	mv	a5,a0
    80004dbc:	a82d                	j	80004df6 <ialloc+0xf2>
    }
    brelse(bp);
    80004dbe:	fe043503          	ld	a0,-32(s0)
    80004dc2:	00000097          	auipc	ra,0x0
    80004dc6:	948080e7          	jalr	-1720(ra) # 8000470a <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80004dca:	fec42783          	lw	a5,-20(s0)
    80004dce:	2785                	addiw	a5,a5,1
    80004dd0:	fef42623          	sw	a5,-20(s0)
    80004dd4:	0001e797          	auipc	a5,0x1e
    80004dd8:	9cc78793          	addi	a5,a5,-1588 # 800227a0 <sb>
    80004ddc:	47d8                	lw	a4,12(a5)
    80004dde:	fec42783          	lw	a5,-20(s0)
    80004de2:	f4e7e0e3          	bltu	a5,a4,80004d22 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    80004de6:	00006517          	auipc	a0,0x6
    80004dea:	6ba50513          	addi	a0,a0,1722 # 8000b4a0 <etext+0x4a0>
    80004dee:	ffffc097          	auipc	ra,0xffffc
    80004df2:	e90080e7          	jalr	-368(ra) # 80000c7e <panic>
}
    80004df6:	853e                	mv	a0,a5
    80004df8:	70e2                	ld	ra,56(sp)
    80004dfa:	7442                	ld	s0,48(sp)
    80004dfc:	6121                	addi	sp,sp,64
    80004dfe:	8082                	ret

0000000080004e00 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80004e00:	7179                	addi	sp,sp,-48
    80004e02:	f406                	sd	ra,40(sp)
    80004e04:	f022                	sd	s0,32(sp)
    80004e06:	1800                	addi	s0,sp,48
    80004e08:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80004e0c:	fd843783          	ld	a5,-40(s0)
    80004e10:	4394                	lw	a3,0(a5)
    80004e12:	fd843783          	ld	a5,-40(s0)
    80004e16:	43dc                	lw	a5,4(a5)
    80004e18:	0047d79b          	srliw	a5,a5,0x4
    80004e1c:	0007871b          	sext.w	a4,a5
    80004e20:	0001e797          	auipc	a5,0x1e
    80004e24:	98078793          	addi	a5,a5,-1664 # 800227a0 <sb>
    80004e28:	4f9c                	lw	a5,24(a5)
    80004e2a:	9fb9                	addw	a5,a5,a4
    80004e2c:	2781                	sext.w	a5,a5
    80004e2e:	85be                	mv	a1,a5
    80004e30:	8536                	mv	a0,a3
    80004e32:	00000097          	auipc	ra,0x0
    80004e36:	836080e7          	jalr	-1994(ra) # 80004668 <bread>
    80004e3a:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80004e3e:	fe843783          	ld	a5,-24(s0)
    80004e42:	05878713          	addi	a4,a5,88
    80004e46:	fd843783          	ld	a5,-40(s0)
    80004e4a:	43dc                	lw	a5,4(a5)
    80004e4c:	1782                	slli	a5,a5,0x20
    80004e4e:	9381                	srli	a5,a5,0x20
    80004e50:	8bbd                	andi	a5,a5,15
    80004e52:	079a                	slli	a5,a5,0x6
    80004e54:	97ba                	add	a5,a5,a4
    80004e56:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80004e5a:	fd843783          	ld	a5,-40(s0)
    80004e5e:	04479703          	lh	a4,68(a5)
    80004e62:	fe043783          	ld	a5,-32(s0)
    80004e66:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80004e6a:	fd843783          	ld	a5,-40(s0)
    80004e6e:	04679703          	lh	a4,70(a5)
    80004e72:	fe043783          	ld	a5,-32(s0)
    80004e76:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80004e7a:	fd843783          	ld	a5,-40(s0)
    80004e7e:	04879703          	lh	a4,72(a5)
    80004e82:	fe043783          	ld	a5,-32(s0)
    80004e86:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80004e8a:	fd843783          	ld	a5,-40(s0)
    80004e8e:	04a79703          	lh	a4,74(a5)
    80004e92:	fe043783          	ld	a5,-32(s0)
    80004e96:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80004e9a:	fd843783          	ld	a5,-40(s0)
    80004e9e:	47f8                	lw	a4,76(a5)
    80004ea0:	fe043783          	ld	a5,-32(s0)
    80004ea4:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80004ea6:	fe043783          	ld	a5,-32(s0)
    80004eaa:	00c78713          	addi	a4,a5,12
    80004eae:	fd843783          	ld	a5,-40(s0)
    80004eb2:	05078793          	addi	a5,a5,80
    80004eb6:	03400613          	li	a2,52
    80004eba:	85be                	mv	a1,a5
    80004ebc:	853a                	mv	a0,a4
    80004ebe:	ffffc097          	auipc	ra,0xffffc
    80004ec2:	668080e7          	jalr	1640(ra) # 80001526 <memmove>
  log_write(bp);
    80004ec6:	fe843503          	ld	a0,-24(s0)
    80004eca:	00001097          	auipc	ra,0x1
    80004ece:	4be080e7          	jalr	1214(ra) # 80006388 <log_write>
  brelse(bp);
    80004ed2:	fe843503          	ld	a0,-24(s0)
    80004ed6:	00000097          	auipc	ra,0x0
    80004eda:	834080e7          	jalr	-1996(ra) # 8000470a <brelse>
}
    80004ede:	0001                	nop
    80004ee0:	70a2                	ld	ra,40(sp)
    80004ee2:	7402                	ld	s0,32(sp)
    80004ee4:	6145                	addi	sp,sp,48
    80004ee6:	8082                	ret

0000000080004ee8 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80004ee8:	7179                	addi	sp,sp,-48
    80004eea:	f406                	sd	ra,40(sp)
    80004eec:	f022                	sd	s0,32(sp)
    80004eee:	1800                	addi	s0,sp,48
    80004ef0:	87aa                	mv	a5,a0
    80004ef2:	872e                	mv	a4,a1
    80004ef4:	fcf42e23          	sw	a5,-36(s0)
    80004ef8:	87ba                	mv	a5,a4
    80004efa:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80004efe:	0001e517          	auipc	a0,0x1e
    80004f02:	8c250513          	addi	a0,a0,-1854 # 800227c0 <itable>
    80004f06:	ffffc097          	auipc	ra,0xffffc
    80004f0a:	368080e7          	jalr	872(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    80004f0e:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80004f12:	0001e797          	auipc	a5,0x1e
    80004f16:	8c678793          	addi	a5,a5,-1850 # 800227d8 <itable+0x18>
    80004f1a:	fef43423          	sd	a5,-24(s0)
    80004f1e:	a89d                	j	80004f94 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80004f20:	fe843783          	ld	a5,-24(s0)
    80004f24:	479c                	lw	a5,8(a5)
    80004f26:	04f05663          	blez	a5,80004f72 <iget+0x8a>
    80004f2a:	fe843783          	ld	a5,-24(s0)
    80004f2e:	4398                	lw	a4,0(a5)
    80004f30:	fdc42783          	lw	a5,-36(s0)
    80004f34:	2781                	sext.w	a5,a5
    80004f36:	02e79e63          	bne	a5,a4,80004f72 <iget+0x8a>
    80004f3a:	fe843783          	ld	a5,-24(s0)
    80004f3e:	43d8                	lw	a4,4(a5)
    80004f40:	fd842783          	lw	a5,-40(s0)
    80004f44:	2781                	sext.w	a5,a5
    80004f46:	02e79663          	bne	a5,a4,80004f72 <iget+0x8a>
      ip->ref++;
    80004f4a:	fe843783          	ld	a5,-24(s0)
    80004f4e:	479c                	lw	a5,8(a5)
    80004f50:	2785                	addiw	a5,a5,1
    80004f52:	0007871b          	sext.w	a4,a5
    80004f56:	fe843783          	ld	a5,-24(s0)
    80004f5a:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80004f5c:	0001e517          	auipc	a0,0x1e
    80004f60:	86450513          	addi	a0,a0,-1948 # 800227c0 <itable>
    80004f64:	ffffc097          	auipc	ra,0xffffc
    80004f68:	36e080e7          	jalr	878(ra) # 800012d2 <release>
      return ip;
    80004f6c:	fe843783          	ld	a5,-24(s0)
    80004f70:	a069                	j	80004ffa <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80004f72:	fe043783          	ld	a5,-32(s0)
    80004f76:	eb89                	bnez	a5,80004f88 <iget+0xa0>
    80004f78:	fe843783          	ld	a5,-24(s0)
    80004f7c:	479c                	lw	a5,8(a5)
    80004f7e:	e789                	bnez	a5,80004f88 <iget+0xa0>
      empty = ip;
    80004f80:	fe843783          	ld	a5,-24(s0)
    80004f84:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80004f88:	fe843783          	ld	a5,-24(s0)
    80004f8c:	08878793          	addi	a5,a5,136
    80004f90:	fef43423          	sd	a5,-24(s0)
    80004f94:	fe843703          	ld	a4,-24(s0)
    80004f98:	0001f797          	auipc	a5,0x1f
    80004f9c:	2d078793          	addi	a5,a5,720 # 80024268 <log>
    80004fa0:	f8f760e3          	bltu	a4,a5,80004f20 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80004fa4:	fe043783          	ld	a5,-32(s0)
    80004fa8:	eb89                	bnez	a5,80004fba <iget+0xd2>
    panic("iget: no inodes");
    80004faa:	00006517          	auipc	a0,0x6
    80004fae:	50e50513          	addi	a0,a0,1294 # 8000b4b8 <etext+0x4b8>
    80004fb2:	ffffc097          	auipc	ra,0xffffc
    80004fb6:	ccc080e7          	jalr	-820(ra) # 80000c7e <panic>

  ip = empty;
    80004fba:	fe043783          	ld	a5,-32(s0)
    80004fbe:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80004fc2:	fe843783          	ld	a5,-24(s0)
    80004fc6:	fdc42703          	lw	a4,-36(s0)
    80004fca:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80004fcc:	fe843783          	ld	a5,-24(s0)
    80004fd0:	fd842703          	lw	a4,-40(s0)
    80004fd4:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80004fd6:	fe843783          	ld	a5,-24(s0)
    80004fda:	4705                	li	a4,1
    80004fdc:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80004fde:	fe843783          	ld	a5,-24(s0)
    80004fe2:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80004fe6:	0001d517          	auipc	a0,0x1d
    80004fea:	7da50513          	addi	a0,a0,2010 # 800227c0 <itable>
    80004fee:	ffffc097          	auipc	ra,0xffffc
    80004ff2:	2e4080e7          	jalr	740(ra) # 800012d2 <release>

  return ip;
    80004ff6:	fe843783          	ld	a5,-24(s0)
}
    80004ffa:	853e                	mv	a0,a5
    80004ffc:	70a2                	ld	ra,40(sp)
    80004ffe:	7402                	ld	s0,32(sp)
    80005000:	6145                	addi	sp,sp,48
    80005002:	8082                	ret

0000000080005004 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005004:	1101                	addi	sp,sp,-32
    80005006:	ec06                	sd	ra,24(sp)
    80005008:	e822                	sd	s0,16(sp)
    8000500a:	1000                	addi	s0,sp,32
    8000500c:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005010:	0001d517          	auipc	a0,0x1d
    80005014:	7b050513          	addi	a0,a0,1968 # 800227c0 <itable>
    80005018:	ffffc097          	auipc	ra,0xffffc
    8000501c:	256080e7          	jalr	598(ra) # 8000126e <acquire>
  ip->ref++;
    80005020:	fe843783          	ld	a5,-24(s0)
    80005024:	479c                	lw	a5,8(a5)
    80005026:	2785                	addiw	a5,a5,1
    80005028:	0007871b          	sext.w	a4,a5
    8000502c:	fe843783          	ld	a5,-24(s0)
    80005030:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005032:	0001d517          	auipc	a0,0x1d
    80005036:	78e50513          	addi	a0,a0,1934 # 800227c0 <itable>
    8000503a:	ffffc097          	auipc	ra,0xffffc
    8000503e:	298080e7          	jalr	664(ra) # 800012d2 <release>
  return ip;
    80005042:	fe843783          	ld	a5,-24(s0)
}
    80005046:	853e                	mv	a0,a5
    80005048:	60e2                	ld	ra,24(sp)
    8000504a:	6442                	ld	s0,16(sp)
    8000504c:	6105                	addi	sp,sp,32
    8000504e:	8082                	ret

0000000080005050 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005050:	7179                	addi	sp,sp,-48
    80005052:	f406                	sd	ra,40(sp)
    80005054:	f022                	sd	s0,32(sp)
    80005056:	1800                	addi	s0,sp,48
    80005058:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000505c:	fd843783          	ld	a5,-40(s0)
    80005060:	c791                	beqz	a5,8000506c <ilock+0x1c>
    80005062:	fd843783          	ld	a5,-40(s0)
    80005066:	479c                	lw	a5,8(a5)
    80005068:	00f04a63          	bgtz	a5,8000507c <ilock+0x2c>
    panic("ilock");
    8000506c:	00006517          	auipc	a0,0x6
    80005070:	45c50513          	addi	a0,a0,1116 # 8000b4c8 <etext+0x4c8>
    80005074:	ffffc097          	auipc	ra,0xffffc
    80005078:	c0a080e7          	jalr	-1014(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    8000507c:	fd843783          	ld	a5,-40(s0)
    80005080:	07c1                	addi	a5,a5,16
    80005082:	853e                	mv	a0,a5
    80005084:	00001097          	auipc	ra,0x1
    80005088:	484080e7          	jalr	1156(ra) # 80006508 <acquiresleep>

  if(ip->valid == 0){
    8000508c:	fd843783          	ld	a5,-40(s0)
    80005090:	43bc                	lw	a5,64(a5)
    80005092:	e7e5                	bnez	a5,8000517a <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005094:	fd843783          	ld	a5,-40(s0)
    80005098:	4394                	lw	a3,0(a5)
    8000509a:	fd843783          	ld	a5,-40(s0)
    8000509e:	43dc                	lw	a5,4(a5)
    800050a0:	0047d79b          	srliw	a5,a5,0x4
    800050a4:	0007871b          	sext.w	a4,a5
    800050a8:	0001d797          	auipc	a5,0x1d
    800050ac:	6f878793          	addi	a5,a5,1784 # 800227a0 <sb>
    800050b0:	4f9c                	lw	a5,24(a5)
    800050b2:	9fb9                	addw	a5,a5,a4
    800050b4:	2781                	sext.w	a5,a5
    800050b6:	85be                	mv	a1,a5
    800050b8:	8536                	mv	a0,a3
    800050ba:	fffff097          	auipc	ra,0xfffff
    800050be:	5ae080e7          	jalr	1454(ra) # 80004668 <bread>
    800050c2:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    800050c6:	fe843783          	ld	a5,-24(s0)
    800050ca:	05878713          	addi	a4,a5,88
    800050ce:	fd843783          	ld	a5,-40(s0)
    800050d2:	43dc                	lw	a5,4(a5)
    800050d4:	1782                	slli	a5,a5,0x20
    800050d6:	9381                	srli	a5,a5,0x20
    800050d8:	8bbd                	andi	a5,a5,15
    800050da:	079a                	slli	a5,a5,0x6
    800050dc:	97ba                	add	a5,a5,a4
    800050de:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800050e2:	fe043783          	ld	a5,-32(s0)
    800050e6:	00079703          	lh	a4,0(a5)
    800050ea:	fd843783          	ld	a5,-40(s0)
    800050ee:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800050f2:	fe043783          	ld	a5,-32(s0)
    800050f6:	00279703          	lh	a4,2(a5)
    800050fa:	fd843783          	ld	a5,-40(s0)
    800050fe:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005102:	fe043783          	ld	a5,-32(s0)
    80005106:	00479703          	lh	a4,4(a5)
    8000510a:	fd843783          	ld	a5,-40(s0)
    8000510e:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    80005112:	fe043783          	ld	a5,-32(s0)
    80005116:	00679703          	lh	a4,6(a5)
    8000511a:	fd843783          	ld	a5,-40(s0)
    8000511e:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    80005122:	fe043783          	ld	a5,-32(s0)
    80005126:	4798                	lw	a4,8(a5)
    80005128:	fd843783          	ld	a5,-40(s0)
    8000512c:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    8000512e:	fd843783          	ld	a5,-40(s0)
    80005132:	05078713          	addi	a4,a5,80
    80005136:	fe043783          	ld	a5,-32(s0)
    8000513a:	07b1                	addi	a5,a5,12
    8000513c:	03400613          	li	a2,52
    80005140:	85be                	mv	a1,a5
    80005142:	853a                	mv	a0,a4
    80005144:	ffffc097          	auipc	ra,0xffffc
    80005148:	3e2080e7          	jalr	994(ra) # 80001526 <memmove>
    brelse(bp);
    8000514c:	fe843503          	ld	a0,-24(s0)
    80005150:	fffff097          	auipc	ra,0xfffff
    80005154:	5ba080e7          	jalr	1466(ra) # 8000470a <brelse>
    ip->valid = 1;
    80005158:	fd843783          	ld	a5,-40(s0)
    8000515c:	4705                	li	a4,1
    8000515e:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005160:	fd843783          	ld	a5,-40(s0)
    80005164:	04479783          	lh	a5,68(a5)
    80005168:	eb89                	bnez	a5,8000517a <ilock+0x12a>
      panic("ilock: no type");
    8000516a:	00006517          	auipc	a0,0x6
    8000516e:	36650513          	addi	a0,a0,870 # 8000b4d0 <etext+0x4d0>
    80005172:	ffffc097          	auipc	ra,0xffffc
    80005176:	b0c080e7          	jalr	-1268(ra) # 80000c7e <panic>
  }
}
    8000517a:	0001                	nop
    8000517c:	70a2                	ld	ra,40(sp)
    8000517e:	7402                	ld	s0,32(sp)
    80005180:	6145                	addi	sp,sp,48
    80005182:	8082                	ret

0000000080005184 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005184:	1101                	addi	sp,sp,-32
    80005186:	ec06                	sd	ra,24(sp)
    80005188:	e822                	sd	s0,16(sp)
    8000518a:	1000                	addi	s0,sp,32
    8000518c:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005190:	fe843783          	ld	a5,-24(s0)
    80005194:	c385                	beqz	a5,800051b4 <iunlock+0x30>
    80005196:	fe843783          	ld	a5,-24(s0)
    8000519a:	07c1                	addi	a5,a5,16
    8000519c:	853e                	mv	a0,a5
    8000519e:	00001097          	auipc	ra,0x1
    800051a2:	42a080e7          	jalr	1066(ra) # 800065c8 <holdingsleep>
    800051a6:	87aa                	mv	a5,a0
    800051a8:	c791                	beqz	a5,800051b4 <iunlock+0x30>
    800051aa:	fe843783          	ld	a5,-24(s0)
    800051ae:	479c                	lw	a5,8(a5)
    800051b0:	00f04a63          	bgtz	a5,800051c4 <iunlock+0x40>
    panic("iunlock");
    800051b4:	00006517          	auipc	a0,0x6
    800051b8:	32c50513          	addi	a0,a0,812 # 8000b4e0 <etext+0x4e0>
    800051bc:	ffffc097          	auipc	ra,0xffffc
    800051c0:	ac2080e7          	jalr	-1342(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    800051c4:	fe843783          	ld	a5,-24(s0)
    800051c8:	07c1                	addi	a5,a5,16
    800051ca:	853e                	mv	a0,a5
    800051cc:	00001097          	auipc	ra,0x1
    800051d0:	3aa080e7          	jalr	938(ra) # 80006576 <releasesleep>
}
    800051d4:	0001                	nop
    800051d6:	60e2                	ld	ra,24(sp)
    800051d8:	6442                	ld	s0,16(sp)
    800051da:	6105                	addi	sp,sp,32
    800051dc:	8082                	ret

00000000800051de <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800051de:	1101                	addi	sp,sp,-32
    800051e0:	ec06                	sd	ra,24(sp)
    800051e2:	e822                	sd	s0,16(sp)
    800051e4:	1000                	addi	s0,sp,32
    800051e6:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800051ea:	0001d517          	auipc	a0,0x1d
    800051ee:	5d650513          	addi	a0,a0,1494 # 800227c0 <itable>
    800051f2:	ffffc097          	auipc	ra,0xffffc
    800051f6:	07c080e7          	jalr	124(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800051fa:	fe843783          	ld	a5,-24(s0)
    800051fe:	479c                	lw	a5,8(a5)
    80005200:	873e                	mv	a4,a5
    80005202:	4785                	li	a5,1
    80005204:	06f71f63          	bne	a4,a5,80005282 <iput+0xa4>
    80005208:	fe843783          	ld	a5,-24(s0)
    8000520c:	43bc                	lw	a5,64(a5)
    8000520e:	cbb5                	beqz	a5,80005282 <iput+0xa4>
    80005210:	fe843783          	ld	a5,-24(s0)
    80005214:	04a79783          	lh	a5,74(a5)
    80005218:	e7ad                	bnez	a5,80005282 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    8000521a:	fe843783          	ld	a5,-24(s0)
    8000521e:	07c1                	addi	a5,a5,16
    80005220:	853e                	mv	a0,a5
    80005222:	00001097          	auipc	ra,0x1
    80005226:	2e6080e7          	jalr	742(ra) # 80006508 <acquiresleep>

    release(&itable.lock);
    8000522a:	0001d517          	auipc	a0,0x1d
    8000522e:	59650513          	addi	a0,a0,1430 # 800227c0 <itable>
    80005232:	ffffc097          	auipc	ra,0xffffc
    80005236:	0a0080e7          	jalr	160(ra) # 800012d2 <release>

    itrunc(ip);
    8000523a:	fe843503          	ld	a0,-24(s0)
    8000523e:	00000097          	auipc	ra,0x0
    80005242:	1fa080e7          	jalr	506(ra) # 80005438 <itrunc>
    ip->type = 0;
    80005246:	fe843783          	ld	a5,-24(s0)
    8000524a:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    8000524e:	fe843503          	ld	a0,-24(s0)
    80005252:	00000097          	auipc	ra,0x0
    80005256:	bae080e7          	jalr	-1106(ra) # 80004e00 <iupdate>
    ip->valid = 0;
    8000525a:	fe843783          	ld	a5,-24(s0)
    8000525e:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005262:	fe843783          	ld	a5,-24(s0)
    80005266:	07c1                	addi	a5,a5,16
    80005268:	853e                	mv	a0,a5
    8000526a:	00001097          	auipc	ra,0x1
    8000526e:	30c080e7          	jalr	780(ra) # 80006576 <releasesleep>

    acquire(&itable.lock);
    80005272:	0001d517          	auipc	a0,0x1d
    80005276:	54e50513          	addi	a0,a0,1358 # 800227c0 <itable>
    8000527a:	ffffc097          	auipc	ra,0xffffc
    8000527e:	ff4080e7          	jalr	-12(ra) # 8000126e <acquire>
  }

  ip->ref--;
    80005282:	fe843783          	ld	a5,-24(s0)
    80005286:	479c                	lw	a5,8(a5)
    80005288:	37fd                	addiw	a5,a5,-1
    8000528a:	0007871b          	sext.w	a4,a5
    8000528e:	fe843783          	ld	a5,-24(s0)
    80005292:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005294:	0001d517          	auipc	a0,0x1d
    80005298:	52c50513          	addi	a0,a0,1324 # 800227c0 <itable>
    8000529c:	ffffc097          	auipc	ra,0xffffc
    800052a0:	036080e7          	jalr	54(ra) # 800012d2 <release>
}
    800052a4:	0001                	nop
    800052a6:	60e2                	ld	ra,24(sp)
    800052a8:	6442                	ld	s0,16(sp)
    800052aa:	6105                	addi	sp,sp,32
    800052ac:	8082                	ret

00000000800052ae <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    800052ae:	1101                	addi	sp,sp,-32
    800052b0:	ec06                	sd	ra,24(sp)
    800052b2:	e822                	sd	s0,16(sp)
    800052b4:	1000                	addi	s0,sp,32
    800052b6:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    800052ba:	fe843503          	ld	a0,-24(s0)
    800052be:	00000097          	auipc	ra,0x0
    800052c2:	ec6080e7          	jalr	-314(ra) # 80005184 <iunlock>
  iput(ip);
    800052c6:	fe843503          	ld	a0,-24(s0)
    800052ca:	00000097          	auipc	ra,0x0
    800052ce:	f14080e7          	jalr	-236(ra) # 800051de <iput>
}
    800052d2:	0001                	nop
    800052d4:	60e2                	ld	ra,24(sp)
    800052d6:	6442                	ld	s0,16(sp)
    800052d8:	6105                	addi	sp,sp,32
    800052da:	8082                	ret

00000000800052dc <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    800052dc:	7139                	addi	sp,sp,-64
    800052de:	fc06                	sd	ra,56(sp)
    800052e0:	f822                	sd	s0,48(sp)
    800052e2:	0080                	addi	s0,sp,64
    800052e4:	fca43423          	sd	a0,-56(s0)
    800052e8:	87ae                	mv	a5,a1
    800052ea:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800052ee:	fc442783          	lw	a5,-60(s0)
    800052f2:	0007871b          	sext.w	a4,a5
    800052f6:	47ad                	li	a5,11
    800052f8:	04e7e863          	bltu	a5,a4,80005348 <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    800052fc:	fc843703          	ld	a4,-56(s0)
    80005300:	fc446783          	lwu	a5,-60(s0)
    80005304:	07d1                	addi	a5,a5,20
    80005306:	078a                	slli	a5,a5,0x2
    80005308:	97ba                	add	a5,a5,a4
    8000530a:	439c                	lw	a5,0(a5)
    8000530c:	fef42623          	sw	a5,-20(s0)
    80005310:	fec42783          	lw	a5,-20(s0)
    80005314:	2781                	sext.w	a5,a5
    80005316:	e795                	bnez	a5,80005342 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    80005318:	fc843783          	ld	a5,-56(s0)
    8000531c:	439c                	lw	a5,0(a5)
    8000531e:	853e                	mv	a0,a5
    80005320:	fffff097          	auipc	ra,0xfffff
    80005324:	692080e7          	jalr	1682(ra) # 800049b2 <balloc>
    80005328:	87aa                	mv	a5,a0
    8000532a:	fef42623          	sw	a5,-20(s0)
    8000532e:	fc843703          	ld	a4,-56(s0)
    80005332:	fc446783          	lwu	a5,-60(s0)
    80005336:	07d1                	addi	a5,a5,20
    80005338:	078a                	slli	a5,a5,0x2
    8000533a:	97ba                	add	a5,a5,a4
    8000533c:	fec42703          	lw	a4,-20(s0)
    80005340:	c398                	sw	a4,0(a5)
    return addr;
    80005342:	fec42783          	lw	a5,-20(s0)
    80005346:	a0e5                	j	8000542e <bmap+0x152>
  }
  bn -= NDIRECT;
    80005348:	fc442783          	lw	a5,-60(s0)
    8000534c:	37d1                	addiw	a5,a5,-12
    8000534e:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005352:	fc442783          	lw	a5,-60(s0)
    80005356:	0007871b          	sext.w	a4,a5
    8000535a:	0ff00793          	li	a5,255
    8000535e:	0ce7e063          	bltu	a5,a4,8000541e <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80005362:	fc843783          	ld	a5,-56(s0)
    80005366:	0807a783          	lw	a5,128(a5)
    8000536a:	fef42623          	sw	a5,-20(s0)
    8000536e:	fec42783          	lw	a5,-20(s0)
    80005372:	2781                	sext.w	a5,a5
    80005374:	e395                	bnez	a5,80005398 <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80005376:	fc843783          	ld	a5,-56(s0)
    8000537a:	439c                	lw	a5,0(a5)
    8000537c:	853e                	mv	a0,a5
    8000537e:	fffff097          	auipc	ra,0xfffff
    80005382:	634080e7          	jalr	1588(ra) # 800049b2 <balloc>
    80005386:	87aa                	mv	a5,a0
    80005388:	fef42623          	sw	a5,-20(s0)
    8000538c:	fc843783          	ld	a5,-56(s0)
    80005390:	fec42703          	lw	a4,-20(s0)
    80005394:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    80005398:	fc843783          	ld	a5,-56(s0)
    8000539c:	439c                	lw	a5,0(a5)
    8000539e:	fec42703          	lw	a4,-20(s0)
    800053a2:	85ba                	mv	a1,a4
    800053a4:	853e                	mv	a0,a5
    800053a6:	fffff097          	auipc	ra,0xfffff
    800053aa:	2c2080e7          	jalr	706(ra) # 80004668 <bread>
    800053ae:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800053b2:	fe043783          	ld	a5,-32(s0)
    800053b6:	05878793          	addi	a5,a5,88
    800053ba:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    800053be:	fc446783          	lwu	a5,-60(s0)
    800053c2:	078a                	slli	a5,a5,0x2
    800053c4:	fd843703          	ld	a4,-40(s0)
    800053c8:	97ba                	add	a5,a5,a4
    800053ca:	439c                	lw	a5,0(a5)
    800053cc:	fef42623          	sw	a5,-20(s0)
    800053d0:	fec42783          	lw	a5,-20(s0)
    800053d4:	2781                	sext.w	a5,a5
    800053d6:	eb9d                	bnez	a5,8000540c <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    800053d8:	fc843783          	ld	a5,-56(s0)
    800053dc:	439c                	lw	a5,0(a5)
    800053de:	853e                	mv	a0,a5
    800053e0:	fffff097          	auipc	ra,0xfffff
    800053e4:	5d2080e7          	jalr	1490(ra) # 800049b2 <balloc>
    800053e8:	87aa                	mv	a5,a0
    800053ea:	fef42623          	sw	a5,-20(s0)
    800053ee:	fc446783          	lwu	a5,-60(s0)
    800053f2:	078a                	slli	a5,a5,0x2
    800053f4:	fd843703          	ld	a4,-40(s0)
    800053f8:	97ba                	add	a5,a5,a4
    800053fa:	fec42703          	lw	a4,-20(s0)
    800053fe:	c398                	sw	a4,0(a5)
      log_write(bp);
    80005400:	fe043503          	ld	a0,-32(s0)
    80005404:	00001097          	auipc	ra,0x1
    80005408:	f84080e7          	jalr	-124(ra) # 80006388 <log_write>
    }
    brelse(bp);
    8000540c:	fe043503          	ld	a0,-32(s0)
    80005410:	fffff097          	auipc	ra,0xfffff
    80005414:	2fa080e7          	jalr	762(ra) # 8000470a <brelse>
    return addr;
    80005418:	fec42783          	lw	a5,-20(s0)
    8000541c:	a809                	j	8000542e <bmap+0x152>
  }

  panic("bmap: out of range");
    8000541e:	00006517          	auipc	a0,0x6
    80005422:	0ca50513          	addi	a0,a0,202 # 8000b4e8 <etext+0x4e8>
    80005426:	ffffc097          	auipc	ra,0xffffc
    8000542a:	858080e7          	jalr	-1960(ra) # 80000c7e <panic>
}
    8000542e:	853e                	mv	a0,a5
    80005430:	70e2                	ld	ra,56(sp)
    80005432:	7442                	ld	s0,48(sp)
    80005434:	6121                	addi	sp,sp,64
    80005436:	8082                	ret

0000000080005438 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005438:	7139                	addi	sp,sp,-64
    8000543a:	fc06                	sd	ra,56(sp)
    8000543c:	f822                	sd	s0,48(sp)
    8000543e:	0080                	addi	s0,sp,64
    80005440:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005444:	fe042623          	sw	zero,-20(s0)
    80005448:	a899                	j	8000549e <itrunc+0x66>
    if(ip->addrs[i]){
    8000544a:	fc843703          	ld	a4,-56(s0)
    8000544e:	fec42783          	lw	a5,-20(s0)
    80005452:	07d1                	addi	a5,a5,20
    80005454:	078a                	slli	a5,a5,0x2
    80005456:	97ba                	add	a5,a5,a4
    80005458:	439c                	lw	a5,0(a5)
    8000545a:	cf8d                	beqz	a5,80005494 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    8000545c:	fc843783          	ld	a5,-56(s0)
    80005460:	439c                	lw	a5,0(a5)
    80005462:	0007869b          	sext.w	a3,a5
    80005466:	fc843703          	ld	a4,-56(s0)
    8000546a:	fec42783          	lw	a5,-20(s0)
    8000546e:	07d1                	addi	a5,a5,20
    80005470:	078a                	slli	a5,a5,0x2
    80005472:	97ba                	add	a5,a5,a4
    80005474:	439c                	lw	a5,0(a5)
    80005476:	85be                	mv	a1,a5
    80005478:	8536                	mv	a0,a3
    8000547a:	fffff097          	auipc	ra,0xfffff
    8000547e:	6e6080e7          	jalr	1766(ra) # 80004b60 <bfree>
      ip->addrs[i] = 0;
    80005482:	fc843703          	ld	a4,-56(s0)
    80005486:	fec42783          	lw	a5,-20(s0)
    8000548a:	07d1                	addi	a5,a5,20
    8000548c:	078a                	slli	a5,a5,0x2
    8000548e:	97ba                	add	a5,a5,a4
    80005490:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005494:	fec42783          	lw	a5,-20(s0)
    80005498:	2785                	addiw	a5,a5,1
    8000549a:	fef42623          	sw	a5,-20(s0)
    8000549e:	fec42783          	lw	a5,-20(s0)
    800054a2:	0007871b          	sext.w	a4,a5
    800054a6:	47ad                	li	a5,11
    800054a8:	fae7d1e3          	bge	a5,a4,8000544a <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800054ac:	fc843783          	ld	a5,-56(s0)
    800054b0:	0807a783          	lw	a5,128(a5)
    800054b4:	cbc5                	beqz	a5,80005564 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800054b6:	fc843783          	ld	a5,-56(s0)
    800054ba:	4398                	lw	a4,0(a5)
    800054bc:	fc843783          	ld	a5,-56(s0)
    800054c0:	0807a783          	lw	a5,128(a5)
    800054c4:	85be                	mv	a1,a5
    800054c6:	853a                	mv	a0,a4
    800054c8:	fffff097          	auipc	ra,0xfffff
    800054cc:	1a0080e7          	jalr	416(ra) # 80004668 <bread>
    800054d0:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800054d4:	fe043783          	ld	a5,-32(s0)
    800054d8:	05878793          	addi	a5,a5,88
    800054dc:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800054e0:	fe042423          	sw	zero,-24(s0)
    800054e4:	a081                	j	80005524 <itrunc+0xec>
      if(a[j])
    800054e6:	fe842783          	lw	a5,-24(s0)
    800054ea:	078a                	slli	a5,a5,0x2
    800054ec:	fd843703          	ld	a4,-40(s0)
    800054f0:	97ba                	add	a5,a5,a4
    800054f2:	439c                	lw	a5,0(a5)
    800054f4:	c39d                	beqz	a5,8000551a <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800054f6:	fc843783          	ld	a5,-56(s0)
    800054fa:	439c                	lw	a5,0(a5)
    800054fc:	0007869b          	sext.w	a3,a5
    80005500:	fe842783          	lw	a5,-24(s0)
    80005504:	078a                	slli	a5,a5,0x2
    80005506:	fd843703          	ld	a4,-40(s0)
    8000550a:	97ba                	add	a5,a5,a4
    8000550c:	439c                	lw	a5,0(a5)
    8000550e:	85be                	mv	a1,a5
    80005510:	8536                	mv	a0,a3
    80005512:	fffff097          	auipc	ra,0xfffff
    80005516:	64e080e7          	jalr	1614(ra) # 80004b60 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    8000551a:	fe842783          	lw	a5,-24(s0)
    8000551e:	2785                	addiw	a5,a5,1
    80005520:	fef42423          	sw	a5,-24(s0)
    80005524:	fe842783          	lw	a5,-24(s0)
    80005528:	873e                	mv	a4,a5
    8000552a:	0ff00793          	li	a5,255
    8000552e:	fae7fce3          	bgeu	a5,a4,800054e6 <itrunc+0xae>
    }
    brelse(bp);
    80005532:	fe043503          	ld	a0,-32(s0)
    80005536:	fffff097          	auipc	ra,0xfffff
    8000553a:	1d4080e7          	jalr	468(ra) # 8000470a <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    8000553e:	fc843783          	ld	a5,-56(s0)
    80005542:	439c                	lw	a5,0(a5)
    80005544:	0007871b          	sext.w	a4,a5
    80005548:	fc843783          	ld	a5,-56(s0)
    8000554c:	0807a783          	lw	a5,128(a5)
    80005550:	85be                	mv	a1,a5
    80005552:	853a                	mv	a0,a4
    80005554:	fffff097          	auipc	ra,0xfffff
    80005558:	60c080e7          	jalr	1548(ra) # 80004b60 <bfree>
    ip->addrs[NDIRECT] = 0;
    8000555c:	fc843783          	ld	a5,-56(s0)
    80005560:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005564:	fc843783          	ld	a5,-56(s0)
    80005568:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    8000556c:	fc843503          	ld	a0,-56(s0)
    80005570:	00000097          	auipc	ra,0x0
    80005574:	890080e7          	jalr	-1904(ra) # 80004e00 <iupdate>
}
    80005578:	0001                	nop
    8000557a:	70e2                	ld	ra,56(sp)
    8000557c:	7442                	ld	s0,48(sp)
    8000557e:	6121                	addi	sp,sp,64
    80005580:	8082                	ret

0000000080005582 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005582:	1101                	addi	sp,sp,-32
    80005584:	ec22                	sd	s0,24(sp)
    80005586:	1000                	addi	s0,sp,32
    80005588:	fea43423          	sd	a0,-24(s0)
    8000558c:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005590:	fe843783          	ld	a5,-24(s0)
    80005594:	439c                	lw	a5,0(a5)
    80005596:	0007871b          	sext.w	a4,a5
    8000559a:	fe043783          	ld	a5,-32(s0)
    8000559e:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    800055a0:	fe843783          	ld	a5,-24(s0)
    800055a4:	43d8                	lw	a4,4(a5)
    800055a6:	fe043783          	ld	a5,-32(s0)
    800055aa:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800055ac:	fe843783          	ld	a5,-24(s0)
    800055b0:	04479703          	lh	a4,68(a5)
    800055b4:	fe043783          	ld	a5,-32(s0)
    800055b8:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    800055bc:	fe843783          	ld	a5,-24(s0)
    800055c0:	04a79703          	lh	a4,74(a5)
    800055c4:	fe043783          	ld	a5,-32(s0)
    800055c8:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    800055cc:	fe843783          	ld	a5,-24(s0)
    800055d0:	47fc                	lw	a5,76(a5)
    800055d2:	02079713          	slli	a4,a5,0x20
    800055d6:	9301                	srli	a4,a4,0x20
    800055d8:	fe043783          	ld	a5,-32(s0)
    800055dc:	eb98                	sd	a4,16(a5)
}
    800055de:	0001                	nop
    800055e0:	6462                	ld	s0,24(sp)
    800055e2:	6105                	addi	sp,sp,32
    800055e4:	8082                	ret

00000000800055e6 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800055e6:	711d                	addi	sp,sp,-96
    800055e8:	ec86                	sd	ra,88(sp)
    800055ea:	e8a2                	sd	s0,80(sp)
    800055ec:	e4a6                	sd	s1,72(sp)
    800055ee:	1080                	addi	s0,sp,96
    800055f0:	faa43c23          	sd	a0,-72(s0)
    800055f4:	87ae                	mv	a5,a1
    800055f6:	fac43423          	sd	a2,-88(s0)
    800055fa:	faf42a23          	sw	a5,-76(s0)
    800055fe:	87b6                	mv	a5,a3
    80005600:	faf42823          	sw	a5,-80(s0)
    80005604:	87ba                	mv	a5,a4
    80005606:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000560a:	fb843783          	ld	a5,-72(s0)
    8000560e:	47f8                	lw	a4,76(a5)
    80005610:	fb042783          	lw	a5,-80(s0)
    80005614:	2781                	sext.w	a5,a5
    80005616:	00f76e63          	bltu	a4,a5,80005632 <readi+0x4c>
    8000561a:	fb042703          	lw	a4,-80(s0)
    8000561e:	fa442783          	lw	a5,-92(s0)
    80005622:	9fb9                	addw	a5,a5,a4
    80005624:	0007871b          	sext.w	a4,a5
    80005628:	fb042783          	lw	a5,-80(s0)
    8000562c:	2781                	sext.w	a5,a5
    8000562e:	00f77463          	bgeu	a4,a5,80005636 <readi+0x50>
    return 0;
    80005632:	4781                	li	a5,0
    80005634:	aa05                	j	80005764 <readi+0x17e>
  if(off + n > ip->size)
    80005636:	fb042703          	lw	a4,-80(s0)
    8000563a:	fa442783          	lw	a5,-92(s0)
    8000563e:	9fb9                	addw	a5,a5,a4
    80005640:	0007871b          	sext.w	a4,a5
    80005644:	fb843783          	ld	a5,-72(s0)
    80005648:	47fc                	lw	a5,76(a5)
    8000564a:	00e7fb63          	bgeu	a5,a4,80005660 <readi+0x7a>
    n = ip->size - off;
    8000564e:	fb843783          	ld	a5,-72(s0)
    80005652:	47f8                	lw	a4,76(a5)
    80005654:	fb042783          	lw	a5,-80(s0)
    80005658:	40f707bb          	subw	a5,a4,a5
    8000565c:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005660:	fc042e23          	sw	zero,-36(s0)
    80005664:	a0f5                	j	80005750 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005666:	fb843783          	ld	a5,-72(s0)
    8000566a:	4384                	lw	s1,0(a5)
    8000566c:	fb042783          	lw	a5,-80(s0)
    80005670:	00a7d79b          	srliw	a5,a5,0xa
    80005674:	2781                	sext.w	a5,a5
    80005676:	85be                	mv	a1,a5
    80005678:	fb843503          	ld	a0,-72(s0)
    8000567c:	00000097          	auipc	ra,0x0
    80005680:	c60080e7          	jalr	-928(ra) # 800052dc <bmap>
    80005684:	87aa                	mv	a5,a0
    80005686:	2781                	sext.w	a5,a5
    80005688:	85be                	mv	a1,a5
    8000568a:	8526                	mv	a0,s1
    8000568c:	fffff097          	auipc	ra,0xfffff
    80005690:	fdc080e7          	jalr	-36(ra) # 80004668 <bread>
    80005694:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005698:	fb042783          	lw	a5,-80(s0)
    8000569c:	3ff7f793          	andi	a5,a5,1023
    800056a0:	2781                	sext.w	a5,a5
    800056a2:	40000713          	li	a4,1024
    800056a6:	40f707bb          	subw	a5,a4,a5
    800056aa:	0007869b          	sext.w	a3,a5
    800056ae:	fa442703          	lw	a4,-92(s0)
    800056b2:	fdc42783          	lw	a5,-36(s0)
    800056b6:	40f707bb          	subw	a5,a4,a5
    800056ba:	2781                	sext.w	a5,a5
    800056bc:	863e                	mv	a2,a5
    800056be:	87b6                	mv	a5,a3
    800056c0:	0007869b          	sext.w	a3,a5
    800056c4:	0006071b          	sext.w	a4,a2
    800056c8:	00d77363          	bgeu	a4,a3,800056ce <readi+0xe8>
    800056cc:	87b2                	mv	a5,a2
    800056ce:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800056d2:	fd043783          	ld	a5,-48(s0)
    800056d6:	05878713          	addi	a4,a5,88
    800056da:	fb046783          	lwu	a5,-80(s0)
    800056de:	3ff7f793          	andi	a5,a5,1023
    800056e2:	973e                	add	a4,a4,a5
    800056e4:	fcc46683          	lwu	a3,-52(s0)
    800056e8:	fb442783          	lw	a5,-76(s0)
    800056ec:	863a                	mv	a2,a4
    800056ee:	fa843583          	ld	a1,-88(s0)
    800056f2:	853e                	mv	a0,a5
    800056f4:	ffffe097          	auipc	ra,0xffffe
    800056f8:	f1c080e7          	jalr	-228(ra) # 80003610 <either_copyout>
    800056fc:	87aa                	mv	a5,a0
    800056fe:	873e                	mv	a4,a5
    80005700:	57fd                	li	a5,-1
    80005702:	00f71c63          	bne	a4,a5,8000571a <readi+0x134>
      brelse(bp);
    80005706:	fd043503          	ld	a0,-48(s0)
    8000570a:	fffff097          	auipc	ra,0xfffff
    8000570e:	000080e7          	jalr	ra # 8000470a <brelse>
      tot = -1;
    80005712:	57fd                	li	a5,-1
    80005714:	fcf42e23          	sw	a5,-36(s0)
      break;
    80005718:	a0a1                	j	80005760 <readi+0x17a>
    }
    brelse(bp);
    8000571a:	fd043503          	ld	a0,-48(s0)
    8000571e:	fffff097          	auipc	ra,0xfffff
    80005722:	fec080e7          	jalr	-20(ra) # 8000470a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005726:	fdc42703          	lw	a4,-36(s0)
    8000572a:	fcc42783          	lw	a5,-52(s0)
    8000572e:	9fb9                	addw	a5,a5,a4
    80005730:	fcf42e23          	sw	a5,-36(s0)
    80005734:	fb042703          	lw	a4,-80(s0)
    80005738:	fcc42783          	lw	a5,-52(s0)
    8000573c:	9fb9                	addw	a5,a5,a4
    8000573e:	faf42823          	sw	a5,-80(s0)
    80005742:	fcc46783          	lwu	a5,-52(s0)
    80005746:	fa843703          	ld	a4,-88(s0)
    8000574a:	97ba                	add	a5,a5,a4
    8000574c:	faf43423          	sd	a5,-88(s0)
    80005750:	fdc42703          	lw	a4,-36(s0)
    80005754:	fa442783          	lw	a5,-92(s0)
    80005758:	2701                	sext.w	a4,a4
    8000575a:	2781                	sext.w	a5,a5
    8000575c:	f0f765e3          	bltu	a4,a5,80005666 <readi+0x80>
  }
  return tot;
    80005760:	fdc42783          	lw	a5,-36(s0)
}
    80005764:	853e                	mv	a0,a5
    80005766:	60e6                	ld	ra,88(sp)
    80005768:	6446                	ld	s0,80(sp)
    8000576a:	64a6                	ld	s1,72(sp)
    8000576c:	6125                	addi	sp,sp,96
    8000576e:	8082                	ret

0000000080005770 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005770:	711d                	addi	sp,sp,-96
    80005772:	ec86                	sd	ra,88(sp)
    80005774:	e8a2                	sd	s0,80(sp)
    80005776:	e4a6                	sd	s1,72(sp)
    80005778:	1080                	addi	s0,sp,96
    8000577a:	faa43c23          	sd	a0,-72(s0)
    8000577e:	87ae                	mv	a5,a1
    80005780:	fac43423          	sd	a2,-88(s0)
    80005784:	faf42a23          	sw	a5,-76(s0)
    80005788:	87b6                	mv	a5,a3
    8000578a:	faf42823          	sw	a5,-80(s0)
    8000578e:	87ba                	mv	a5,a4
    80005790:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005794:	fb843783          	ld	a5,-72(s0)
    80005798:	47f8                	lw	a4,76(a5)
    8000579a:	fb042783          	lw	a5,-80(s0)
    8000579e:	2781                	sext.w	a5,a5
    800057a0:	00f76e63          	bltu	a4,a5,800057bc <writei+0x4c>
    800057a4:	fb042703          	lw	a4,-80(s0)
    800057a8:	fa442783          	lw	a5,-92(s0)
    800057ac:	9fb9                	addw	a5,a5,a4
    800057ae:	0007871b          	sext.w	a4,a5
    800057b2:	fb042783          	lw	a5,-80(s0)
    800057b6:	2781                	sext.w	a5,a5
    800057b8:	00f77463          	bgeu	a4,a5,800057c0 <writei+0x50>
    return -1;
    800057bc:	57fd                	li	a5,-1
    800057be:	a2b1                	j	8000590a <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    800057c0:	fb042703          	lw	a4,-80(s0)
    800057c4:	fa442783          	lw	a5,-92(s0)
    800057c8:	9fb9                	addw	a5,a5,a4
    800057ca:	2781                	sext.w	a5,a5
    800057cc:	873e                	mv	a4,a5
    800057ce:	000437b7          	lui	a5,0x43
    800057d2:	00e7f463          	bgeu	a5,a4,800057da <writei+0x6a>
    return -1;
    800057d6:	57fd                	li	a5,-1
    800057d8:	aa0d                	j	8000590a <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    800057da:	fc042e23          	sw	zero,-36(s0)
    800057de:	a8cd                	j	800058d0 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    800057e0:	fb843783          	ld	a5,-72(s0)
    800057e4:	4384                	lw	s1,0(a5)
    800057e6:	fb042783          	lw	a5,-80(s0)
    800057ea:	00a7d79b          	srliw	a5,a5,0xa
    800057ee:	2781                	sext.w	a5,a5
    800057f0:	85be                	mv	a1,a5
    800057f2:	fb843503          	ld	a0,-72(s0)
    800057f6:	00000097          	auipc	ra,0x0
    800057fa:	ae6080e7          	jalr	-1306(ra) # 800052dc <bmap>
    800057fe:	87aa                	mv	a5,a0
    80005800:	2781                	sext.w	a5,a5
    80005802:	85be                	mv	a1,a5
    80005804:	8526                	mv	a0,s1
    80005806:	fffff097          	auipc	ra,0xfffff
    8000580a:	e62080e7          	jalr	-414(ra) # 80004668 <bread>
    8000580e:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005812:	fb042783          	lw	a5,-80(s0)
    80005816:	3ff7f793          	andi	a5,a5,1023
    8000581a:	2781                	sext.w	a5,a5
    8000581c:	40000713          	li	a4,1024
    80005820:	40f707bb          	subw	a5,a4,a5
    80005824:	0007869b          	sext.w	a3,a5
    80005828:	fa442703          	lw	a4,-92(s0)
    8000582c:	fdc42783          	lw	a5,-36(s0)
    80005830:	40f707bb          	subw	a5,a4,a5
    80005834:	2781                	sext.w	a5,a5
    80005836:	863e                	mv	a2,a5
    80005838:	87b6                	mv	a5,a3
    8000583a:	0007869b          	sext.w	a3,a5
    8000583e:	0006071b          	sext.w	a4,a2
    80005842:	00d77363          	bgeu	a4,a3,80005848 <writei+0xd8>
    80005846:	87b2                	mv	a5,a2
    80005848:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    8000584c:	fd043783          	ld	a5,-48(s0)
    80005850:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005854:	fb046783          	lwu	a5,-80(s0)
    80005858:	3ff7f793          	andi	a5,a5,1023
    8000585c:	97ba                	add	a5,a5,a4
    8000585e:	fcc46683          	lwu	a3,-52(s0)
    80005862:	fb442703          	lw	a4,-76(s0)
    80005866:	fa843603          	ld	a2,-88(s0)
    8000586a:	85ba                	mv	a1,a4
    8000586c:	853e                	mv	a0,a5
    8000586e:	ffffe097          	auipc	ra,0xffffe
    80005872:	e16080e7          	jalr	-490(ra) # 80003684 <either_copyin>
    80005876:	87aa                	mv	a5,a0
    80005878:	873e                	mv	a4,a5
    8000587a:	57fd                	li	a5,-1
    8000587c:	00f71963          	bne	a4,a5,8000588e <writei+0x11e>
      brelse(bp);
    80005880:	fd043503          	ld	a0,-48(s0)
    80005884:	fffff097          	auipc	ra,0xfffff
    80005888:	e86080e7          	jalr	-378(ra) # 8000470a <brelse>
      break;
    8000588c:	a891                	j	800058e0 <writei+0x170>
    }
    log_write(bp);
    8000588e:	fd043503          	ld	a0,-48(s0)
    80005892:	00001097          	auipc	ra,0x1
    80005896:	af6080e7          	jalr	-1290(ra) # 80006388 <log_write>
    brelse(bp);
    8000589a:	fd043503          	ld	a0,-48(s0)
    8000589e:	fffff097          	auipc	ra,0xfffff
    800058a2:	e6c080e7          	jalr	-404(ra) # 8000470a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    800058a6:	fdc42703          	lw	a4,-36(s0)
    800058aa:	fcc42783          	lw	a5,-52(s0)
    800058ae:	9fb9                	addw	a5,a5,a4
    800058b0:	fcf42e23          	sw	a5,-36(s0)
    800058b4:	fb042703          	lw	a4,-80(s0)
    800058b8:	fcc42783          	lw	a5,-52(s0)
    800058bc:	9fb9                	addw	a5,a5,a4
    800058be:	faf42823          	sw	a5,-80(s0)
    800058c2:	fcc46783          	lwu	a5,-52(s0)
    800058c6:	fa843703          	ld	a4,-88(s0)
    800058ca:	97ba                	add	a5,a5,a4
    800058cc:	faf43423          	sd	a5,-88(s0)
    800058d0:	fdc42703          	lw	a4,-36(s0)
    800058d4:	fa442783          	lw	a5,-92(s0)
    800058d8:	2701                	sext.w	a4,a4
    800058da:	2781                	sext.w	a5,a5
    800058dc:	f0f762e3          	bltu	a4,a5,800057e0 <writei+0x70>
  }

  if(off > ip->size)
    800058e0:	fb843783          	ld	a5,-72(s0)
    800058e4:	47f8                	lw	a4,76(a5)
    800058e6:	fb042783          	lw	a5,-80(s0)
    800058ea:	2781                	sext.w	a5,a5
    800058ec:	00f77763          	bgeu	a4,a5,800058fa <writei+0x18a>
    ip->size = off;
    800058f0:	fb843783          	ld	a5,-72(s0)
    800058f4:	fb042703          	lw	a4,-80(s0)
    800058f8:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    800058fa:	fb843503          	ld	a0,-72(s0)
    800058fe:	fffff097          	auipc	ra,0xfffff
    80005902:	502080e7          	jalr	1282(ra) # 80004e00 <iupdate>

  return tot;
    80005906:	fdc42783          	lw	a5,-36(s0)
}
    8000590a:	853e                	mv	a0,a5
    8000590c:	60e6                	ld	ra,88(sp)
    8000590e:	6446                	ld	s0,80(sp)
    80005910:	64a6                	ld	s1,72(sp)
    80005912:	6125                	addi	sp,sp,96
    80005914:	8082                	ret

0000000080005916 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005916:	1101                	addi	sp,sp,-32
    80005918:	ec06                	sd	ra,24(sp)
    8000591a:	e822                	sd	s0,16(sp)
    8000591c:	1000                	addi	s0,sp,32
    8000591e:	fea43423          	sd	a0,-24(s0)
    80005922:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005926:	4639                	li	a2,14
    80005928:	fe043583          	ld	a1,-32(s0)
    8000592c:	fe843503          	ld	a0,-24(s0)
    80005930:	ffffc097          	auipc	ra,0xffffc
    80005934:	d0a080e7          	jalr	-758(ra) # 8000163a <strncmp>
    80005938:	87aa                	mv	a5,a0
}
    8000593a:	853e                	mv	a0,a5
    8000593c:	60e2                	ld	ra,24(sp)
    8000593e:	6442                	ld	s0,16(sp)
    80005940:	6105                	addi	sp,sp,32
    80005942:	8082                	ret

0000000080005944 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005944:	715d                	addi	sp,sp,-80
    80005946:	e486                	sd	ra,72(sp)
    80005948:	e0a2                	sd	s0,64(sp)
    8000594a:	0880                	addi	s0,sp,80
    8000594c:	fca43423          	sd	a0,-56(s0)
    80005950:	fcb43023          	sd	a1,-64(s0)
    80005954:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005958:	fc843783          	ld	a5,-56(s0)
    8000595c:	04479783          	lh	a5,68(a5)
    80005960:	0007871b          	sext.w	a4,a5
    80005964:	4785                	li	a5,1
    80005966:	00f70a63          	beq	a4,a5,8000597a <dirlookup+0x36>
    panic("dirlookup not DIR");
    8000596a:	00006517          	auipc	a0,0x6
    8000596e:	b9650513          	addi	a0,a0,-1130 # 8000b500 <etext+0x500>
    80005972:	ffffb097          	auipc	ra,0xffffb
    80005976:	30c080e7          	jalr	780(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    8000597a:	fe042623          	sw	zero,-20(s0)
    8000597e:	a849                	j	80005a10 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005980:	fd840793          	addi	a5,s0,-40
    80005984:	fec42683          	lw	a3,-20(s0)
    80005988:	4741                	li	a4,16
    8000598a:	863e                	mv	a2,a5
    8000598c:	4581                	li	a1,0
    8000598e:	fc843503          	ld	a0,-56(s0)
    80005992:	00000097          	auipc	ra,0x0
    80005996:	c54080e7          	jalr	-940(ra) # 800055e6 <readi>
    8000599a:	87aa                	mv	a5,a0
    8000599c:	873e                	mv	a4,a5
    8000599e:	47c1                	li	a5,16
    800059a0:	00f70a63          	beq	a4,a5,800059b4 <dirlookup+0x70>
      panic("dirlookup read");
    800059a4:	00006517          	auipc	a0,0x6
    800059a8:	b7450513          	addi	a0,a0,-1164 # 8000b518 <etext+0x518>
    800059ac:	ffffb097          	auipc	ra,0xffffb
    800059b0:	2d2080e7          	jalr	722(ra) # 80000c7e <panic>
    if(de.inum == 0)
    800059b4:	fd845783          	lhu	a5,-40(s0)
    800059b8:	c7b1                	beqz	a5,80005a04 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    800059ba:	fd840793          	addi	a5,s0,-40
    800059be:	0789                	addi	a5,a5,2
    800059c0:	85be                	mv	a1,a5
    800059c2:	fc043503          	ld	a0,-64(s0)
    800059c6:	00000097          	auipc	ra,0x0
    800059ca:	f50080e7          	jalr	-176(ra) # 80005916 <namecmp>
    800059ce:	87aa                	mv	a5,a0
    800059d0:	eb9d                	bnez	a5,80005a06 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    800059d2:	fb843783          	ld	a5,-72(s0)
    800059d6:	c791                	beqz	a5,800059e2 <dirlookup+0x9e>
        *poff = off;
    800059d8:	fb843783          	ld	a5,-72(s0)
    800059dc:	fec42703          	lw	a4,-20(s0)
    800059e0:	c398                	sw	a4,0(a5)
      inum = de.inum;
    800059e2:	fd845783          	lhu	a5,-40(s0)
    800059e6:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    800059ea:	fc843783          	ld	a5,-56(s0)
    800059ee:	439c                	lw	a5,0(a5)
    800059f0:	fe842703          	lw	a4,-24(s0)
    800059f4:	85ba                	mv	a1,a4
    800059f6:	853e                	mv	a0,a5
    800059f8:	fffff097          	auipc	ra,0xfffff
    800059fc:	4f0080e7          	jalr	1264(ra) # 80004ee8 <iget>
    80005a00:	87aa                	mv	a5,a0
    80005a02:	a005                	j	80005a22 <dirlookup+0xde>
      continue;
    80005a04:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005a06:	fec42783          	lw	a5,-20(s0)
    80005a0a:	27c1                	addiw	a5,a5,16
    80005a0c:	fef42623          	sw	a5,-20(s0)
    80005a10:	fc843783          	ld	a5,-56(s0)
    80005a14:	47f8                	lw	a4,76(a5)
    80005a16:	fec42783          	lw	a5,-20(s0)
    80005a1a:	2781                	sext.w	a5,a5
    80005a1c:	f6e7e2e3          	bltu	a5,a4,80005980 <dirlookup+0x3c>
    }
  }

  return 0;
    80005a20:	4781                	li	a5,0
}
    80005a22:	853e                	mv	a0,a5
    80005a24:	60a6                	ld	ra,72(sp)
    80005a26:	6406                	ld	s0,64(sp)
    80005a28:	6161                	addi	sp,sp,80
    80005a2a:	8082                	ret

0000000080005a2c <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005a2c:	715d                	addi	sp,sp,-80
    80005a2e:	e486                	sd	ra,72(sp)
    80005a30:	e0a2                	sd	s0,64(sp)
    80005a32:	0880                	addi	s0,sp,80
    80005a34:	fca43423          	sd	a0,-56(s0)
    80005a38:	fcb43023          	sd	a1,-64(s0)
    80005a3c:	87b2                	mv	a5,a2
    80005a3e:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005a42:	4601                	li	a2,0
    80005a44:	fc043583          	ld	a1,-64(s0)
    80005a48:	fc843503          	ld	a0,-56(s0)
    80005a4c:	00000097          	auipc	ra,0x0
    80005a50:	ef8080e7          	jalr	-264(ra) # 80005944 <dirlookup>
    80005a54:	fea43023          	sd	a0,-32(s0)
    80005a58:	fe043783          	ld	a5,-32(s0)
    80005a5c:	cb89                	beqz	a5,80005a6e <dirlink+0x42>
    iput(ip);
    80005a5e:	fe043503          	ld	a0,-32(s0)
    80005a62:	fffff097          	auipc	ra,0xfffff
    80005a66:	77c080e7          	jalr	1916(ra) # 800051de <iput>
    return -1;
    80005a6a:	57fd                	li	a5,-1
    80005a6c:	a865                	j	80005b24 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005a6e:	fe042623          	sw	zero,-20(s0)
    80005a72:	a0a1                	j	80005aba <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005a74:	fd040793          	addi	a5,s0,-48
    80005a78:	fec42683          	lw	a3,-20(s0)
    80005a7c:	4741                	li	a4,16
    80005a7e:	863e                	mv	a2,a5
    80005a80:	4581                	li	a1,0
    80005a82:	fc843503          	ld	a0,-56(s0)
    80005a86:	00000097          	auipc	ra,0x0
    80005a8a:	b60080e7          	jalr	-1184(ra) # 800055e6 <readi>
    80005a8e:	87aa                	mv	a5,a0
    80005a90:	873e                	mv	a4,a5
    80005a92:	47c1                	li	a5,16
    80005a94:	00f70a63          	beq	a4,a5,80005aa8 <dirlink+0x7c>
      panic("dirlink read");
    80005a98:	00006517          	auipc	a0,0x6
    80005a9c:	a9050513          	addi	a0,a0,-1392 # 8000b528 <etext+0x528>
    80005aa0:	ffffb097          	auipc	ra,0xffffb
    80005aa4:	1de080e7          	jalr	478(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005aa8:	fd045783          	lhu	a5,-48(s0)
    80005aac:	cf99                	beqz	a5,80005aca <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005aae:	fec42783          	lw	a5,-20(s0)
    80005ab2:	27c1                	addiw	a5,a5,16
    80005ab4:	2781                	sext.w	a5,a5
    80005ab6:	fef42623          	sw	a5,-20(s0)
    80005aba:	fc843783          	ld	a5,-56(s0)
    80005abe:	47f8                	lw	a4,76(a5)
    80005ac0:	fec42783          	lw	a5,-20(s0)
    80005ac4:	fae7e8e3          	bltu	a5,a4,80005a74 <dirlink+0x48>
    80005ac8:	a011                	j	80005acc <dirlink+0xa0>
      break;
    80005aca:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005acc:	fd040793          	addi	a5,s0,-48
    80005ad0:	0789                	addi	a5,a5,2
    80005ad2:	4639                	li	a2,14
    80005ad4:	fc043583          	ld	a1,-64(s0)
    80005ad8:	853e                	mv	a0,a5
    80005ada:	ffffc097          	auipc	ra,0xffffc
    80005ade:	bea080e7          	jalr	-1046(ra) # 800016c4 <strncpy>
  de.inum = inum;
    80005ae2:	fbc42783          	lw	a5,-68(s0)
    80005ae6:	17c2                	slli	a5,a5,0x30
    80005ae8:	93c1                	srli	a5,a5,0x30
    80005aea:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005aee:	fd040793          	addi	a5,s0,-48
    80005af2:	fec42683          	lw	a3,-20(s0)
    80005af6:	4741                	li	a4,16
    80005af8:	863e                	mv	a2,a5
    80005afa:	4581                	li	a1,0
    80005afc:	fc843503          	ld	a0,-56(s0)
    80005b00:	00000097          	auipc	ra,0x0
    80005b04:	c70080e7          	jalr	-912(ra) # 80005770 <writei>
    80005b08:	87aa                	mv	a5,a0
    80005b0a:	873e                	mv	a4,a5
    80005b0c:	47c1                	li	a5,16
    80005b0e:	00f70a63          	beq	a4,a5,80005b22 <dirlink+0xf6>
    panic("dirlink");
    80005b12:	00006517          	auipc	a0,0x6
    80005b16:	a2650513          	addi	a0,a0,-1498 # 8000b538 <etext+0x538>
    80005b1a:	ffffb097          	auipc	ra,0xffffb
    80005b1e:	164080e7          	jalr	356(ra) # 80000c7e <panic>

  return 0;
    80005b22:	4781                	li	a5,0
}
    80005b24:	853e                	mv	a0,a5
    80005b26:	60a6                	ld	ra,72(sp)
    80005b28:	6406                	ld	s0,64(sp)
    80005b2a:	6161                	addi	sp,sp,80
    80005b2c:	8082                	ret

0000000080005b2e <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005b2e:	7179                	addi	sp,sp,-48
    80005b30:	f406                	sd	ra,40(sp)
    80005b32:	f022                	sd	s0,32(sp)
    80005b34:	1800                	addi	s0,sp,48
    80005b36:	fca43c23          	sd	a0,-40(s0)
    80005b3a:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005b3e:	a031                	j	80005b4a <skipelem+0x1c>
    path++;
    80005b40:	fd843783          	ld	a5,-40(s0)
    80005b44:	0785                	addi	a5,a5,1
    80005b46:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005b4a:	fd843783          	ld	a5,-40(s0)
    80005b4e:	0007c783          	lbu	a5,0(a5)
    80005b52:	873e                	mv	a4,a5
    80005b54:	02f00793          	li	a5,47
    80005b58:	fef704e3          	beq	a4,a5,80005b40 <skipelem+0x12>
  if(*path == 0)
    80005b5c:	fd843783          	ld	a5,-40(s0)
    80005b60:	0007c783          	lbu	a5,0(a5)
    80005b64:	e399                	bnez	a5,80005b6a <skipelem+0x3c>
    return 0;
    80005b66:	4781                	li	a5,0
    80005b68:	a06d                	j	80005c12 <skipelem+0xe4>
  s = path;
    80005b6a:	fd843783          	ld	a5,-40(s0)
    80005b6e:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005b72:	a031                	j	80005b7e <skipelem+0x50>
    path++;
    80005b74:	fd843783          	ld	a5,-40(s0)
    80005b78:	0785                	addi	a5,a5,1
    80005b7a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005b7e:	fd843783          	ld	a5,-40(s0)
    80005b82:	0007c783          	lbu	a5,0(a5)
    80005b86:	873e                	mv	a4,a5
    80005b88:	02f00793          	li	a5,47
    80005b8c:	00f70763          	beq	a4,a5,80005b9a <skipelem+0x6c>
    80005b90:	fd843783          	ld	a5,-40(s0)
    80005b94:	0007c783          	lbu	a5,0(a5)
    80005b98:	fff1                	bnez	a5,80005b74 <skipelem+0x46>
  len = path - s;
    80005b9a:	fd843703          	ld	a4,-40(s0)
    80005b9e:	fe843783          	ld	a5,-24(s0)
    80005ba2:	40f707b3          	sub	a5,a4,a5
    80005ba6:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005baa:	fe442783          	lw	a5,-28(s0)
    80005bae:	0007871b          	sext.w	a4,a5
    80005bb2:	47b5                	li	a5,13
    80005bb4:	00e7dc63          	bge	a5,a4,80005bcc <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005bb8:	4639                	li	a2,14
    80005bba:	fe843583          	ld	a1,-24(s0)
    80005bbe:	fd043503          	ld	a0,-48(s0)
    80005bc2:	ffffc097          	auipc	ra,0xffffc
    80005bc6:	964080e7          	jalr	-1692(ra) # 80001526 <memmove>
    80005bca:	a80d                	j	80005bfc <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005bcc:	fe442783          	lw	a5,-28(s0)
    80005bd0:	863e                	mv	a2,a5
    80005bd2:	fe843583          	ld	a1,-24(s0)
    80005bd6:	fd043503          	ld	a0,-48(s0)
    80005bda:	ffffc097          	auipc	ra,0xffffc
    80005bde:	94c080e7          	jalr	-1716(ra) # 80001526 <memmove>
    name[len] = 0;
    80005be2:	fe442783          	lw	a5,-28(s0)
    80005be6:	fd043703          	ld	a4,-48(s0)
    80005bea:	97ba                	add	a5,a5,a4
    80005bec:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005bf0:	a031                	j	80005bfc <skipelem+0xce>
    path++;
    80005bf2:	fd843783          	ld	a5,-40(s0)
    80005bf6:	0785                	addi	a5,a5,1
    80005bf8:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005bfc:	fd843783          	ld	a5,-40(s0)
    80005c00:	0007c783          	lbu	a5,0(a5)
    80005c04:	873e                	mv	a4,a5
    80005c06:	02f00793          	li	a5,47
    80005c0a:	fef704e3          	beq	a4,a5,80005bf2 <skipelem+0xc4>
  return path;
    80005c0e:	fd843783          	ld	a5,-40(s0)
}
    80005c12:	853e                	mv	a0,a5
    80005c14:	70a2                	ld	ra,40(sp)
    80005c16:	7402                	ld	s0,32(sp)
    80005c18:	6145                	addi	sp,sp,48
    80005c1a:	8082                	ret

0000000080005c1c <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005c1c:	7139                	addi	sp,sp,-64
    80005c1e:	fc06                	sd	ra,56(sp)
    80005c20:	f822                	sd	s0,48(sp)
    80005c22:	0080                	addi	s0,sp,64
    80005c24:	fca43c23          	sd	a0,-40(s0)
    80005c28:	87ae                	mv	a5,a1
    80005c2a:	fcc43423          	sd	a2,-56(s0)
    80005c2e:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005c32:	fd843783          	ld	a5,-40(s0)
    80005c36:	0007c783          	lbu	a5,0(a5)
    80005c3a:	873e                	mv	a4,a5
    80005c3c:	02f00793          	li	a5,47
    80005c40:	00f71b63          	bne	a4,a5,80005c56 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005c44:	4585                	li	a1,1
    80005c46:	4505                	li	a0,1
    80005c48:	fffff097          	auipc	ra,0xfffff
    80005c4c:	2a0080e7          	jalr	672(ra) # 80004ee8 <iget>
    80005c50:	fea43423          	sd	a0,-24(s0)
    80005c54:	a84d                	j	80005d06 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005c56:	ffffd097          	auipc	ra,0xffffd
    80005c5a:	bbe080e7          	jalr	-1090(ra) # 80002814 <myproc>
    80005c5e:	87aa                	mv	a5,a0
    80005c60:	1507b783          	ld	a5,336(a5)
    80005c64:	853e                	mv	a0,a5
    80005c66:	fffff097          	auipc	ra,0xfffff
    80005c6a:	39e080e7          	jalr	926(ra) # 80005004 <idup>
    80005c6e:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005c72:	a851                	j	80005d06 <namex+0xea>
    ilock(ip);
    80005c74:	fe843503          	ld	a0,-24(s0)
    80005c78:	fffff097          	auipc	ra,0xfffff
    80005c7c:	3d8080e7          	jalr	984(ra) # 80005050 <ilock>
    if(ip->type != T_DIR){
    80005c80:	fe843783          	ld	a5,-24(s0)
    80005c84:	04479783          	lh	a5,68(a5)
    80005c88:	0007871b          	sext.w	a4,a5
    80005c8c:	4785                	li	a5,1
    80005c8e:	00f70a63          	beq	a4,a5,80005ca2 <namex+0x86>
      iunlockput(ip);
    80005c92:	fe843503          	ld	a0,-24(s0)
    80005c96:	fffff097          	auipc	ra,0xfffff
    80005c9a:	618080e7          	jalr	1560(ra) # 800052ae <iunlockput>
      return 0;
    80005c9e:	4781                	li	a5,0
    80005ca0:	a871                	j	80005d3c <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005ca2:	fd442783          	lw	a5,-44(s0)
    80005ca6:	2781                	sext.w	a5,a5
    80005ca8:	cf99                	beqz	a5,80005cc6 <namex+0xaa>
    80005caa:	fd843783          	ld	a5,-40(s0)
    80005cae:	0007c783          	lbu	a5,0(a5)
    80005cb2:	eb91                	bnez	a5,80005cc6 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005cb4:	fe843503          	ld	a0,-24(s0)
    80005cb8:	fffff097          	auipc	ra,0xfffff
    80005cbc:	4cc080e7          	jalr	1228(ra) # 80005184 <iunlock>
      return ip;
    80005cc0:	fe843783          	ld	a5,-24(s0)
    80005cc4:	a8a5                	j	80005d3c <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005cc6:	4601                	li	a2,0
    80005cc8:	fc843583          	ld	a1,-56(s0)
    80005ccc:	fe843503          	ld	a0,-24(s0)
    80005cd0:	00000097          	auipc	ra,0x0
    80005cd4:	c74080e7          	jalr	-908(ra) # 80005944 <dirlookup>
    80005cd8:	fea43023          	sd	a0,-32(s0)
    80005cdc:	fe043783          	ld	a5,-32(s0)
    80005ce0:	eb89                	bnez	a5,80005cf2 <namex+0xd6>
      iunlockput(ip);
    80005ce2:	fe843503          	ld	a0,-24(s0)
    80005ce6:	fffff097          	auipc	ra,0xfffff
    80005cea:	5c8080e7          	jalr	1480(ra) # 800052ae <iunlockput>
      return 0;
    80005cee:	4781                	li	a5,0
    80005cf0:	a0b1                	j	80005d3c <namex+0x120>
    }
    iunlockput(ip);
    80005cf2:	fe843503          	ld	a0,-24(s0)
    80005cf6:	fffff097          	auipc	ra,0xfffff
    80005cfa:	5b8080e7          	jalr	1464(ra) # 800052ae <iunlockput>
    ip = next;
    80005cfe:	fe043783          	ld	a5,-32(s0)
    80005d02:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005d06:	fc843583          	ld	a1,-56(s0)
    80005d0a:	fd843503          	ld	a0,-40(s0)
    80005d0e:	00000097          	auipc	ra,0x0
    80005d12:	e20080e7          	jalr	-480(ra) # 80005b2e <skipelem>
    80005d16:	fca43c23          	sd	a0,-40(s0)
    80005d1a:	fd843783          	ld	a5,-40(s0)
    80005d1e:	fbb9                	bnez	a5,80005c74 <namex+0x58>
  }
  if(nameiparent){
    80005d20:	fd442783          	lw	a5,-44(s0)
    80005d24:	2781                	sext.w	a5,a5
    80005d26:	cb89                	beqz	a5,80005d38 <namex+0x11c>
    iput(ip);
    80005d28:	fe843503          	ld	a0,-24(s0)
    80005d2c:	fffff097          	auipc	ra,0xfffff
    80005d30:	4b2080e7          	jalr	1202(ra) # 800051de <iput>
    return 0;
    80005d34:	4781                	li	a5,0
    80005d36:	a019                	j	80005d3c <namex+0x120>
  }
  return ip;
    80005d38:	fe843783          	ld	a5,-24(s0)
}
    80005d3c:	853e                	mv	a0,a5
    80005d3e:	70e2                	ld	ra,56(sp)
    80005d40:	7442                	ld	s0,48(sp)
    80005d42:	6121                	addi	sp,sp,64
    80005d44:	8082                	ret

0000000080005d46 <namei>:

struct inode*
namei(char *path)
{
    80005d46:	7179                	addi	sp,sp,-48
    80005d48:	f406                	sd	ra,40(sp)
    80005d4a:	f022                	sd	s0,32(sp)
    80005d4c:	1800                	addi	s0,sp,48
    80005d4e:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005d52:	fe040793          	addi	a5,s0,-32
    80005d56:	863e                	mv	a2,a5
    80005d58:	4581                	li	a1,0
    80005d5a:	fd843503          	ld	a0,-40(s0)
    80005d5e:	00000097          	auipc	ra,0x0
    80005d62:	ebe080e7          	jalr	-322(ra) # 80005c1c <namex>
    80005d66:	87aa                	mv	a5,a0
}
    80005d68:	853e                	mv	a0,a5
    80005d6a:	70a2                	ld	ra,40(sp)
    80005d6c:	7402                	ld	s0,32(sp)
    80005d6e:	6145                	addi	sp,sp,48
    80005d70:	8082                	ret

0000000080005d72 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005d72:	1101                	addi	sp,sp,-32
    80005d74:	ec06                	sd	ra,24(sp)
    80005d76:	e822                	sd	s0,16(sp)
    80005d78:	1000                	addi	s0,sp,32
    80005d7a:	fea43423          	sd	a0,-24(s0)
    80005d7e:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005d82:	fe043603          	ld	a2,-32(s0)
    80005d86:	4585                	li	a1,1
    80005d88:	fe843503          	ld	a0,-24(s0)
    80005d8c:	00000097          	auipc	ra,0x0
    80005d90:	e90080e7          	jalr	-368(ra) # 80005c1c <namex>
    80005d94:	87aa                	mv	a5,a0
}
    80005d96:	853e                	mv	a0,a5
    80005d98:	60e2                	ld	ra,24(sp)
    80005d9a:	6442                	ld	s0,16(sp)
    80005d9c:	6105                	addi	sp,sp,32
    80005d9e:	8082                	ret

0000000080005da0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005da0:	1101                	addi	sp,sp,-32
    80005da2:	ec06                	sd	ra,24(sp)
    80005da4:	e822                	sd	s0,16(sp)
    80005da6:	1000                	addi	s0,sp,32
    80005da8:	87aa                	mv	a5,a0
    80005daa:	feb43023          	sd	a1,-32(s0)
    80005dae:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80005db2:	00005597          	auipc	a1,0x5
    80005db6:	78e58593          	addi	a1,a1,1934 # 8000b540 <etext+0x540>
    80005dba:	0001e517          	auipc	a0,0x1e
    80005dbe:	4ae50513          	addi	a0,a0,1198 # 80024268 <log>
    80005dc2:	ffffb097          	auipc	ra,0xffffb
    80005dc6:	47c080e7          	jalr	1148(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    80005dca:	fe043783          	ld	a5,-32(s0)
    80005dce:	4bdc                	lw	a5,20(a5)
    80005dd0:	0007871b          	sext.w	a4,a5
    80005dd4:	0001e797          	auipc	a5,0x1e
    80005dd8:	49478793          	addi	a5,a5,1172 # 80024268 <log>
    80005ddc:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80005dde:	fe043783          	ld	a5,-32(s0)
    80005de2:	4b9c                	lw	a5,16(a5)
    80005de4:	0007871b          	sext.w	a4,a5
    80005de8:	0001e797          	auipc	a5,0x1e
    80005dec:	48078793          	addi	a5,a5,1152 # 80024268 <log>
    80005df0:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80005df2:	0001e797          	auipc	a5,0x1e
    80005df6:	47678793          	addi	a5,a5,1142 # 80024268 <log>
    80005dfa:	fec42703          	lw	a4,-20(s0)
    80005dfe:	d798                	sw	a4,40(a5)
  recover_from_log();
    80005e00:	00000097          	auipc	ra,0x0
    80005e04:	272080e7          	jalr	626(ra) # 80006072 <recover_from_log>
}
    80005e08:	0001                	nop
    80005e0a:	60e2                	ld	ra,24(sp)
    80005e0c:	6442                	ld	s0,16(sp)
    80005e0e:	6105                	addi	sp,sp,32
    80005e10:	8082                	ret

0000000080005e12 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80005e12:	7139                	addi	sp,sp,-64
    80005e14:	fc06                	sd	ra,56(sp)
    80005e16:	f822                	sd	s0,48(sp)
    80005e18:	0080                	addi	s0,sp,64
    80005e1a:	87aa                	mv	a5,a0
    80005e1c:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80005e20:	fe042623          	sw	zero,-20(s0)
    80005e24:	a0f9                	j	80005ef2 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80005e26:	0001e797          	auipc	a5,0x1e
    80005e2a:	44278793          	addi	a5,a5,1090 # 80024268 <log>
    80005e2e:	579c                	lw	a5,40(a5)
    80005e30:	0007869b          	sext.w	a3,a5
    80005e34:	0001e797          	auipc	a5,0x1e
    80005e38:	43478793          	addi	a5,a5,1076 # 80024268 <log>
    80005e3c:	4f9c                	lw	a5,24(a5)
    80005e3e:	fec42703          	lw	a4,-20(s0)
    80005e42:	9fb9                	addw	a5,a5,a4
    80005e44:	2781                	sext.w	a5,a5
    80005e46:	2785                	addiw	a5,a5,1
    80005e48:	2781                	sext.w	a5,a5
    80005e4a:	2781                	sext.w	a5,a5
    80005e4c:	85be                	mv	a1,a5
    80005e4e:	8536                	mv	a0,a3
    80005e50:	fffff097          	auipc	ra,0xfffff
    80005e54:	818080e7          	jalr	-2024(ra) # 80004668 <bread>
    80005e58:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80005e5c:	0001e797          	auipc	a5,0x1e
    80005e60:	40c78793          	addi	a5,a5,1036 # 80024268 <log>
    80005e64:	579c                	lw	a5,40(a5)
    80005e66:	0007869b          	sext.w	a3,a5
    80005e6a:	0001e717          	auipc	a4,0x1e
    80005e6e:	3fe70713          	addi	a4,a4,1022 # 80024268 <log>
    80005e72:	fec42783          	lw	a5,-20(s0)
    80005e76:	07a1                	addi	a5,a5,8
    80005e78:	078a                	slli	a5,a5,0x2
    80005e7a:	97ba                	add	a5,a5,a4
    80005e7c:	4b9c                	lw	a5,16(a5)
    80005e7e:	2781                	sext.w	a5,a5
    80005e80:	85be                	mv	a1,a5
    80005e82:	8536                	mv	a0,a3
    80005e84:	ffffe097          	auipc	ra,0xffffe
    80005e88:	7e4080e7          	jalr	2020(ra) # 80004668 <bread>
    80005e8c:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80005e90:	fd843783          	ld	a5,-40(s0)
    80005e94:	05878713          	addi	a4,a5,88
    80005e98:	fe043783          	ld	a5,-32(s0)
    80005e9c:	05878793          	addi	a5,a5,88
    80005ea0:	40000613          	li	a2,1024
    80005ea4:	85be                	mv	a1,a5
    80005ea6:	853a                	mv	a0,a4
    80005ea8:	ffffb097          	auipc	ra,0xffffb
    80005eac:	67e080e7          	jalr	1662(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    80005eb0:	fd843503          	ld	a0,-40(s0)
    80005eb4:	fffff097          	auipc	ra,0xfffff
    80005eb8:	80e080e7          	jalr	-2034(ra) # 800046c2 <bwrite>
    if(recovering == 0)
    80005ebc:	fcc42783          	lw	a5,-52(s0)
    80005ec0:	2781                	sext.w	a5,a5
    80005ec2:	e799                	bnez	a5,80005ed0 <install_trans+0xbe>
      bunpin(dbuf);
    80005ec4:	fd843503          	ld	a0,-40(s0)
    80005ec8:	fffff097          	auipc	ra,0xfffff
    80005ecc:	978080e7          	jalr	-1672(ra) # 80004840 <bunpin>
    brelse(lbuf);
    80005ed0:	fe043503          	ld	a0,-32(s0)
    80005ed4:	fffff097          	auipc	ra,0xfffff
    80005ed8:	836080e7          	jalr	-1994(ra) # 8000470a <brelse>
    brelse(dbuf);
    80005edc:	fd843503          	ld	a0,-40(s0)
    80005ee0:	fffff097          	auipc	ra,0xfffff
    80005ee4:	82a080e7          	jalr	-2006(ra) # 8000470a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80005ee8:	fec42783          	lw	a5,-20(s0)
    80005eec:	2785                	addiw	a5,a5,1
    80005eee:	fef42623          	sw	a5,-20(s0)
    80005ef2:	0001e797          	auipc	a5,0x1e
    80005ef6:	37678793          	addi	a5,a5,886 # 80024268 <log>
    80005efa:	57d8                	lw	a4,44(a5)
    80005efc:	fec42783          	lw	a5,-20(s0)
    80005f00:	2781                	sext.w	a5,a5
    80005f02:	f2e7c2e3          	blt	a5,a4,80005e26 <install_trans+0x14>
  }
}
    80005f06:	0001                	nop
    80005f08:	0001                	nop
    80005f0a:	70e2                	ld	ra,56(sp)
    80005f0c:	7442                	ld	s0,48(sp)
    80005f0e:	6121                	addi	sp,sp,64
    80005f10:	8082                	ret

0000000080005f12 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80005f12:	7179                	addi	sp,sp,-48
    80005f14:	f406                	sd	ra,40(sp)
    80005f16:	f022                	sd	s0,32(sp)
    80005f18:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80005f1a:	0001e797          	auipc	a5,0x1e
    80005f1e:	34e78793          	addi	a5,a5,846 # 80024268 <log>
    80005f22:	579c                	lw	a5,40(a5)
    80005f24:	0007871b          	sext.w	a4,a5
    80005f28:	0001e797          	auipc	a5,0x1e
    80005f2c:	34078793          	addi	a5,a5,832 # 80024268 <log>
    80005f30:	4f9c                	lw	a5,24(a5)
    80005f32:	2781                	sext.w	a5,a5
    80005f34:	85be                	mv	a1,a5
    80005f36:	853a                	mv	a0,a4
    80005f38:	ffffe097          	auipc	ra,0xffffe
    80005f3c:	730080e7          	jalr	1840(ra) # 80004668 <bread>
    80005f40:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80005f44:	fe043783          	ld	a5,-32(s0)
    80005f48:	05878793          	addi	a5,a5,88
    80005f4c:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80005f50:	fd843783          	ld	a5,-40(s0)
    80005f54:	4398                	lw	a4,0(a5)
    80005f56:	0001e797          	auipc	a5,0x1e
    80005f5a:	31278793          	addi	a5,a5,786 # 80024268 <log>
    80005f5e:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80005f60:	fe042623          	sw	zero,-20(s0)
    80005f64:	a03d                	j	80005f92 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80005f66:	fd843703          	ld	a4,-40(s0)
    80005f6a:	fec42783          	lw	a5,-20(s0)
    80005f6e:	078a                	slli	a5,a5,0x2
    80005f70:	97ba                	add	a5,a5,a4
    80005f72:	43d8                	lw	a4,4(a5)
    80005f74:	0001e697          	auipc	a3,0x1e
    80005f78:	2f468693          	addi	a3,a3,756 # 80024268 <log>
    80005f7c:	fec42783          	lw	a5,-20(s0)
    80005f80:	07a1                	addi	a5,a5,8
    80005f82:	078a                	slli	a5,a5,0x2
    80005f84:	97b6                	add	a5,a5,a3
    80005f86:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80005f88:	fec42783          	lw	a5,-20(s0)
    80005f8c:	2785                	addiw	a5,a5,1
    80005f8e:	fef42623          	sw	a5,-20(s0)
    80005f92:	0001e797          	auipc	a5,0x1e
    80005f96:	2d678793          	addi	a5,a5,726 # 80024268 <log>
    80005f9a:	57d8                	lw	a4,44(a5)
    80005f9c:	fec42783          	lw	a5,-20(s0)
    80005fa0:	2781                	sext.w	a5,a5
    80005fa2:	fce7c2e3          	blt	a5,a4,80005f66 <read_head+0x54>
  }
  brelse(buf);
    80005fa6:	fe043503          	ld	a0,-32(s0)
    80005faa:	ffffe097          	auipc	ra,0xffffe
    80005fae:	760080e7          	jalr	1888(ra) # 8000470a <brelse>
}
    80005fb2:	0001                	nop
    80005fb4:	70a2                	ld	ra,40(sp)
    80005fb6:	7402                	ld	s0,32(sp)
    80005fb8:	6145                	addi	sp,sp,48
    80005fba:	8082                	ret

0000000080005fbc <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80005fbc:	7179                	addi	sp,sp,-48
    80005fbe:	f406                	sd	ra,40(sp)
    80005fc0:	f022                	sd	s0,32(sp)
    80005fc2:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80005fc4:	0001e797          	auipc	a5,0x1e
    80005fc8:	2a478793          	addi	a5,a5,676 # 80024268 <log>
    80005fcc:	579c                	lw	a5,40(a5)
    80005fce:	0007871b          	sext.w	a4,a5
    80005fd2:	0001e797          	auipc	a5,0x1e
    80005fd6:	29678793          	addi	a5,a5,662 # 80024268 <log>
    80005fda:	4f9c                	lw	a5,24(a5)
    80005fdc:	2781                	sext.w	a5,a5
    80005fde:	85be                	mv	a1,a5
    80005fe0:	853a                	mv	a0,a4
    80005fe2:	ffffe097          	auipc	ra,0xffffe
    80005fe6:	686080e7          	jalr	1670(ra) # 80004668 <bread>
    80005fea:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80005fee:	fe043783          	ld	a5,-32(s0)
    80005ff2:	05878793          	addi	a5,a5,88
    80005ff6:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    80005ffa:	0001e797          	auipc	a5,0x1e
    80005ffe:	26e78793          	addi	a5,a5,622 # 80024268 <log>
    80006002:	57d8                	lw	a4,44(a5)
    80006004:	fd843783          	ld	a5,-40(s0)
    80006008:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000600a:	fe042623          	sw	zero,-20(s0)
    8000600e:	a03d                	j	8000603c <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006010:	0001e717          	auipc	a4,0x1e
    80006014:	25870713          	addi	a4,a4,600 # 80024268 <log>
    80006018:	fec42783          	lw	a5,-20(s0)
    8000601c:	07a1                	addi	a5,a5,8
    8000601e:	078a                	slli	a5,a5,0x2
    80006020:	97ba                	add	a5,a5,a4
    80006022:	4b98                	lw	a4,16(a5)
    80006024:	fd843683          	ld	a3,-40(s0)
    80006028:	fec42783          	lw	a5,-20(s0)
    8000602c:	078a                	slli	a5,a5,0x2
    8000602e:	97b6                	add	a5,a5,a3
    80006030:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006032:	fec42783          	lw	a5,-20(s0)
    80006036:	2785                	addiw	a5,a5,1
    80006038:	fef42623          	sw	a5,-20(s0)
    8000603c:	0001e797          	auipc	a5,0x1e
    80006040:	22c78793          	addi	a5,a5,556 # 80024268 <log>
    80006044:	57d8                	lw	a4,44(a5)
    80006046:	fec42783          	lw	a5,-20(s0)
    8000604a:	2781                	sext.w	a5,a5
    8000604c:	fce7c2e3          	blt	a5,a4,80006010 <write_head+0x54>
  }
  bwrite(buf);
    80006050:	fe043503          	ld	a0,-32(s0)
    80006054:	ffffe097          	auipc	ra,0xffffe
    80006058:	66e080e7          	jalr	1646(ra) # 800046c2 <bwrite>
  brelse(buf);
    8000605c:	fe043503          	ld	a0,-32(s0)
    80006060:	ffffe097          	auipc	ra,0xffffe
    80006064:	6aa080e7          	jalr	1706(ra) # 8000470a <brelse>
}
    80006068:	0001                	nop
    8000606a:	70a2                	ld	ra,40(sp)
    8000606c:	7402                	ld	s0,32(sp)
    8000606e:	6145                	addi	sp,sp,48
    80006070:	8082                	ret

0000000080006072 <recover_from_log>:

static void
recover_from_log(void)
{
    80006072:	1141                	addi	sp,sp,-16
    80006074:	e406                	sd	ra,8(sp)
    80006076:	e022                	sd	s0,0(sp)
    80006078:	0800                	addi	s0,sp,16
  read_head();
    8000607a:	00000097          	auipc	ra,0x0
    8000607e:	e98080e7          	jalr	-360(ra) # 80005f12 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006082:	4505                	li	a0,1
    80006084:	00000097          	auipc	ra,0x0
    80006088:	d8e080e7          	jalr	-626(ra) # 80005e12 <install_trans>
  log.lh.n = 0;
    8000608c:	0001e797          	auipc	a5,0x1e
    80006090:	1dc78793          	addi	a5,a5,476 # 80024268 <log>
    80006094:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006098:	00000097          	auipc	ra,0x0
    8000609c:	f24080e7          	jalr	-220(ra) # 80005fbc <write_head>
}
    800060a0:	0001                	nop
    800060a2:	60a2                	ld	ra,8(sp)
    800060a4:	6402                	ld	s0,0(sp)
    800060a6:	0141                	addi	sp,sp,16
    800060a8:	8082                	ret

00000000800060aa <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800060aa:	1141                	addi	sp,sp,-16
    800060ac:	e406                	sd	ra,8(sp)
    800060ae:	e022                	sd	s0,0(sp)
    800060b0:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800060b2:	0001e517          	auipc	a0,0x1e
    800060b6:	1b650513          	addi	a0,a0,438 # 80024268 <log>
    800060ba:	ffffb097          	auipc	ra,0xffffb
    800060be:	1b4080e7          	jalr	436(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    800060c2:	0001e797          	auipc	a5,0x1e
    800060c6:	1a678793          	addi	a5,a5,422 # 80024268 <log>
    800060ca:	53dc                	lw	a5,36(a5)
    800060cc:	cf91                	beqz	a5,800060e8 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800060ce:	0001e597          	auipc	a1,0x1e
    800060d2:	19a58593          	addi	a1,a1,410 # 80024268 <log>
    800060d6:	0001e517          	auipc	a0,0x1e
    800060da:	19250513          	addi	a0,a0,402 # 80024268 <log>
    800060de:	ffffd097          	auipc	ra,0xffffd
    800060e2:	37a080e7          	jalr	890(ra) # 80003458 <sleep>
    800060e6:	bff1                	j	800060c2 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800060e8:	0001e797          	auipc	a5,0x1e
    800060ec:	18078793          	addi	a5,a5,384 # 80024268 <log>
    800060f0:	57d8                	lw	a4,44(a5)
    800060f2:	0001e797          	auipc	a5,0x1e
    800060f6:	17678793          	addi	a5,a5,374 # 80024268 <log>
    800060fa:	539c                	lw	a5,32(a5)
    800060fc:	2785                	addiw	a5,a5,1
    800060fe:	2781                	sext.w	a5,a5
    80006100:	86be                	mv	a3,a5
    80006102:	87b6                	mv	a5,a3
    80006104:	0027979b          	slliw	a5,a5,0x2
    80006108:	9fb5                	addw	a5,a5,a3
    8000610a:	0017979b          	slliw	a5,a5,0x1
    8000610e:	2781                	sext.w	a5,a5
    80006110:	9fb9                	addw	a5,a5,a4
    80006112:	2781                	sext.w	a5,a5
    80006114:	873e                	mv	a4,a5
    80006116:	47f9                	li	a5,30
    80006118:	00e7df63          	bge	a5,a4,80006136 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000611c:	0001e597          	auipc	a1,0x1e
    80006120:	14c58593          	addi	a1,a1,332 # 80024268 <log>
    80006124:	0001e517          	auipc	a0,0x1e
    80006128:	14450513          	addi	a0,a0,324 # 80024268 <log>
    8000612c:	ffffd097          	auipc	ra,0xffffd
    80006130:	32c080e7          	jalr	812(ra) # 80003458 <sleep>
    80006134:	b779                	j	800060c2 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006136:	0001e797          	auipc	a5,0x1e
    8000613a:	13278793          	addi	a5,a5,306 # 80024268 <log>
    8000613e:	539c                	lw	a5,32(a5)
    80006140:	2785                	addiw	a5,a5,1
    80006142:	0007871b          	sext.w	a4,a5
    80006146:	0001e797          	auipc	a5,0x1e
    8000614a:	12278793          	addi	a5,a5,290 # 80024268 <log>
    8000614e:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006150:	0001e517          	auipc	a0,0x1e
    80006154:	11850513          	addi	a0,a0,280 # 80024268 <log>
    80006158:	ffffb097          	auipc	ra,0xffffb
    8000615c:	17a080e7          	jalr	378(ra) # 800012d2 <release>
      break;
    80006160:	0001                	nop
    }
  }
}
    80006162:	0001                	nop
    80006164:	60a2                	ld	ra,8(sp)
    80006166:	6402                	ld	s0,0(sp)
    80006168:	0141                	addi	sp,sp,16
    8000616a:	8082                	ret

000000008000616c <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000616c:	1101                	addi	sp,sp,-32
    8000616e:	ec06                	sd	ra,24(sp)
    80006170:	e822                	sd	s0,16(sp)
    80006172:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006174:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006178:	0001e517          	auipc	a0,0x1e
    8000617c:	0f050513          	addi	a0,a0,240 # 80024268 <log>
    80006180:	ffffb097          	auipc	ra,0xffffb
    80006184:	0ee080e7          	jalr	238(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    80006188:	0001e797          	auipc	a5,0x1e
    8000618c:	0e078793          	addi	a5,a5,224 # 80024268 <log>
    80006190:	539c                	lw	a5,32(a5)
    80006192:	37fd                	addiw	a5,a5,-1
    80006194:	0007871b          	sext.w	a4,a5
    80006198:	0001e797          	auipc	a5,0x1e
    8000619c:	0d078793          	addi	a5,a5,208 # 80024268 <log>
    800061a0:	d398                	sw	a4,32(a5)
  if(log.committing)
    800061a2:	0001e797          	auipc	a5,0x1e
    800061a6:	0c678793          	addi	a5,a5,198 # 80024268 <log>
    800061aa:	53dc                	lw	a5,36(a5)
    800061ac:	cb89                	beqz	a5,800061be <end_op+0x52>
    panic("log.committing");
    800061ae:	00005517          	auipc	a0,0x5
    800061b2:	39a50513          	addi	a0,a0,922 # 8000b548 <etext+0x548>
    800061b6:	ffffb097          	auipc	ra,0xffffb
    800061ba:	ac8080e7          	jalr	-1336(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    800061be:	0001e797          	auipc	a5,0x1e
    800061c2:	0aa78793          	addi	a5,a5,170 # 80024268 <log>
    800061c6:	539c                	lw	a5,32(a5)
    800061c8:	eb99                	bnez	a5,800061de <end_op+0x72>
    do_commit = 1;
    800061ca:	4785                	li	a5,1
    800061cc:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800061d0:	0001e797          	auipc	a5,0x1e
    800061d4:	09878793          	addi	a5,a5,152 # 80024268 <log>
    800061d8:	4705                	li	a4,1
    800061da:	d3d8                	sw	a4,36(a5)
    800061dc:	a809                	j	800061ee <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800061de:	0001e517          	auipc	a0,0x1e
    800061e2:	08a50513          	addi	a0,a0,138 # 80024268 <log>
    800061e6:	ffffd097          	auipc	ra,0xffffd
    800061ea:	2ee080e7          	jalr	750(ra) # 800034d4 <wakeup>
  }
  release(&log.lock);
    800061ee:	0001e517          	auipc	a0,0x1e
    800061f2:	07a50513          	addi	a0,a0,122 # 80024268 <log>
    800061f6:	ffffb097          	auipc	ra,0xffffb
    800061fa:	0dc080e7          	jalr	220(ra) # 800012d2 <release>

  if(do_commit){
    800061fe:	fec42783          	lw	a5,-20(s0)
    80006202:	2781                	sext.w	a5,a5
    80006204:	c3b9                	beqz	a5,8000624a <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006206:	00000097          	auipc	ra,0x0
    8000620a:	134080e7          	jalr	308(ra) # 8000633a <commit>
    acquire(&log.lock);
    8000620e:	0001e517          	auipc	a0,0x1e
    80006212:	05a50513          	addi	a0,a0,90 # 80024268 <log>
    80006216:	ffffb097          	auipc	ra,0xffffb
    8000621a:	058080e7          	jalr	88(ra) # 8000126e <acquire>
    log.committing = 0;
    8000621e:	0001e797          	auipc	a5,0x1e
    80006222:	04a78793          	addi	a5,a5,74 # 80024268 <log>
    80006226:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000622a:	0001e517          	auipc	a0,0x1e
    8000622e:	03e50513          	addi	a0,a0,62 # 80024268 <log>
    80006232:	ffffd097          	auipc	ra,0xffffd
    80006236:	2a2080e7          	jalr	674(ra) # 800034d4 <wakeup>
    release(&log.lock);
    8000623a:	0001e517          	auipc	a0,0x1e
    8000623e:	02e50513          	addi	a0,a0,46 # 80024268 <log>
    80006242:	ffffb097          	auipc	ra,0xffffb
    80006246:	090080e7          	jalr	144(ra) # 800012d2 <release>
  }
}
    8000624a:	0001                	nop
    8000624c:	60e2                	ld	ra,24(sp)
    8000624e:	6442                	ld	s0,16(sp)
    80006250:	6105                	addi	sp,sp,32
    80006252:	8082                	ret

0000000080006254 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006254:	7179                	addi	sp,sp,-48
    80006256:	f406                	sd	ra,40(sp)
    80006258:	f022                	sd	s0,32(sp)
    8000625a:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000625c:	fe042623          	sw	zero,-20(s0)
    80006260:	a86d                	j	8000631a <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006262:	0001e797          	auipc	a5,0x1e
    80006266:	00678793          	addi	a5,a5,6 # 80024268 <log>
    8000626a:	579c                	lw	a5,40(a5)
    8000626c:	0007869b          	sext.w	a3,a5
    80006270:	0001e797          	auipc	a5,0x1e
    80006274:	ff878793          	addi	a5,a5,-8 # 80024268 <log>
    80006278:	4f9c                	lw	a5,24(a5)
    8000627a:	fec42703          	lw	a4,-20(s0)
    8000627e:	9fb9                	addw	a5,a5,a4
    80006280:	2781                	sext.w	a5,a5
    80006282:	2785                	addiw	a5,a5,1
    80006284:	2781                	sext.w	a5,a5
    80006286:	2781                	sext.w	a5,a5
    80006288:	85be                	mv	a1,a5
    8000628a:	8536                	mv	a0,a3
    8000628c:	ffffe097          	auipc	ra,0xffffe
    80006290:	3dc080e7          	jalr	988(ra) # 80004668 <bread>
    80006294:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006298:	0001e797          	auipc	a5,0x1e
    8000629c:	fd078793          	addi	a5,a5,-48 # 80024268 <log>
    800062a0:	579c                	lw	a5,40(a5)
    800062a2:	0007869b          	sext.w	a3,a5
    800062a6:	0001e717          	auipc	a4,0x1e
    800062aa:	fc270713          	addi	a4,a4,-62 # 80024268 <log>
    800062ae:	fec42783          	lw	a5,-20(s0)
    800062b2:	07a1                	addi	a5,a5,8
    800062b4:	078a                	slli	a5,a5,0x2
    800062b6:	97ba                	add	a5,a5,a4
    800062b8:	4b9c                	lw	a5,16(a5)
    800062ba:	2781                	sext.w	a5,a5
    800062bc:	85be                	mv	a1,a5
    800062be:	8536                	mv	a0,a3
    800062c0:	ffffe097          	auipc	ra,0xffffe
    800062c4:	3a8080e7          	jalr	936(ra) # 80004668 <bread>
    800062c8:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800062cc:	fe043783          	ld	a5,-32(s0)
    800062d0:	05878713          	addi	a4,a5,88
    800062d4:	fd843783          	ld	a5,-40(s0)
    800062d8:	05878793          	addi	a5,a5,88
    800062dc:	40000613          	li	a2,1024
    800062e0:	85be                	mv	a1,a5
    800062e2:	853a                	mv	a0,a4
    800062e4:	ffffb097          	auipc	ra,0xffffb
    800062e8:	242080e7          	jalr	578(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    800062ec:	fe043503          	ld	a0,-32(s0)
    800062f0:	ffffe097          	auipc	ra,0xffffe
    800062f4:	3d2080e7          	jalr	978(ra) # 800046c2 <bwrite>
    brelse(from);
    800062f8:	fd843503          	ld	a0,-40(s0)
    800062fc:	ffffe097          	auipc	ra,0xffffe
    80006300:	40e080e7          	jalr	1038(ra) # 8000470a <brelse>
    brelse(to);
    80006304:	fe043503          	ld	a0,-32(s0)
    80006308:	ffffe097          	auipc	ra,0xffffe
    8000630c:	402080e7          	jalr	1026(ra) # 8000470a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006310:	fec42783          	lw	a5,-20(s0)
    80006314:	2785                	addiw	a5,a5,1
    80006316:	fef42623          	sw	a5,-20(s0)
    8000631a:	0001e797          	auipc	a5,0x1e
    8000631e:	f4e78793          	addi	a5,a5,-178 # 80024268 <log>
    80006322:	57d8                	lw	a4,44(a5)
    80006324:	fec42783          	lw	a5,-20(s0)
    80006328:	2781                	sext.w	a5,a5
    8000632a:	f2e7cce3          	blt	a5,a4,80006262 <write_log+0xe>
  }
}
    8000632e:	0001                	nop
    80006330:	0001                	nop
    80006332:	70a2                	ld	ra,40(sp)
    80006334:	7402                	ld	s0,32(sp)
    80006336:	6145                	addi	sp,sp,48
    80006338:	8082                	ret

000000008000633a <commit>:

static void
commit()
{
    8000633a:	1141                	addi	sp,sp,-16
    8000633c:	e406                	sd	ra,8(sp)
    8000633e:	e022                	sd	s0,0(sp)
    80006340:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006342:	0001e797          	auipc	a5,0x1e
    80006346:	f2678793          	addi	a5,a5,-218 # 80024268 <log>
    8000634a:	57dc                	lw	a5,44(a5)
    8000634c:	02f05963          	blez	a5,8000637e <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006350:	00000097          	auipc	ra,0x0
    80006354:	f04080e7          	jalr	-252(ra) # 80006254 <write_log>
    write_head();    // Write header to disk -- the real commit
    80006358:	00000097          	auipc	ra,0x0
    8000635c:	c64080e7          	jalr	-924(ra) # 80005fbc <write_head>
    install_trans(0); // Now install writes to home locations
    80006360:	4501                	li	a0,0
    80006362:	00000097          	auipc	ra,0x0
    80006366:	ab0080e7          	jalr	-1360(ra) # 80005e12 <install_trans>
    log.lh.n = 0;
    8000636a:	0001e797          	auipc	a5,0x1e
    8000636e:	efe78793          	addi	a5,a5,-258 # 80024268 <log>
    80006372:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006376:	00000097          	auipc	ra,0x0
    8000637a:	c46080e7          	jalr	-954(ra) # 80005fbc <write_head>
  }
}
    8000637e:	0001                	nop
    80006380:	60a2                	ld	ra,8(sp)
    80006382:	6402                	ld	s0,0(sp)
    80006384:	0141                	addi	sp,sp,16
    80006386:	8082                	ret

0000000080006388 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006388:	7179                	addi	sp,sp,-48
    8000638a:	f406                	sd	ra,40(sp)
    8000638c:	f022                	sd	s0,32(sp)
    8000638e:	1800                	addi	s0,sp,48
    80006390:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006394:	0001e517          	auipc	a0,0x1e
    80006398:	ed450513          	addi	a0,a0,-300 # 80024268 <log>
    8000639c:	ffffb097          	auipc	ra,0xffffb
    800063a0:	ed2080e7          	jalr	-302(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800063a4:	0001e797          	auipc	a5,0x1e
    800063a8:	ec478793          	addi	a5,a5,-316 # 80024268 <log>
    800063ac:	57dc                	lw	a5,44(a5)
    800063ae:	873e                	mv	a4,a5
    800063b0:	47f5                	li	a5,29
    800063b2:	02e7c063          	blt	a5,a4,800063d2 <log_write+0x4a>
    800063b6:	0001e797          	auipc	a5,0x1e
    800063ba:	eb278793          	addi	a5,a5,-334 # 80024268 <log>
    800063be:	57d8                	lw	a4,44(a5)
    800063c0:	0001e797          	auipc	a5,0x1e
    800063c4:	ea878793          	addi	a5,a5,-344 # 80024268 <log>
    800063c8:	4fdc                	lw	a5,28(a5)
    800063ca:	37fd                	addiw	a5,a5,-1
    800063cc:	2781                	sext.w	a5,a5
    800063ce:	00f74a63          	blt	a4,a5,800063e2 <log_write+0x5a>
    panic("too big a transaction");
    800063d2:	00005517          	auipc	a0,0x5
    800063d6:	18650513          	addi	a0,a0,390 # 8000b558 <etext+0x558>
    800063da:	ffffb097          	auipc	ra,0xffffb
    800063de:	8a4080e7          	jalr	-1884(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    800063e2:	0001e797          	auipc	a5,0x1e
    800063e6:	e8678793          	addi	a5,a5,-378 # 80024268 <log>
    800063ea:	539c                	lw	a5,32(a5)
    800063ec:	00f04a63          	bgtz	a5,80006400 <log_write+0x78>
    panic("log_write outside of trans");
    800063f0:	00005517          	auipc	a0,0x5
    800063f4:	18050513          	addi	a0,a0,384 # 8000b570 <etext+0x570>
    800063f8:	ffffb097          	auipc	ra,0xffffb
    800063fc:	886080e7          	jalr	-1914(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006400:	fe042623          	sw	zero,-20(s0)
    80006404:	a03d                	j	80006432 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006406:	0001e717          	auipc	a4,0x1e
    8000640a:	e6270713          	addi	a4,a4,-414 # 80024268 <log>
    8000640e:	fec42783          	lw	a5,-20(s0)
    80006412:	07a1                	addi	a5,a5,8
    80006414:	078a                	slli	a5,a5,0x2
    80006416:	97ba                	add	a5,a5,a4
    80006418:	4b9c                	lw	a5,16(a5)
    8000641a:	0007871b          	sext.w	a4,a5
    8000641e:	fd843783          	ld	a5,-40(s0)
    80006422:	47dc                	lw	a5,12(a5)
    80006424:	02f70263          	beq	a4,a5,80006448 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006428:	fec42783          	lw	a5,-20(s0)
    8000642c:	2785                	addiw	a5,a5,1
    8000642e:	fef42623          	sw	a5,-20(s0)
    80006432:	0001e797          	auipc	a5,0x1e
    80006436:	e3678793          	addi	a5,a5,-458 # 80024268 <log>
    8000643a:	57d8                	lw	a4,44(a5)
    8000643c:	fec42783          	lw	a5,-20(s0)
    80006440:	2781                	sext.w	a5,a5
    80006442:	fce7c2e3          	blt	a5,a4,80006406 <log_write+0x7e>
    80006446:	a011                	j	8000644a <log_write+0xc2>
      break;
    80006448:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000644a:	fd843783          	ld	a5,-40(s0)
    8000644e:	47dc                	lw	a5,12(a5)
    80006450:	0007871b          	sext.w	a4,a5
    80006454:	0001e697          	auipc	a3,0x1e
    80006458:	e1468693          	addi	a3,a3,-492 # 80024268 <log>
    8000645c:	fec42783          	lw	a5,-20(s0)
    80006460:	07a1                	addi	a5,a5,8
    80006462:	078a                	slli	a5,a5,0x2
    80006464:	97b6                	add	a5,a5,a3
    80006466:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006468:	0001e797          	auipc	a5,0x1e
    8000646c:	e0078793          	addi	a5,a5,-512 # 80024268 <log>
    80006470:	57d8                	lw	a4,44(a5)
    80006472:	fec42783          	lw	a5,-20(s0)
    80006476:	2781                	sext.w	a5,a5
    80006478:	02e79563          	bne	a5,a4,800064a2 <log_write+0x11a>
    bpin(b);
    8000647c:	fd843503          	ld	a0,-40(s0)
    80006480:	ffffe097          	auipc	ra,0xffffe
    80006484:	378080e7          	jalr	888(ra) # 800047f8 <bpin>
    log.lh.n++;
    80006488:	0001e797          	auipc	a5,0x1e
    8000648c:	de078793          	addi	a5,a5,-544 # 80024268 <log>
    80006490:	57dc                	lw	a5,44(a5)
    80006492:	2785                	addiw	a5,a5,1
    80006494:	0007871b          	sext.w	a4,a5
    80006498:	0001e797          	auipc	a5,0x1e
    8000649c:	dd078793          	addi	a5,a5,-560 # 80024268 <log>
    800064a0:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800064a2:	0001e517          	auipc	a0,0x1e
    800064a6:	dc650513          	addi	a0,a0,-570 # 80024268 <log>
    800064aa:	ffffb097          	auipc	ra,0xffffb
    800064ae:	e28080e7          	jalr	-472(ra) # 800012d2 <release>
}
    800064b2:	0001                	nop
    800064b4:	70a2                	ld	ra,40(sp)
    800064b6:	7402                	ld	s0,32(sp)
    800064b8:	6145                	addi	sp,sp,48
    800064ba:	8082                	ret

00000000800064bc <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    800064bc:	1101                	addi	sp,sp,-32
    800064be:	ec06                	sd	ra,24(sp)
    800064c0:	e822                	sd	s0,16(sp)
    800064c2:	1000                	addi	s0,sp,32
    800064c4:	fea43423          	sd	a0,-24(s0)
    800064c8:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800064cc:	fe843783          	ld	a5,-24(s0)
    800064d0:	07a1                	addi	a5,a5,8
    800064d2:	00005597          	auipc	a1,0x5
    800064d6:	0be58593          	addi	a1,a1,190 # 8000b590 <etext+0x590>
    800064da:	853e                	mv	a0,a5
    800064dc:	ffffb097          	auipc	ra,0xffffb
    800064e0:	d62080e7          	jalr	-670(ra) # 8000123e <initlock>
  lk->name = name;
    800064e4:	fe843783          	ld	a5,-24(s0)
    800064e8:	fe043703          	ld	a4,-32(s0)
    800064ec:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800064ee:	fe843783          	ld	a5,-24(s0)
    800064f2:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800064f6:	fe843783          	ld	a5,-24(s0)
    800064fa:	0207a423          	sw	zero,40(a5)
}
    800064fe:	0001                	nop
    80006500:	60e2                	ld	ra,24(sp)
    80006502:	6442                	ld	s0,16(sp)
    80006504:	6105                	addi	sp,sp,32
    80006506:	8082                	ret

0000000080006508 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006508:	1101                	addi	sp,sp,-32
    8000650a:	ec06                	sd	ra,24(sp)
    8000650c:	e822                	sd	s0,16(sp)
    8000650e:	1000                	addi	s0,sp,32
    80006510:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006514:	fe843783          	ld	a5,-24(s0)
    80006518:	07a1                	addi	a5,a5,8
    8000651a:	853e                	mv	a0,a5
    8000651c:	ffffb097          	auipc	ra,0xffffb
    80006520:	d52080e7          	jalr	-686(ra) # 8000126e <acquire>
  while (lk->locked) {
    80006524:	a819                	j	8000653a <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006526:	fe843783          	ld	a5,-24(s0)
    8000652a:	07a1                	addi	a5,a5,8
    8000652c:	85be                	mv	a1,a5
    8000652e:	fe843503          	ld	a0,-24(s0)
    80006532:	ffffd097          	auipc	ra,0xffffd
    80006536:	f26080e7          	jalr	-218(ra) # 80003458 <sleep>
  while (lk->locked) {
    8000653a:	fe843783          	ld	a5,-24(s0)
    8000653e:	439c                	lw	a5,0(a5)
    80006540:	f3fd                	bnez	a5,80006526 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006542:	fe843783          	ld	a5,-24(s0)
    80006546:	4705                	li	a4,1
    80006548:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000654a:	ffffc097          	auipc	ra,0xffffc
    8000654e:	2ca080e7          	jalr	714(ra) # 80002814 <myproc>
    80006552:	87aa                	mv	a5,a0
    80006554:	5b98                	lw	a4,48(a5)
    80006556:	fe843783          	ld	a5,-24(s0)
    8000655a:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    8000655c:	fe843783          	ld	a5,-24(s0)
    80006560:	07a1                	addi	a5,a5,8
    80006562:	853e                	mv	a0,a5
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	d6e080e7          	jalr	-658(ra) # 800012d2 <release>
}
    8000656c:	0001                	nop
    8000656e:	60e2                	ld	ra,24(sp)
    80006570:	6442                	ld	s0,16(sp)
    80006572:	6105                	addi	sp,sp,32
    80006574:	8082                	ret

0000000080006576 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006576:	1101                	addi	sp,sp,-32
    80006578:	ec06                	sd	ra,24(sp)
    8000657a:	e822                	sd	s0,16(sp)
    8000657c:	1000                	addi	s0,sp,32
    8000657e:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006582:	fe843783          	ld	a5,-24(s0)
    80006586:	07a1                	addi	a5,a5,8
    80006588:	853e                	mv	a0,a5
    8000658a:	ffffb097          	auipc	ra,0xffffb
    8000658e:	ce4080e7          	jalr	-796(ra) # 8000126e <acquire>
  lk->locked = 0;
    80006592:	fe843783          	ld	a5,-24(s0)
    80006596:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000659a:	fe843783          	ld	a5,-24(s0)
    8000659e:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800065a2:	fe843503          	ld	a0,-24(s0)
    800065a6:	ffffd097          	auipc	ra,0xffffd
    800065aa:	f2e080e7          	jalr	-210(ra) # 800034d4 <wakeup>
  release(&lk->lk);
    800065ae:	fe843783          	ld	a5,-24(s0)
    800065b2:	07a1                	addi	a5,a5,8
    800065b4:	853e                	mv	a0,a5
    800065b6:	ffffb097          	auipc	ra,0xffffb
    800065ba:	d1c080e7          	jalr	-740(ra) # 800012d2 <release>
}
    800065be:	0001                	nop
    800065c0:	60e2                	ld	ra,24(sp)
    800065c2:	6442                	ld	s0,16(sp)
    800065c4:	6105                	addi	sp,sp,32
    800065c6:	8082                	ret

00000000800065c8 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800065c8:	7139                	addi	sp,sp,-64
    800065ca:	fc06                	sd	ra,56(sp)
    800065cc:	f822                	sd	s0,48(sp)
    800065ce:	f426                	sd	s1,40(sp)
    800065d0:	0080                	addi	s0,sp,64
    800065d2:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800065d6:	fc843783          	ld	a5,-56(s0)
    800065da:	07a1                	addi	a5,a5,8
    800065dc:	853e                	mv	a0,a5
    800065de:	ffffb097          	auipc	ra,0xffffb
    800065e2:	c90080e7          	jalr	-880(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800065e6:	fc843783          	ld	a5,-56(s0)
    800065ea:	439c                	lw	a5,0(a5)
    800065ec:	cf99                	beqz	a5,8000660a <holdingsleep+0x42>
    800065ee:	fc843783          	ld	a5,-56(s0)
    800065f2:	5784                	lw	s1,40(a5)
    800065f4:	ffffc097          	auipc	ra,0xffffc
    800065f8:	220080e7          	jalr	544(ra) # 80002814 <myproc>
    800065fc:	87aa                	mv	a5,a0
    800065fe:	5b9c                	lw	a5,48(a5)
    80006600:	8726                	mv	a4,s1
    80006602:	00f71463          	bne	a4,a5,8000660a <holdingsleep+0x42>
    80006606:	4785                	li	a5,1
    80006608:	a011                	j	8000660c <holdingsleep+0x44>
    8000660a:	4781                	li	a5,0
    8000660c:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006610:	fc843783          	ld	a5,-56(s0)
    80006614:	07a1                	addi	a5,a5,8
    80006616:	853e                	mv	a0,a5
    80006618:	ffffb097          	auipc	ra,0xffffb
    8000661c:	cba080e7          	jalr	-838(ra) # 800012d2 <release>
  return r;
    80006620:	fdc42783          	lw	a5,-36(s0)
}
    80006624:	853e                	mv	a0,a5
    80006626:	70e2                	ld	ra,56(sp)
    80006628:	7442                	ld	s0,48(sp)
    8000662a:	74a2                	ld	s1,40(sp)
    8000662c:	6121                	addi	sp,sp,64
    8000662e:	8082                	ret

0000000080006630 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006630:	1141                	addi	sp,sp,-16
    80006632:	e406                	sd	ra,8(sp)
    80006634:	e022                	sd	s0,0(sp)
    80006636:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006638:	00005597          	auipc	a1,0x5
    8000663c:	f6858593          	addi	a1,a1,-152 # 8000b5a0 <etext+0x5a0>
    80006640:	0001e517          	auipc	a0,0x1e
    80006644:	d7050513          	addi	a0,a0,-656 # 800243b0 <ftable>
    80006648:	ffffb097          	auipc	ra,0xffffb
    8000664c:	bf6080e7          	jalr	-1034(ra) # 8000123e <initlock>
}
    80006650:	0001                	nop
    80006652:	60a2                	ld	ra,8(sp)
    80006654:	6402                	ld	s0,0(sp)
    80006656:	0141                	addi	sp,sp,16
    80006658:	8082                	ret

000000008000665a <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    8000665a:	1101                	addi	sp,sp,-32
    8000665c:	ec06                	sd	ra,24(sp)
    8000665e:	e822                	sd	s0,16(sp)
    80006660:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006662:	0001e517          	auipc	a0,0x1e
    80006666:	d4e50513          	addi	a0,a0,-690 # 800243b0 <ftable>
    8000666a:	ffffb097          	auipc	ra,0xffffb
    8000666e:	c04080e7          	jalr	-1020(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006672:	0001e797          	auipc	a5,0x1e
    80006676:	d5678793          	addi	a5,a5,-682 # 800243c8 <ftable+0x18>
    8000667a:	fef43423          	sd	a5,-24(s0)
    8000667e:	a815                	j	800066b2 <filealloc+0x58>
    if(f->ref == 0){
    80006680:	fe843783          	ld	a5,-24(s0)
    80006684:	43dc                	lw	a5,4(a5)
    80006686:	e385                	bnez	a5,800066a6 <filealloc+0x4c>
      f->ref = 1;
    80006688:	fe843783          	ld	a5,-24(s0)
    8000668c:	4705                	li	a4,1
    8000668e:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006690:	0001e517          	auipc	a0,0x1e
    80006694:	d2050513          	addi	a0,a0,-736 # 800243b0 <ftable>
    80006698:	ffffb097          	auipc	ra,0xffffb
    8000669c:	c3a080e7          	jalr	-966(ra) # 800012d2 <release>
      return f;
    800066a0:	fe843783          	ld	a5,-24(s0)
    800066a4:	a805                	j	800066d4 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800066a6:	fe843783          	ld	a5,-24(s0)
    800066aa:	02878793          	addi	a5,a5,40
    800066ae:	fef43423          	sd	a5,-24(s0)
    800066b2:	0001f797          	auipc	a5,0x1f
    800066b6:	cb678793          	addi	a5,a5,-842 # 80025368 <ftable+0xfb8>
    800066ba:	fe843703          	ld	a4,-24(s0)
    800066be:	fcf761e3          	bltu	a4,a5,80006680 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800066c2:	0001e517          	auipc	a0,0x1e
    800066c6:	cee50513          	addi	a0,a0,-786 # 800243b0 <ftable>
    800066ca:	ffffb097          	auipc	ra,0xffffb
    800066ce:	c08080e7          	jalr	-1016(ra) # 800012d2 <release>
  return 0;
    800066d2:	4781                	li	a5,0
}
    800066d4:	853e                	mv	a0,a5
    800066d6:	60e2                	ld	ra,24(sp)
    800066d8:	6442                	ld	s0,16(sp)
    800066da:	6105                	addi	sp,sp,32
    800066dc:	8082                	ret

00000000800066de <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800066de:	1101                	addi	sp,sp,-32
    800066e0:	ec06                	sd	ra,24(sp)
    800066e2:	e822                	sd	s0,16(sp)
    800066e4:	1000                	addi	s0,sp,32
    800066e6:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800066ea:	0001e517          	auipc	a0,0x1e
    800066ee:	cc650513          	addi	a0,a0,-826 # 800243b0 <ftable>
    800066f2:	ffffb097          	auipc	ra,0xffffb
    800066f6:	b7c080e7          	jalr	-1156(ra) # 8000126e <acquire>
  if(f->ref < 1)
    800066fa:	fe843783          	ld	a5,-24(s0)
    800066fe:	43dc                	lw	a5,4(a5)
    80006700:	00f04a63          	bgtz	a5,80006714 <filedup+0x36>
    panic("filedup");
    80006704:	00005517          	auipc	a0,0x5
    80006708:	ea450513          	addi	a0,a0,-348 # 8000b5a8 <etext+0x5a8>
    8000670c:	ffffa097          	auipc	ra,0xffffa
    80006710:	572080e7          	jalr	1394(ra) # 80000c7e <panic>
  f->ref++;
    80006714:	fe843783          	ld	a5,-24(s0)
    80006718:	43dc                	lw	a5,4(a5)
    8000671a:	2785                	addiw	a5,a5,1
    8000671c:	0007871b          	sext.w	a4,a5
    80006720:	fe843783          	ld	a5,-24(s0)
    80006724:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006726:	0001e517          	auipc	a0,0x1e
    8000672a:	c8a50513          	addi	a0,a0,-886 # 800243b0 <ftable>
    8000672e:	ffffb097          	auipc	ra,0xffffb
    80006732:	ba4080e7          	jalr	-1116(ra) # 800012d2 <release>
  return f;
    80006736:	fe843783          	ld	a5,-24(s0)
}
    8000673a:	853e                	mv	a0,a5
    8000673c:	60e2                	ld	ra,24(sp)
    8000673e:	6442                	ld	s0,16(sp)
    80006740:	6105                	addi	sp,sp,32
    80006742:	8082                	ret

0000000080006744 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006744:	715d                	addi	sp,sp,-80
    80006746:	e486                	sd	ra,72(sp)
    80006748:	e0a2                	sd	s0,64(sp)
    8000674a:	0880                	addi	s0,sp,80
    8000674c:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006750:	0001e517          	auipc	a0,0x1e
    80006754:	c6050513          	addi	a0,a0,-928 # 800243b0 <ftable>
    80006758:	ffffb097          	auipc	ra,0xffffb
    8000675c:	b16080e7          	jalr	-1258(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006760:	fb843783          	ld	a5,-72(s0)
    80006764:	43dc                	lw	a5,4(a5)
    80006766:	00f04a63          	bgtz	a5,8000677a <fileclose+0x36>
    panic("fileclose");
    8000676a:	00005517          	auipc	a0,0x5
    8000676e:	e4650513          	addi	a0,a0,-442 # 8000b5b0 <etext+0x5b0>
    80006772:	ffffa097          	auipc	ra,0xffffa
    80006776:	50c080e7          	jalr	1292(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    8000677a:	fb843783          	ld	a5,-72(s0)
    8000677e:	43dc                	lw	a5,4(a5)
    80006780:	37fd                	addiw	a5,a5,-1
    80006782:	0007871b          	sext.w	a4,a5
    80006786:	fb843783          	ld	a5,-72(s0)
    8000678a:	c3d8                	sw	a4,4(a5)
    8000678c:	fb843783          	ld	a5,-72(s0)
    80006790:	43dc                	lw	a5,4(a5)
    80006792:	00f05b63          	blez	a5,800067a8 <fileclose+0x64>
    release(&ftable.lock);
    80006796:	0001e517          	auipc	a0,0x1e
    8000679a:	c1a50513          	addi	a0,a0,-998 # 800243b0 <ftable>
    8000679e:	ffffb097          	auipc	ra,0xffffb
    800067a2:	b34080e7          	jalr	-1228(ra) # 800012d2 <release>
    800067a6:	a879                	j	80006844 <fileclose+0x100>
    return;
  }
  ff = *f;
    800067a8:	fb843783          	ld	a5,-72(s0)
    800067ac:	638c                	ld	a1,0(a5)
    800067ae:	6790                	ld	a2,8(a5)
    800067b0:	6b94                	ld	a3,16(a5)
    800067b2:	6f98                	ld	a4,24(a5)
    800067b4:	739c                	ld	a5,32(a5)
    800067b6:	fcb43423          	sd	a1,-56(s0)
    800067ba:	fcc43823          	sd	a2,-48(s0)
    800067be:	fcd43c23          	sd	a3,-40(s0)
    800067c2:	fee43023          	sd	a4,-32(s0)
    800067c6:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    800067ca:	fb843783          	ld	a5,-72(s0)
    800067ce:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    800067d2:	fb843783          	ld	a5,-72(s0)
    800067d6:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    800067da:	0001e517          	auipc	a0,0x1e
    800067de:	bd650513          	addi	a0,a0,-1066 # 800243b0 <ftable>
    800067e2:	ffffb097          	auipc	ra,0xffffb
    800067e6:	af0080e7          	jalr	-1296(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    800067ea:	fc842783          	lw	a5,-56(s0)
    800067ee:	873e                	mv	a4,a5
    800067f0:	4785                	li	a5,1
    800067f2:	00f71e63          	bne	a4,a5,8000680e <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    800067f6:	fd843783          	ld	a5,-40(s0)
    800067fa:	fd144703          	lbu	a4,-47(s0)
    800067fe:	2701                	sext.w	a4,a4
    80006800:	85ba                	mv	a1,a4
    80006802:	853e                	mv	a0,a5
    80006804:	00000097          	auipc	ra,0x0
    80006808:	5aa080e7          	jalr	1450(ra) # 80006dae <pipeclose>
    8000680c:	a825                	j	80006844 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    8000680e:	fc842783          	lw	a5,-56(s0)
    80006812:	873e                	mv	a4,a5
    80006814:	4789                	li	a5,2
    80006816:	00f70863          	beq	a4,a5,80006826 <fileclose+0xe2>
    8000681a:	fc842783          	lw	a5,-56(s0)
    8000681e:	873e                	mv	a4,a5
    80006820:	478d                	li	a5,3
    80006822:	02f71163          	bne	a4,a5,80006844 <fileclose+0x100>
    begin_op();
    80006826:	00000097          	auipc	ra,0x0
    8000682a:	884080e7          	jalr	-1916(ra) # 800060aa <begin_op>
    iput(ff.ip);
    8000682e:	fe043783          	ld	a5,-32(s0)
    80006832:	853e                	mv	a0,a5
    80006834:	fffff097          	auipc	ra,0xfffff
    80006838:	9aa080e7          	jalr	-1622(ra) # 800051de <iput>
    end_op();
    8000683c:	00000097          	auipc	ra,0x0
    80006840:	930080e7          	jalr	-1744(ra) # 8000616c <end_op>
  }
}
    80006844:	60a6                	ld	ra,72(sp)
    80006846:	6406                	ld	s0,64(sp)
    80006848:	6161                	addi	sp,sp,80
    8000684a:	8082                	ret

000000008000684c <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    8000684c:	7139                	addi	sp,sp,-64
    8000684e:	fc06                	sd	ra,56(sp)
    80006850:	f822                	sd	s0,48(sp)
    80006852:	0080                	addi	s0,sp,64
    80006854:	fca43423          	sd	a0,-56(s0)
    80006858:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    8000685c:	ffffc097          	auipc	ra,0xffffc
    80006860:	fb8080e7          	jalr	-72(ra) # 80002814 <myproc>
    80006864:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006868:	fc843783          	ld	a5,-56(s0)
    8000686c:	439c                	lw	a5,0(a5)
    8000686e:	873e                	mv	a4,a5
    80006870:	4789                	li	a5,2
    80006872:	00f70963          	beq	a4,a5,80006884 <filestat+0x38>
    80006876:	fc843783          	ld	a5,-56(s0)
    8000687a:	439c                	lw	a5,0(a5)
    8000687c:	873e                	mv	a4,a5
    8000687e:	478d                	li	a5,3
    80006880:	06f71263          	bne	a4,a5,800068e4 <filestat+0x98>
    ilock(f->ip);
    80006884:	fc843783          	ld	a5,-56(s0)
    80006888:	6f9c                	ld	a5,24(a5)
    8000688a:	853e                	mv	a0,a5
    8000688c:	ffffe097          	auipc	ra,0xffffe
    80006890:	7c4080e7          	jalr	1988(ra) # 80005050 <ilock>
    stati(f->ip, &st);
    80006894:	fc843783          	ld	a5,-56(s0)
    80006898:	6f9c                	ld	a5,24(a5)
    8000689a:	fd040713          	addi	a4,s0,-48
    8000689e:	85ba                	mv	a1,a4
    800068a0:	853e                	mv	a0,a5
    800068a2:	fffff097          	auipc	ra,0xfffff
    800068a6:	ce0080e7          	jalr	-800(ra) # 80005582 <stati>
    iunlock(f->ip);
    800068aa:	fc843783          	ld	a5,-56(s0)
    800068ae:	6f9c                	ld	a5,24(a5)
    800068b0:	853e                	mv	a0,a5
    800068b2:	fffff097          	auipc	ra,0xfffff
    800068b6:	8d2080e7          	jalr	-1838(ra) # 80005184 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    800068ba:	fe843783          	ld	a5,-24(s0)
    800068be:	6bbc                	ld	a5,80(a5)
    800068c0:	fd040713          	addi	a4,s0,-48
    800068c4:	46e1                	li	a3,24
    800068c6:	863a                	mv	a2,a4
    800068c8:	fc043583          	ld	a1,-64(s0)
    800068cc:	853e                	mv	a0,a5
    800068ce:	ffffc097          	auipc	ra,0xffffc
    800068d2:	a18080e7          	jalr	-1512(ra) # 800022e6 <copyout>
    800068d6:	87aa                	mv	a5,a0
    800068d8:	0007d463          	bgez	a5,800068e0 <filestat+0x94>
      return -1;
    800068dc:	57fd                	li	a5,-1
    800068de:	a021                	j	800068e6 <filestat+0x9a>
    return 0;
    800068e0:	4781                	li	a5,0
    800068e2:	a011                	j	800068e6 <filestat+0x9a>
  }
  return -1;
    800068e4:	57fd                	li	a5,-1
}
    800068e6:	853e                	mv	a0,a5
    800068e8:	70e2                	ld	ra,56(sp)
    800068ea:	7442                	ld	s0,48(sp)
    800068ec:	6121                	addi	sp,sp,64
    800068ee:	8082                	ret

00000000800068f0 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    800068f0:	7139                	addi	sp,sp,-64
    800068f2:	fc06                	sd	ra,56(sp)
    800068f4:	f822                	sd	s0,48(sp)
    800068f6:	0080                	addi	s0,sp,64
    800068f8:	fca43c23          	sd	a0,-40(s0)
    800068fc:	fcb43823          	sd	a1,-48(s0)
    80006900:	87b2                	mv	a5,a2
    80006902:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006906:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    8000690a:	fd843783          	ld	a5,-40(s0)
    8000690e:	0087c783          	lbu	a5,8(a5)
    80006912:	e399                	bnez	a5,80006918 <fileread+0x28>
    return -1;
    80006914:	57fd                	li	a5,-1
    80006916:	aa1d                	j	80006a4c <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006918:	fd843783          	ld	a5,-40(s0)
    8000691c:	439c                	lw	a5,0(a5)
    8000691e:	873e                	mv	a4,a5
    80006920:	4785                	li	a5,1
    80006922:	02f71363          	bne	a4,a5,80006948 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006926:	fd843783          	ld	a5,-40(s0)
    8000692a:	6b9c                	ld	a5,16(a5)
    8000692c:	fcc42703          	lw	a4,-52(s0)
    80006930:	863a                	mv	a2,a4
    80006932:	fd043583          	ld	a1,-48(s0)
    80006936:	853e                	mv	a0,a5
    80006938:	00000097          	auipc	ra,0x0
    8000693c:	668080e7          	jalr	1640(ra) # 80006fa0 <piperead>
    80006940:	87aa                	mv	a5,a0
    80006942:	fef42623          	sw	a5,-20(s0)
    80006946:	a209                	j	80006a48 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006948:	fd843783          	ld	a5,-40(s0)
    8000694c:	439c                	lw	a5,0(a5)
    8000694e:	873e                	mv	a4,a5
    80006950:	478d                	li	a5,3
    80006952:	06f71863          	bne	a4,a5,800069c2 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006956:	fd843783          	ld	a5,-40(s0)
    8000695a:	02479783          	lh	a5,36(a5)
    8000695e:	2781                	sext.w	a5,a5
    80006960:	0207c863          	bltz	a5,80006990 <fileread+0xa0>
    80006964:	fd843783          	ld	a5,-40(s0)
    80006968:	02479783          	lh	a5,36(a5)
    8000696c:	0007871b          	sext.w	a4,a5
    80006970:	47a5                	li	a5,9
    80006972:	00e7cf63          	blt	a5,a4,80006990 <fileread+0xa0>
    80006976:	fd843783          	ld	a5,-40(s0)
    8000697a:	02479783          	lh	a5,36(a5)
    8000697e:	2781                	sext.w	a5,a5
    80006980:	0001e717          	auipc	a4,0x1e
    80006984:	99070713          	addi	a4,a4,-1648 # 80024310 <devsw>
    80006988:	0792                	slli	a5,a5,0x4
    8000698a:	97ba                	add	a5,a5,a4
    8000698c:	639c                	ld	a5,0(a5)
    8000698e:	e399                	bnez	a5,80006994 <fileread+0xa4>
      return -1;
    80006990:	57fd                	li	a5,-1
    80006992:	a86d                	j	80006a4c <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006994:	fd843783          	ld	a5,-40(s0)
    80006998:	02479783          	lh	a5,36(a5)
    8000699c:	2781                	sext.w	a5,a5
    8000699e:	0001e717          	auipc	a4,0x1e
    800069a2:	97270713          	addi	a4,a4,-1678 # 80024310 <devsw>
    800069a6:	0792                	slli	a5,a5,0x4
    800069a8:	97ba                	add	a5,a5,a4
    800069aa:	6398                	ld	a4,0(a5)
    800069ac:	fcc42783          	lw	a5,-52(s0)
    800069b0:	863e                	mv	a2,a5
    800069b2:	fd043583          	ld	a1,-48(s0)
    800069b6:	4505                	li	a0,1
    800069b8:	9702                	jalr	a4
    800069ba:	87aa                	mv	a5,a0
    800069bc:	fef42623          	sw	a5,-20(s0)
    800069c0:	a061                	j	80006a48 <fileread+0x158>
  } else if(f->type == FD_INODE){
    800069c2:	fd843783          	ld	a5,-40(s0)
    800069c6:	439c                	lw	a5,0(a5)
    800069c8:	873e                	mv	a4,a5
    800069ca:	4789                	li	a5,2
    800069cc:	06f71663          	bne	a4,a5,80006a38 <fileread+0x148>
    ilock(f->ip);
    800069d0:	fd843783          	ld	a5,-40(s0)
    800069d4:	6f9c                	ld	a5,24(a5)
    800069d6:	853e                	mv	a0,a5
    800069d8:	ffffe097          	auipc	ra,0xffffe
    800069dc:	678080e7          	jalr	1656(ra) # 80005050 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    800069e0:	fd843783          	ld	a5,-40(s0)
    800069e4:	6f88                	ld	a0,24(a5)
    800069e6:	fd843783          	ld	a5,-40(s0)
    800069ea:	539c                	lw	a5,32(a5)
    800069ec:	fcc42703          	lw	a4,-52(s0)
    800069f0:	86be                	mv	a3,a5
    800069f2:	fd043603          	ld	a2,-48(s0)
    800069f6:	4585                	li	a1,1
    800069f8:	fffff097          	auipc	ra,0xfffff
    800069fc:	bee080e7          	jalr	-1042(ra) # 800055e6 <readi>
    80006a00:	87aa                	mv	a5,a0
    80006a02:	fef42623          	sw	a5,-20(s0)
    80006a06:	fec42783          	lw	a5,-20(s0)
    80006a0a:	2781                	sext.w	a5,a5
    80006a0c:	00f05d63          	blez	a5,80006a26 <fileread+0x136>
      f->off += r;
    80006a10:	fd843783          	ld	a5,-40(s0)
    80006a14:	5398                	lw	a4,32(a5)
    80006a16:	fec42783          	lw	a5,-20(s0)
    80006a1a:	9fb9                	addw	a5,a5,a4
    80006a1c:	0007871b          	sext.w	a4,a5
    80006a20:	fd843783          	ld	a5,-40(s0)
    80006a24:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006a26:	fd843783          	ld	a5,-40(s0)
    80006a2a:	6f9c                	ld	a5,24(a5)
    80006a2c:	853e                	mv	a0,a5
    80006a2e:	ffffe097          	auipc	ra,0xffffe
    80006a32:	756080e7          	jalr	1878(ra) # 80005184 <iunlock>
    80006a36:	a809                	j	80006a48 <fileread+0x158>
  } else {
    panic("fileread");
    80006a38:	00005517          	auipc	a0,0x5
    80006a3c:	b8850513          	addi	a0,a0,-1144 # 8000b5c0 <etext+0x5c0>
    80006a40:	ffffa097          	auipc	ra,0xffffa
    80006a44:	23e080e7          	jalr	574(ra) # 80000c7e <panic>
  }

  return r;
    80006a48:	fec42783          	lw	a5,-20(s0)
}
    80006a4c:	853e                	mv	a0,a5
    80006a4e:	70e2                	ld	ra,56(sp)
    80006a50:	7442                	ld	s0,48(sp)
    80006a52:	6121                	addi	sp,sp,64
    80006a54:	8082                	ret

0000000080006a56 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006a56:	715d                	addi	sp,sp,-80
    80006a58:	e486                	sd	ra,72(sp)
    80006a5a:	e0a2                	sd	s0,64(sp)
    80006a5c:	0880                	addi	s0,sp,80
    80006a5e:	fca43423          	sd	a0,-56(s0)
    80006a62:	fcb43023          	sd	a1,-64(s0)
    80006a66:	87b2                	mv	a5,a2
    80006a68:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006a6c:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006a70:	fc843783          	ld	a5,-56(s0)
    80006a74:	0097c783          	lbu	a5,9(a5)
    80006a78:	e399                	bnez	a5,80006a7e <filewrite+0x28>
    return -1;
    80006a7a:	57fd                	li	a5,-1
    80006a7c:	aad1                	j	80006c50 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006a7e:	fc843783          	ld	a5,-56(s0)
    80006a82:	439c                	lw	a5,0(a5)
    80006a84:	873e                	mv	a4,a5
    80006a86:	4785                	li	a5,1
    80006a88:	02f71363          	bne	a4,a5,80006aae <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006a8c:	fc843783          	ld	a5,-56(s0)
    80006a90:	6b9c                	ld	a5,16(a5)
    80006a92:	fbc42703          	lw	a4,-68(s0)
    80006a96:	863a                	mv	a2,a4
    80006a98:	fc043583          	ld	a1,-64(s0)
    80006a9c:	853e                	mv	a0,a5
    80006a9e:	00000097          	auipc	ra,0x0
    80006aa2:	3b8080e7          	jalr	952(ra) # 80006e56 <pipewrite>
    80006aa6:	87aa                	mv	a5,a0
    80006aa8:	fef42623          	sw	a5,-20(s0)
    80006aac:	a245                	j	80006c4c <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006aae:	fc843783          	ld	a5,-56(s0)
    80006ab2:	439c                	lw	a5,0(a5)
    80006ab4:	873e                	mv	a4,a5
    80006ab6:	478d                	li	a5,3
    80006ab8:	06f71863          	bne	a4,a5,80006b28 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006abc:	fc843783          	ld	a5,-56(s0)
    80006ac0:	02479783          	lh	a5,36(a5)
    80006ac4:	2781                	sext.w	a5,a5
    80006ac6:	0207c863          	bltz	a5,80006af6 <filewrite+0xa0>
    80006aca:	fc843783          	ld	a5,-56(s0)
    80006ace:	02479783          	lh	a5,36(a5)
    80006ad2:	0007871b          	sext.w	a4,a5
    80006ad6:	47a5                	li	a5,9
    80006ad8:	00e7cf63          	blt	a5,a4,80006af6 <filewrite+0xa0>
    80006adc:	fc843783          	ld	a5,-56(s0)
    80006ae0:	02479783          	lh	a5,36(a5)
    80006ae4:	2781                	sext.w	a5,a5
    80006ae6:	0001e717          	auipc	a4,0x1e
    80006aea:	82a70713          	addi	a4,a4,-2006 # 80024310 <devsw>
    80006aee:	0792                	slli	a5,a5,0x4
    80006af0:	97ba                	add	a5,a5,a4
    80006af2:	679c                	ld	a5,8(a5)
    80006af4:	e399                	bnez	a5,80006afa <filewrite+0xa4>
      return -1;
    80006af6:	57fd                	li	a5,-1
    80006af8:	aaa1                	j	80006c50 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006afa:	fc843783          	ld	a5,-56(s0)
    80006afe:	02479783          	lh	a5,36(a5)
    80006b02:	2781                	sext.w	a5,a5
    80006b04:	0001e717          	auipc	a4,0x1e
    80006b08:	80c70713          	addi	a4,a4,-2036 # 80024310 <devsw>
    80006b0c:	0792                	slli	a5,a5,0x4
    80006b0e:	97ba                	add	a5,a5,a4
    80006b10:	6798                	ld	a4,8(a5)
    80006b12:	fbc42783          	lw	a5,-68(s0)
    80006b16:	863e                	mv	a2,a5
    80006b18:	fc043583          	ld	a1,-64(s0)
    80006b1c:	4505                	li	a0,1
    80006b1e:	9702                	jalr	a4
    80006b20:	87aa                	mv	a5,a0
    80006b22:	fef42623          	sw	a5,-20(s0)
    80006b26:	a21d                	j	80006c4c <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006b28:	fc843783          	ld	a5,-56(s0)
    80006b2c:	439c                	lw	a5,0(a5)
    80006b2e:	873e                	mv	a4,a5
    80006b30:	4789                	li	a5,2
    80006b32:	10f71563          	bne	a4,a5,80006c3c <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006b36:	6785                	lui	a5,0x1
    80006b38:	c007879b          	addiw	a5,a5,-1024
    80006b3c:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006b40:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006b44:	a0d9                	j	80006c0a <filewrite+0x1b4>
      int n1 = n - i;
    80006b46:	fbc42703          	lw	a4,-68(s0)
    80006b4a:	fe842783          	lw	a5,-24(s0)
    80006b4e:	40f707bb          	subw	a5,a4,a5
    80006b52:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006b56:	fe442703          	lw	a4,-28(s0)
    80006b5a:	fe042783          	lw	a5,-32(s0)
    80006b5e:	2701                	sext.w	a4,a4
    80006b60:	2781                	sext.w	a5,a5
    80006b62:	00e7d663          	bge	a5,a4,80006b6e <filewrite+0x118>
        n1 = max;
    80006b66:	fe042783          	lw	a5,-32(s0)
    80006b6a:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006b6e:	fffff097          	auipc	ra,0xfffff
    80006b72:	53c080e7          	jalr	1340(ra) # 800060aa <begin_op>
      ilock(f->ip);
    80006b76:	fc843783          	ld	a5,-56(s0)
    80006b7a:	6f9c                	ld	a5,24(a5)
    80006b7c:	853e                	mv	a0,a5
    80006b7e:	ffffe097          	auipc	ra,0xffffe
    80006b82:	4d2080e7          	jalr	1234(ra) # 80005050 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006b86:	fc843783          	ld	a5,-56(s0)
    80006b8a:	6f88                	ld	a0,24(a5)
    80006b8c:	fe842703          	lw	a4,-24(s0)
    80006b90:	fc043783          	ld	a5,-64(s0)
    80006b94:	00f70633          	add	a2,a4,a5
    80006b98:	fc843783          	ld	a5,-56(s0)
    80006b9c:	539c                	lw	a5,32(a5)
    80006b9e:	fe442703          	lw	a4,-28(s0)
    80006ba2:	86be                	mv	a3,a5
    80006ba4:	4585                	li	a1,1
    80006ba6:	fffff097          	auipc	ra,0xfffff
    80006baa:	bca080e7          	jalr	-1078(ra) # 80005770 <writei>
    80006bae:	87aa                	mv	a5,a0
    80006bb0:	fcf42e23          	sw	a5,-36(s0)
    80006bb4:	fdc42783          	lw	a5,-36(s0)
    80006bb8:	2781                	sext.w	a5,a5
    80006bba:	00f05d63          	blez	a5,80006bd4 <filewrite+0x17e>
        f->off += r;
    80006bbe:	fc843783          	ld	a5,-56(s0)
    80006bc2:	5398                	lw	a4,32(a5)
    80006bc4:	fdc42783          	lw	a5,-36(s0)
    80006bc8:	9fb9                	addw	a5,a5,a4
    80006bca:	0007871b          	sext.w	a4,a5
    80006bce:	fc843783          	ld	a5,-56(s0)
    80006bd2:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006bd4:	fc843783          	ld	a5,-56(s0)
    80006bd8:	6f9c                	ld	a5,24(a5)
    80006bda:	853e                	mv	a0,a5
    80006bdc:	ffffe097          	auipc	ra,0xffffe
    80006be0:	5a8080e7          	jalr	1448(ra) # 80005184 <iunlock>
      end_op();
    80006be4:	fffff097          	auipc	ra,0xfffff
    80006be8:	588080e7          	jalr	1416(ra) # 8000616c <end_op>

      if(r != n1){
    80006bec:	fdc42703          	lw	a4,-36(s0)
    80006bf0:	fe442783          	lw	a5,-28(s0)
    80006bf4:	2701                	sext.w	a4,a4
    80006bf6:	2781                	sext.w	a5,a5
    80006bf8:	02f71263          	bne	a4,a5,80006c1c <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006bfc:	fe842703          	lw	a4,-24(s0)
    80006c00:	fdc42783          	lw	a5,-36(s0)
    80006c04:	9fb9                	addw	a5,a5,a4
    80006c06:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006c0a:	fe842703          	lw	a4,-24(s0)
    80006c0e:	fbc42783          	lw	a5,-68(s0)
    80006c12:	2701                	sext.w	a4,a4
    80006c14:	2781                	sext.w	a5,a5
    80006c16:	f2f748e3          	blt	a4,a5,80006b46 <filewrite+0xf0>
    80006c1a:	a011                	j	80006c1e <filewrite+0x1c8>
        break;
    80006c1c:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006c1e:	fe842703          	lw	a4,-24(s0)
    80006c22:	fbc42783          	lw	a5,-68(s0)
    80006c26:	2701                	sext.w	a4,a4
    80006c28:	2781                	sext.w	a5,a5
    80006c2a:	00f71563          	bne	a4,a5,80006c34 <filewrite+0x1de>
    80006c2e:	fbc42783          	lw	a5,-68(s0)
    80006c32:	a011                	j	80006c36 <filewrite+0x1e0>
    80006c34:	57fd                	li	a5,-1
    80006c36:	fef42623          	sw	a5,-20(s0)
    80006c3a:	a809                	j	80006c4c <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006c3c:	00005517          	auipc	a0,0x5
    80006c40:	99450513          	addi	a0,a0,-1644 # 8000b5d0 <etext+0x5d0>
    80006c44:	ffffa097          	auipc	ra,0xffffa
    80006c48:	03a080e7          	jalr	58(ra) # 80000c7e <panic>
  }

  return ret;
    80006c4c:	fec42783          	lw	a5,-20(s0)
}
    80006c50:	853e                	mv	a0,a5
    80006c52:	60a6                	ld	ra,72(sp)
    80006c54:	6406                	ld	s0,64(sp)
    80006c56:	6161                	addi	sp,sp,80
    80006c58:	8082                	ret

0000000080006c5a <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006c5a:	7179                	addi	sp,sp,-48
    80006c5c:	f406                	sd	ra,40(sp)
    80006c5e:	f022                	sd	s0,32(sp)
    80006c60:	1800                	addi	s0,sp,48
    80006c62:	fca43c23          	sd	a0,-40(s0)
    80006c66:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006c6a:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006c6e:	fd043783          	ld	a5,-48(s0)
    80006c72:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006c76:	fd043783          	ld	a5,-48(s0)
    80006c7a:	6398                	ld	a4,0(a5)
    80006c7c:	fd843783          	ld	a5,-40(s0)
    80006c80:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006c82:	00000097          	auipc	ra,0x0
    80006c86:	9d8080e7          	jalr	-1576(ra) # 8000665a <filealloc>
    80006c8a:	872a                	mv	a4,a0
    80006c8c:	fd843783          	ld	a5,-40(s0)
    80006c90:	e398                	sd	a4,0(a5)
    80006c92:	fd843783          	ld	a5,-40(s0)
    80006c96:	639c                	ld	a5,0(a5)
    80006c98:	c3e9                	beqz	a5,80006d5a <pipealloc+0x100>
    80006c9a:	00000097          	auipc	ra,0x0
    80006c9e:	9c0080e7          	jalr	-1600(ra) # 8000665a <filealloc>
    80006ca2:	872a                	mv	a4,a0
    80006ca4:	fd043783          	ld	a5,-48(s0)
    80006ca8:	e398                	sd	a4,0(a5)
    80006caa:	fd043783          	ld	a5,-48(s0)
    80006cae:	639c                	ld	a5,0(a5)
    80006cb0:	c7cd                	beqz	a5,80006d5a <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006cb2:	ffffa097          	auipc	ra,0xffffa
    80006cb6:	468080e7          	jalr	1128(ra) # 8000111a <kalloc>
    80006cba:	fea43423          	sd	a0,-24(s0)
    80006cbe:	fe843783          	ld	a5,-24(s0)
    80006cc2:	cfd1                	beqz	a5,80006d5e <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006cc4:	fe843783          	ld	a5,-24(s0)
    80006cc8:	4705                	li	a4,1
    80006cca:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006cce:	fe843783          	ld	a5,-24(s0)
    80006cd2:	4705                	li	a4,1
    80006cd4:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006cd8:	fe843783          	ld	a5,-24(s0)
    80006cdc:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006ce0:	fe843783          	ld	a5,-24(s0)
    80006ce4:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006ce8:	fe843783          	ld	a5,-24(s0)
    80006cec:	00005597          	auipc	a1,0x5
    80006cf0:	8f458593          	addi	a1,a1,-1804 # 8000b5e0 <etext+0x5e0>
    80006cf4:	853e                	mv	a0,a5
    80006cf6:	ffffa097          	auipc	ra,0xffffa
    80006cfa:	548080e7          	jalr	1352(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    80006cfe:	fd843783          	ld	a5,-40(s0)
    80006d02:	639c                	ld	a5,0(a5)
    80006d04:	4705                	li	a4,1
    80006d06:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006d08:	fd843783          	ld	a5,-40(s0)
    80006d0c:	639c                	ld	a5,0(a5)
    80006d0e:	4705                	li	a4,1
    80006d10:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006d14:	fd843783          	ld	a5,-40(s0)
    80006d18:	639c                	ld	a5,0(a5)
    80006d1a:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006d1e:	fd843783          	ld	a5,-40(s0)
    80006d22:	639c                	ld	a5,0(a5)
    80006d24:	fe843703          	ld	a4,-24(s0)
    80006d28:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006d2a:	fd043783          	ld	a5,-48(s0)
    80006d2e:	639c                	ld	a5,0(a5)
    80006d30:	4705                	li	a4,1
    80006d32:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006d34:	fd043783          	ld	a5,-48(s0)
    80006d38:	639c                	ld	a5,0(a5)
    80006d3a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006d3e:	fd043783          	ld	a5,-48(s0)
    80006d42:	639c                	ld	a5,0(a5)
    80006d44:	4705                	li	a4,1
    80006d46:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006d4a:	fd043783          	ld	a5,-48(s0)
    80006d4e:	639c                	ld	a5,0(a5)
    80006d50:	fe843703          	ld	a4,-24(s0)
    80006d54:	eb98                	sd	a4,16(a5)
  return 0;
    80006d56:	4781                	li	a5,0
    80006d58:	a0b1                	j	80006da4 <pipealloc+0x14a>
    goto bad;
    80006d5a:	0001                	nop
    80006d5c:	a011                	j	80006d60 <pipealloc+0x106>
    goto bad;
    80006d5e:	0001                	nop

 bad:
  if(pi)
    80006d60:	fe843783          	ld	a5,-24(s0)
    80006d64:	c799                	beqz	a5,80006d72 <pipealloc+0x118>
    kfree((char*)pi);
    80006d66:	fe843503          	ld	a0,-24(s0)
    80006d6a:	ffffa097          	auipc	ra,0xffffa
    80006d6e:	30c080e7          	jalr	780(ra) # 80001076 <kfree>
  if(*f0)
    80006d72:	fd843783          	ld	a5,-40(s0)
    80006d76:	639c                	ld	a5,0(a5)
    80006d78:	cb89                	beqz	a5,80006d8a <pipealloc+0x130>
    fileclose(*f0);
    80006d7a:	fd843783          	ld	a5,-40(s0)
    80006d7e:	639c                	ld	a5,0(a5)
    80006d80:	853e                	mv	a0,a5
    80006d82:	00000097          	auipc	ra,0x0
    80006d86:	9c2080e7          	jalr	-1598(ra) # 80006744 <fileclose>
  if(*f1)
    80006d8a:	fd043783          	ld	a5,-48(s0)
    80006d8e:	639c                	ld	a5,0(a5)
    80006d90:	cb89                	beqz	a5,80006da2 <pipealloc+0x148>
    fileclose(*f1);
    80006d92:	fd043783          	ld	a5,-48(s0)
    80006d96:	639c                	ld	a5,0(a5)
    80006d98:	853e                	mv	a0,a5
    80006d9a:	00000097          	auipc	ra,0x0
    80006d9e:	9aa080e7          	jalr	-1622(ra) # 80006744 <fileclose>
  return -1;
    80006da2:	57fd                	li	a5,-1
}
    80006da4:	853e                	mv	a0,a5
    80006da6:	70a2                	ld	ra,40(sp)
    80006da8:	7402                	ld	s0,32(sp)
    80006daa:	6145                	addi	sp,sp,48
    80006dac:	8082                	ret

0000000080006dae <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80006dae:	1101                	addi	sp,sp,-32
    80006db0:	ec06                	sd	ra,24(sp)
    80006db2:	e822                	sd	s0,16(sp)
    80006db4:	1000                	addi	s0,sp,32
    80006db6:	fea43423          	sd	a0,-24(s0)
    80006dba:	87ae                	mv	a5,a1
    80006dbc:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80006dc0:	fe843783          	ld	a5,-24(s0)
    80006dc4:	853e                	mv	a0,a5
    80006dc6:	ffffa097          	auipc	ra,0xffffa
    80006dca:	4a8080e7          	jalr	1192(ra) # 8000126e <acquire>
  if(writable){
    80006dce:	fe442783          	lw	a5,-28(s0)
    80006dd2:	2781                	sext.w	a5,a5
    80006dd4:	cf99                	beqz	a5,80006df2 <pipeclose+0x44>
    pi->writeopen = 0;
    80006dd6:	fe843783          	ld	a5,-24(s0)
    80006dda:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80006dde:	fe843783          	ld	a5,-24(s0)
    80006de2:	21878793          	addi	a5,a5,536
    80006de6:	853e                	mv	a0,a5
    80006de8:	ffffc097          	auipc	ra,0xffffc
    80006dec:	6ec080e7          	jalr	1772(ra) # 800034d4 <wakeup>
    80006df0:	a831                	j	80006e0c <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80006df2:	fe843783          	ld	a5,-24(s0)
    80006df6:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80006dfa:	fe843783          	ld	a5,-24(s0)
    80006dfe:	21c78793          	addi	a5,a5,540
    80006e02:	853e                	mv	a0,a5
    80006e04:	ffffc097          	auipc	ra,0xffffc
    80006e08:	6d0080e7          	jalr	1744(ra) # 800034d4 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80006e0c:	fe843783          	ld	a5,-24(s0)
    80006e10:	2207a783          	lw	a5,544(a5)
    80006e14:	e785                	bnez	a5,80006e3c <pipeclose+0x8e>
    80006e16:	fe843783          	ld	a5,-24(s0)
    80006e1a:	2247a783          	lw	a5,548(a5)
    80006e1e:	ef99                	bnez	a5,80006e3c <pipeclose+0x8e>
    release(&pi->lock);
    80006e20:	fe843783          	ld	a5,-24(s0)
    80006e24:	853e                	mv	a0,a5
    80006e26:	ffffa097          	auipc	ra,0xffffa
    80006e2a:	4ac080e7          	jalr	1196(ra) # 800012d2 <release>
    kfree((char*)pi);
    80006e2e:	fe843503          	ld	a0,-24(s0)
    80006e32:	ffffa097          	auipc	ra,0xffffa
    80006e36:	244080e7          	jalr	580(ra) # 80001076 <kfree>
    80006e3a:	a809                	j	80006e4c <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80006e3c:	fe843783          	ld	a5,-24(s0)
    80006e40:	853e                	mv	a0,a5
    80006e42:	ffffa097          	auipc	ra,0xffffa
    80006e46:	490080e7          	jalr	1168(ra) # 800012d2 <release>
}
    80006e4a:	0001                	nop
    80006e4c:	0001                	nop
    80006e4e:	60e2                	ld	ra,24(sp)
    80006e50:	6442                	ld	s0,16(sp)
    80006e52:	6105                	addi	sp,sp,32
    80006e54:	8082                	ret

0000000080006e56 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80006e56:	715d                	addi	sp,sp,-80
    80006e58:	e486                	sd	ra,72(sp)
    80006e5a:	e0a2                	sd	s0,64(sp)
    80006e5c:	0880                	addi	s0,sp,80
    80006e5e:	fca43423          	sd	a0,-56(s0)
    80006e62:	fcb43023          	sd	a1,-64(s0)
    80006e66:	87b2                	mv	a5,a2
    80006e68:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80006e6c:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80006e70:	ffffc097          	auipc	ra,0xffffc
    80006e74:	9a4080e7          	jalr	-1628(ra) # 80002814 <myproc>
    80006e78:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80006e7c:	fc843783          	ld	a5,-56(s0)
    80006e80:	853e                	mv	a0,a5
    80006e82:	ffffa097          	auipc	ra,0xffffa
    80006e86:	3ec080e7          	jalr	1004(ra) # 8000126e <acquire>
  while(i < n){
    80006e8a:	a8d1                	j	80006f5e <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    80006e8c:	fc843783          	ld	a5,-56(s0)
    80006e90:	2207a783          	lw	a5,544(a5)
    80006e94:	c789                	beqz	a5,80006e9e <pipewrite+0x48>
    80006e96:	fe043783          	ld	a5,-32(s0)
    80006e9a:	579c                	lw	a5,40(a5)
    80006e9c:	cb91                	beqz	a5,80006eb0 <pipewrite+0x5a>
      release(&pi->lock);
    80006e9e:	fc843783          	ld	a5,-56(s0)
    80006ea2:	853e                	mv	a0,a5
    80006ea4:	ffffa097          	auipc	ra,0xffffa
    80006ea8:	42e080e7          	jalr	1070(ra) # 800012d2 <release>
      return -1;
    80006eac:	57fd                	li	a5,-1
    80006eae:	a0e5                	j	80006f96 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80006eb0:	fc843783          	ld	a5,-56(s0)
    80006eb4:	21c7a703          	lw	a4,540(a5)
    80006eb8:	fc843783          	ld	a5,-56(s0)
    80006ebc:	2187a783          	lw	a5,536(a5)
    80006ec0:	2007879b          	addiw	a5,a5,512
    80006ec4:	2781                	sext.w	a5,a5
    80006ec6:	02f71863          	bne	a4,a5,80006ef6 <pipewrite+0xa0>
      wakeup(&pi->nread);
    80006eca:	fc843783          	ld	a5,-56(s0)
    80006ece:	21878793          	addi	a5,a5,536
    80006ed2:	853e                	mv	a0,a5
    80006ed4:	ffffc097          	auipc	ra,0xffffc
    80006ed8:	600080e7          	jalr	1536(ra) # 800034d4 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80006edc:	fc843783          	ld	a5,-56(s0)
    80006ee0:	21c78793          	addi	a5,a5,540
    80006ee4:	fc843703          	ld	a4,-56(s0)
    80006ee8:	85ba                	mv	a1,a4
    80006eea:	853e                	mv	a0,a5
    80006eec:	ffffc097          	auipc	ra,0xffffc
    80006ef0:	56c080e7          	jalr	1388(ra) # 80003458 <sleep>
    80006ef4:	a0ad                	j	80006f5e <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80006ef6:	fe043783          	ld	a5,-32(s0)
    80006efa:	6ba8                	ld	a0,80(a5)
    80006efc:	fec42703          	lw	a4,-20(s0)
    80006f00:	fc043783          	ld	a5,-64(s0)
    80006f04:	973e                	add	a4,a4,a5
    80006f06:	fdf40793          	addi	a5,s0,-33
    80006f0a:	4685                	li	a3,1
    80006f0c:	863a                	mv	a2,a4
    80006f0e:	85be                	mv	a1,a5
    80006f10:	ffffb097          	auipc	ra,0xffffb
    80006f14:	4a4080e7          	jalr	1188(ra) # 800023b4 <copyin>
    80006f18:	87aa                	mv	a5,a0
    80006f1a:	873e                	mv	a4,a5
    80006f1c:	57fd                	li	a5,-1
    80006f1e:	04f70963          	beq	a4,a5,80006f70 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80006f22:	fc843783          	ld	a5,-56(s0)
    80006f26:	21c7a783          	lw	a5,540(a5)
    80006f2a:	2781                	sext.w	a5,a5
    80006f2c:	0017871b          	addiw	a4,a5,1
    80006f30:	0007069b          	sext.w	a3,a4
    80006f34:	fc843703          	ld	a4,-56(s0)
    80006f38:	20d72e23          	sw	a3,540(a4)
    80006f3c:	1ff7f793          	andi	a5,a5,511
    80006f40:	2781                	sext.w	a5,a5
    80006f42:	fdf44703          	lbu	a4,-33(s0)
    80006f46:	fc843683          	ld	a3,-56(s0)
    80006f4a:	1782                	slli	a5,a5,0x20
    80006f4c:	9381                	srli	a5,a5,0x20
    80006f4e:	97b6                	add	a5,a5,a3
    80006f50:	00e78c23          	sb	a4,24(a5)
      i++;
    80006f54:	fec42783          	lw	a5,-20(s0)
    80006f58:	2785                	addiw	a5,a5,1
    80006f5a:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80006f5e:	fec42703          	lw	a4,-20(s0)
    80006f62:	fbc42783          	lw	a5,-68(s0)
    80006f66:	2701                	sext.w	a4,a4
    80006f68:	2781                	sext.w	a5,a5
    80006f6a:	f2f741e3          	blt	a4,a5,80006e8c <pipewrite+0x36>
    80006f6e:	a011                	j	80006f72 <pipewrite+0x11c>
        break;
    80006f70:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80006f72:	fc843783          	ld	a5,-56(s0)
    80006f76:	21878793          	addi	a5,a5,536
    80006f7a:	853e                	mv	a0,a5
    80006f7c:	ffffc097          	auipc	ra,0xffffc
    80006f80:	558080e7          	jalr	1368(ra) # 800034d4 <wakeup>
  release(&pi->lock);
    80006f84:	fc843783          	ld	a5,-56(s0)
    80006f88:	853e                	mv	a0,a5
    80006f8a:	ffffa097          	auipc	ra,0xffffa
    80006f8e:	348080e7          	jalr	840(ra) # 800012d2 <release>

  return i;
    80006f92:	fec42783          	lw	a5,-20(s0)
}
    80006f96:	853e                	mv	a0,a5
    80006f98:	60a6                	ld	ra,72(sp)
    80006f9a:	6406                	ld	s0,64(sp)
    80006f9c:	6161                	addi	sp,sp,80
    80006f9e:	8082                	ret

0000000080006fa0 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80006fa0:	715d                	addi	sp,sp,-80
    80006fa2:	e486                	sd	ra,72(sp)
    80006fa4:	e0a2                	sd	s0,64(sp)
    80006fa6:	0880                	addi	s0,sp,80
    80006fa8:	fca43423          	sd	a0,-56(s0)
    80006fac:	fcb43023          	sd	a1,-64(s0)
    80006fb0:	87b2                	mv	a5,a2
    80006fb2:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80006fb6:	ffffc097          	auipc	ra,0xffffc
    80006fba:	85e080e7          	jalr	-1954(ra) # 80002814 <myproc>
    80006fbe:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80006fc2:	fc843783          	ld	a5,-56(s0)
    80006fc6:	853e                	mv	a0,a5
    80006fc8:	ffffa097          	auipc	ra,0xffffa
    80006fcc:	2a6080e7          	jalr	678(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80006fd0:	a815                	j	80007004 <piperead+0x64>
    if(pr->killed){
    80006fd2:	fe043783          	ld	a5,-32(s0)
    80006fd6:	579c                	lw	a5,40(a5)
    80006fd8:	cb91                	beqz	a5,80006fec <piperead+0x4c>
      release(&pi->lock);
    80006fda:	fc843783          	ld	a5,-56(s0)
    80006fde:	853e                	mv	a0,a5
    80006fe0:	ffffa097          	auipc	ra,0xffffa
    80006fe4:	2f2080e7          	jalr	754(ra) # 800012d2 <release>
      return -1;
    80006fe8:	57fd                	li	a5,-1
    80006fea:	a8dd                	j	800070e0 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80006fec:	fc843783          	ld	a5,-56(s0)
    80006ff0:	21878793          	addi	a5,a5,536
    80006ff4:	fc843703          	ld	a4,-56(s0)
    80006ff8:	85ba                	mv	a1,a4
    80006ffa:	853e                	mv	a0,a5
    80006ffc:	ffffc097          	auipc	ra,0xffffc
    80007000:	45c080e7          	jalr	1116(ra) # 80003458 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007004:	fc843783          	ld	a5,-56(s0)
    80007008:	2187a703          	lw	a4,536(a5)
    8000700c:	fc843783          	ld	a5,-56(s0)
    80007010:	21c7a783          	lw	a5,540(a5)
    80007014:	00f71763          	bne	a4,a5,80007022 <piperead+0x82>
    80007018:	fc843783          	ld	a5,-56(s0)
    8000701c:	2247a783          	lw	a5,548(a5)
    80007020:	fbcd                	bnez	a5,80006fd2 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007022:	fe042623          	sw	zero,-20(s0)
    80007026:	a8bd                	j	800070a4 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    80007028:	fc843783          	ld	a5,-56(s0)
    8000702c:	2187a703          	lw	a4,536(a5)
    80007030:	fc843783          	ld	a5,-56(s0)
    80007034:	21c7a783          	lw	a5,540(a5)
    80007038:	06f70f63          	beq	a4,a5,800070b6 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000703c:	fc843783          	ld	a5,-56(s0)
    80007040:	2187a783          	lw	a5,536(a5)
    80007044:	2781                	sext.w	a5,a5
    80007046:	0017871b          	addiw	a4,a5,1
    8000704a:	0007069b          	sext.w	a3,a4
    8000704e:	fc843703          	ld	a4,-56(s0)
    80007052:	20d72c23          	sw	a3,536(a4)
    80007056:	1ff7f793          	andi	a5,a5,511
    8000705a:	2781                	sext.w	a5,a5
    8000705c:	fc843703          	ld	a4,-56(s0)
    80007060:	1782                	slli	a5,a5,0x20
    80007062:	9381                	srli	a5,a5,0x20
    80007064:	97ba                	add	a5,a5,a4
    80007066:	0187c783          	lbu	a5,24(a5)
    8000706a:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000706e:	fe043783          	ld	a5,-32(s0)
    80007072:	6ba8                	ld	a0,80(a5)
    80007074:	fec42703          	lw	a4,-20(s0)
    80007078:	fc043783          	ld	a5,-64(s0)
    8000707c:	97ba                	add	a5,a5,a4
    8000707e:	fdf40713          	addi	a4,s0,-33
    80007082:	4685                	li	a3,1
    80007084:	863a                	mv	a2,a4
    80007086:	85be                	mv	a1,a5
    80007088:	ffffb097          	auipc	ra,0xffffb
    8000708c:	25e080e7          	jalr	606(ra) # 800022e6 <copyout>
    80007090:	87aa                	mv	a5,a0
    80007092:	873e                	mv	a4,a5
    80007094:	57fd                	li	a5,-1
    80007096:	02f70263          	beq	a4,a5,800070ba <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000709a:	fec42783          	lw	a5,-20(s0)
    8000709e:	2785                	addiw	a5,a5,1
    800070a0:	fef42623          	sw	a5,-20(s0)
    800070a4:	fec42703          	lw	a4,-20(s0)
    800070a8:	fbc42783          	lw	a5,-68(s0)
    800070ac:	2701                	sext.w	a4,a4
    800070ae:	2781                	sext.w	a5,a5
    800070b0:	f6f74ce3          	blt	a4,a5,80007028 <piperead+0x88>
    800070b4:	a021                	j	800070bc <piperead+0x11c>
      break;
    800070b6:	0001                	nop
    800070b8:	a011                	j	800070bc <piperead+0x11c>
      break;
    800070ba:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800070bc:	fc843783          	ld	a5,-56(s0)
    800070c0:	21c78793          	addi	a5,a5,540
    800070c4:	853e                	mv	a0,a5
    800070c6:	ffffc097          	auipc	ra,0xffffc
    800070ca:	40e080e7          	jalr	1038(ra) # 800034d4 <wakeup>
  release(&pi->lock);
    800070ce:	fc843783          	ld	a5,-56(s0)
    800070d2:	853e                	mv	a0,a5
    800070d4:	ffffa097          	auipc	ra,0xffffa
    800070d8:	1fe080e7          	jalr	510(ra) # 800012d2 <release>
  return i;
    800070dc:	fec42783          	lw	a5,-20(s0)
}
    800070e0:	853e                	mv	a0,a5
    800070e2:	60a6                	ld	ra,72(sp)
    800070e4:	6406                	ld	s0,64(sp)
    800070e6:	6161                	addi	sp,sp,80
    800070e8:	8082                	ret

00000000800070ea <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    800070ea:	de010113          	addi	sp,sp,-544
    800070ee:	20113c23          	sd	ra,536(sp)
    800070f2:	20813823          	sd	s0,528(sp)
    800070f6:	20913423          	sd	s1,520(sp)
    800070fa:	1400                	addi	s0,sp,544
    800070fc:	dea43423          	sd	a0,-536(s0)
    80007100:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007104:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007108:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000710c:	ffffb097          	auipc	ra,0xffffb
    80007110:	708080e7          	jalr	1800(ra) # 80002814 <myproc>
    80007114:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007118:	fffff097          	auipc	ra,0xfffff
    8000711c:	f92080e7          	jalr	-110(ra) # 800060aa <begin_op>

  if((ip = namei(path)) == 0){
    80007120:	de843503          	ld	a0,-536(s0)
    80007124:	fffff097          	auipc	ra,0xfffff
    80007128:	c22080e7          	jalr	-990(ra) # 80005d46 <namei>
    8000712c:	faa43423          	sd	a0,-88(s0)
    80007130:	fa843783          	ld	a5,-88(s0)
    80007134:	e799                	bnez	a5,80007142 <exec+0x58>
    end_op();
    80007136:	fffff097          	auipc	ra,0xfffff
    8000713a:	036080e7          	jalr	54(ra) # 8000616c <end_op>
    return -1;
    8000713e:	57fd                	li	a5,-1
    80007140:	a90d                	j	80007572 <exec+0x488>
  }
  ilock(ip);
    80007142:	fa843503          	ld	a0,-88(s0)
    80007146:	ffffe097          	auipc	ra,0xffffe
    8000714a:	f0a080e7          	jalr	-246(ra) # 80005050 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    8000714e:	e3040793          	addi	a5,s0,-464
    80007152:	04000713          	li	a4,64
    80007156:	4681                	li	a3,0
    80007158:	863e                	mv	a2,a5
    8000715a:	4581                	li	a1,0
    8000715c:	fa843503          	ld	a0,-88(s0)
    80007160:	ffffe097          	auipc	ra,0xffffe
    80007164:	486080e7          	jalr	1158(ra) # 800055e6 <readi>
    80007168:	87aa                	mv	a5,a0
    8000716a:	873e                	mv	a4,a5
    8000716c:	04000793          	li	a5,64
    80007170:	38f71b63          	bne	a4,a5,80007506 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80007174:	e3042783          	lw	a5,-464(s0)
    80007178:	873e                	mv	a4,a5
    8000717a:	464c47b7          	lui	a5,0x464c4
    8000717e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007182:	38f71463          	bne	a4,a5,8000750a <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007186:	f9843503          	ld	a0,-104(s0)
    8000718a:	ffffc097          	auipc	ra,0xffffc
    8000718e:	8ec080e7          	jalr	-1812(ra) # 80002a76 <proc_pagetable>
    80007192:	faa43023          	sd	a0,-96(s0)
    80007196:	fa043783          	ld	a5,-96(s0)
    8000719a:	36078a63          	beqz	a5,8000750e <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000719e:	fc042623          	sw	zero,-52(s0)
    800071a2:	e5043783          	ld	a5,-432(s0)
    800071a6:	fcf42423          	sw	a5,-56(s0)
    800071aa:	a8e1                	j	80007282 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800071ac:	df840793          	addi	a5,s0,-520
    800071b0:	fc842683          	lw	a3,-56(s0)
    800071b4:	03800713          	li	a4,56
    800071b8:	863e                	mv	a2,a5
    800071ba:	4581                	li	a1,0
    800071bc:	fa843503          	ld	a0,-88(s0)
    800071c0:	ffffe097          	auipc	ra,0xffffe
    800071c4:	426080e7          	jalr	1062(ra) # 800055e6 <readi>
    800071c8:	87aa                	mv	a5,a0
    800071ca:	873e                	mv	a4,a5
    800071cc:	03800793          	li	a5,56
    800071d0:	34f71163          	bne	a4,a5,80007512 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800071d4:	df842783          	lw	a5,-520(s0)
    800071d8:	873e                	mv	a4,a5
    800071da:	4785                	li	a5,1
    800071dc:	08f71663          	bne	a4,a5,80007268 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    800071e0:	e2043703          	ld	a4,-480(s0)
    800071e4:	e1843783          	ld	a5,-488(s0)
    800071e8:	32f76763          	bltu	a4,a5,80007516 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    800071ec:	e0843703          	ld	a4,-504(s0)
    800071f0:	e2043783          	ld	a5,-480(s0)
    800071f4:	973e                	add	a4,a4,a5
    800071f6:	e0843783          	ld	a5,-504(s0)
    800071fa:	32f76063          	bltu	a4,a5,8000751a <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    800071fe:	e0843703          	ld	a4,-504(s0)
    80007202:	e2043783          	ld	a5,-480(s0)
    80007206:	97ba                	add	a5,a5,a4
    80007208:	863e                	mv	a2,a5
    8000720a:	fb843583          	ld	a1,-72(s0)
    8000720e:	fa043503          	ld	a0,-96(s0)
    80007212:	ffffb097          	auipc	ra,0xffffb
    80007216:	cf6080e7          	jalr	-778(ra) # 80001f08 <uvmalloc>
    8000721a:	f6a43823          	sd	a0,-144(s0)
    8000721e:	f7043783          	ld	a5,-144(s0)
    80007222:	2e078e63          	beqz	a5,8000751e <exec+0x434>
      goto bad;
    sz = sz1;
    80007226:	f7043783          	ld	a5,-144(s0)
    8000722a:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    8000722e:	e0843703          	ld	a4,-504(s0)
    80007232:	6785                	lui	a5,0x1
    80007234:	17fd                	addi	a5,a5,-1
    80007236:	8ff9                	and	a5,a5,a4
    80007238:	2e079563          	bnez	a5,80007522 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000723c:	e0843783          	ld	a5,-504(s0)
    80007240:	e0043703          	ld	a4,-512(s0)
    80007244:	0007069b          	sext.w	a3,a4
    80007248:	e1843703          	ld	a4,-488(s0)
    8000724c:	2701                	sext.w	a4,a4
    8000724e:	fa843603          	ld	a2,-88(s0)
    80007252:	85be                	mv	a1,a5
    80007254:	fa043503          	ld	a0,-96(s0)
    80007258:	00000097          	auipc	ra,0x0
    8000725c:	32e080e7          	jalr	814(ra) # 80007586 <loadseg>
    80007260:	87aa                	mv	a5,a0
    80007262:	2c07c263          	bltz	a5,80007526 <exec+0x43c>
    80007266:	a011                	j	8000726a <exec+0x180>
      continue;
    80007268:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000726a:	fcc42783          	lw	a5,-52(s0)
    8000726e:	2785                	addiw	a5,a5,1
    80007270:	fcf42623          	sw	a5,-52(s0)
    80007274:	fc842783          	lw	a5,-56(s0)
    80007278:	0387879b          	addiw	a5,a5,56
    8000727c:	2781                	sext.w	a5,a5
    8000727e:	fcf42423          	sw	a5,-56(s0)
    80007282:	e6845783          	lhu	a5,-408(s0)
    80007286:	0007871b          	sext.w	a4,a5
    8000728a:	fcc42783          	lw	a5,-52(s0)
    8000728e:	2781                	sext.w	a5,a5
    80007290:	f0e7cee3          	blt	a5,a4,800071ac <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007294:	fa843503          	ld	a0,-88(s0)
    80007298:	ffffe097          	auipc	ra,0xffffe
    8000729c:	016080e7          	jalr	22(ra) # 800052ae <iunlockput>
  end_op();
    800072a0:	fffff097          	auipc	ra,0xfffff
    800072a4:	ecc080e7          	jalr	-308(ra) # 8000616c <end_op>
  ip = 0;
    800072a8:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800072ac:	ffffb097          	auipc	ra,0xffffb
    800072b0:	568080e7          	jalr	1384(ra) # 80002814 <myproc>
    800072b4:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800072b8:	f9843783          	ld	a5,-104(s0)
    800072bc:	67bc                	ld	a5,72(a5)
    800072be:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800072c2:	fb843703          	ld	a4,-72(s0)
    800072c6:	6785                	lui	a5,0x1
    800072c8:	17fd                	addi	a5,a5,-1
    800072ca:	973e                	add	a4,a4,a5
    800072cc:	77fd                	lui	a5,0xfffff
    800072ce:	8ff9                	and	a5,a5,a4
    800072d0:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    800072d4:	fb843703          	ld	a4,-72(s0)
    800072d8:	6789                	lui	a5,0x2
    800072da:	97ba                	add	a5,a5,a4
    800072dc:	863e                	mv	a2,a5
    800072de:	fb843583          	ld	a1,-72(s0)
    800072e2:	fa043503          	ld	a0,-96(s0)
    800072e6:	ffffb097          	auipc	ra,0xffffb
    800072ea:	c22080e7          	jalr	-990(ra) # 80001f08 <uvmalloc>
    800072ee:	f8a43423          	sd	a0,-120(s0)
    800072f2:	f8843783          	ld	a5,-120(s0)
    800072f6:	22078a63          	beqz	a5,8000752a <exec+0x440>
    goto bad;
  sz = sz1;
    800072fa:	f8843783          	ld	a5,-120(s0)
    800072fe:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007302:	fb843703          	ld	a4,-72(s0)
    80007306:	77f9                	lui	a5,0xffffe
    80007308:	97ba                	add	a5,a5,a4
    8000730a:	85be                	mv	a1,a5
    8000730c:	fa043503          	ld	a0,-96(s0)
    80007310:	ffffb097          	auipc	ra,0xffffb
    80007314:	f80080e7          	jalr	-128(ra) # 80002290 <uvmclear>
  sp = sz;
    80007318:	fb843783          	ld	a5,-72(s0)
    8000731c:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007320:	fb043703          	ld	a4,-80(s0)
    80007324:	77fd                	lui	a5,0xfffff
    80007326:	97ba                	add	a5,a5,a4
    80007328:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    8000732c:	fc043023          	sd	zero,-64(s0)
    80007330:	a845                	j	800073e0 <exec+0x2f6>
    if(argc >= MAXARG)
    80007332:	fc043703          	ld	a4,-64(s0)
    80007336:	47fd                	li	a5,31
    80007338:	1ee7eb63          	bltu	a5,a4,8000752e <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    8000733c:	fc043783          	ld	a5,-64(s0)
    80007340:	078e                	slli	a5,a5,0x3
    80007342:	de043703          	ld	a4,-544(s0)
    80007346:	97ba                	add	a5,a5,a4
    80007348:	639c                	ld	a5,0(a5)
    8000734a:	853e                	mv	a0,a5
    8000734c:	ffffa097          	auipc	ra,0xffffa
    80007350:	474080e7          	jalr	1140(ra) # 800017c0 <strlen>
    80007354:	87aa                	mv	a5,a0
    80007356:	2785                	addiw	a5,a5,1
    80007358:	2781                	sext.w	a5,a5
    8000735a:	873e                	mv	a4,a5
    8000735c:	fb043783          	ld	a5,-80(s0)
    80007360:	8f99                	sub	a5,a5,a4
    80007362:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007366:	fb043783          	ld	a5,-80(s0)
    8000736a:	9bc1                	andi	a5,a5,-16
    8000736c:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007370:	fb043703          	ld	a4,-80(s0)
    80007374:	f8043783          	ld	a5,-128(s0)
    80007378:	1af76d63          	bltu	a4,a5,80007532 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8000737c:	fc043783          	ld	a5,-64(s0)
    80007380:	078e                	slli	a5,a5,0x3
    80007382:	de043703          	ld	a4,-544(s0)
    80007386:	97ba                	add	a5,a5,a4
    80007388:	6384                	ld	s1,0(a5)
    8000738a:	fc043783          	ld	a5,-64(s0)
    8000738e:	078e                	slli	a5,a5,0x3
    80007390:	de043703          	ld	a4,-544(s0)
    80007394:	97ba                	add	a5,a5,a4
    80007396:	639c                	ld	a5,0(a5)
    80007398:	853e                	mv	a0,a5
    8000739a:	ffffa097          	auipc	ra,0xffffa
    8000739e:	426080e7          	jalr	1062(ra) # 800017c0 <strlen>
    800073a2:	87aa                	mv	a5,a0
    800073a4:	2785                	addiw	a5,a5,1
    800073a6:	2781                	sext.w	a5,a5
    800073a8:	86be                	mv	a3,a5
    800073aa:	8626                	mv	a2,s1
    800073ac:	fb043583          	ld	a1,-80(s0)
    800073b0:	fa043503          	ld	a0,-96(s0)
    800073b4:	ffffb097          	auipc	ra,0xffffb
    800073b8:	f32080e7          	jalr	-206(ra) # 800022e6 <copyout>
    800073bc:	87aa                	mv	a5,a0
    800073be:	1607cc63          	bltz	a5,80007536 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    800073c2:	fc043783          	ld	a5,-64(s0)
    800073c6:	078e                	slli	a5,a5,0x3
    800073c8:	fe040713          	addi	a4,s0,-32
    800073cc:	97ba                	add	a5,a5,a4
    800073ce:	fb043703          	ld	a4,-80(s0)
    800073d2:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd5e90>
  for(argc = 0; argv[argc]; argc++) {
    800073d6:	fc043783          	ld	a5,-64(s0)
    800073da:	0785                	addi	a5,a5,1
    800073dc:	fcf43023          	sd	a5,-64(s0)
    800073e0:	fc043783          	ld	a5,-64(s0)
    800073e4:	078e                	slli	a5,a5,0x3
    800073e6:	de043703          	ld	a4,-544(s0)
    800073ea:	97ba                	add	a5,a5,a4
    800073ec:	639c                	ld	a5,0(a5)
    800073ee:	f3b1                	bnez	a5,80007332 <exec+0x248>
  }
  ustack[argc] = 0;
    800073f0:	fc043783          	ld	a5,-64(s0)
    800073f4:	078e                	slli	a5,a5,0x3
    800073f6:	fe040713          	addi	a4,s0,-32
    800073fa:	97ba                	add	a5,a5,a4
    800073fc:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007400:	fc043783          	ld	a5,-64(s0)
    80007404:	0785                	addi	a5,a5,1
    80007406:	078e                	slli	a5,a5,0x3
    80007408:	fb043703          	ld	a4,-80(s0)
    8000740c:	40f707b3          	sub	a5,a4,a5
    80007410:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007414:	fb043783          	ld	a5,-80(s0)
    80007418:	9bc1                	andi	a5,a5,-16
    8000741a:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    8000741e:	fb043703          	ld	a4,-80(s0)
    80007422:	f8043783          	ld	a5,-128(s0)
    80007426:	10f76a63          	bltu	a4,a5,8000753a <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8000742a:	fc043783          	ld	a5,-64(s0)
    8000742e:	0785                	addi	a5,a5,1
    80007430:	00379713          	slli	a4,a5,0x3
    80007434:	e7040793          	addi	a5,s0,-400
    80007438:	86ba                	mv	a3,a4
    8000743a:	863e                	mv	a2,a5
    8000743c:	fb043583          	ld	a1,-80(s0)
    80007440:	fa043503          	ld	a0,-96(s0)
    80007444:	ffffb097          	auipc	ra,0xffffb
    80007448:	ea2080e7          	jalr	-350(ra) # 800022e6 <copyout>
    8000744c:	87aa                	mv	a5,a0
    8000744e:	0e07c863          	bltz	a5,8000753e <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007452:	f9843783          	ld	a5,-104(s0)
    80007456:	6fbc                	ld	a5,88(a5)
    80007458:	fb043703          	ld	a4,-80(s0)
    8000745c:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    8000745e:	de843783          	ld	a5,-536(s0)
    80007462:	fcf43c23          	sd	a5,-40(s0)
    80007466:	fd843783          	ld	a5,-40(s0)
    8000746a:	fcf43823          	sd	a5,-48(s0)
    8000746e:	a025                	j	80007496 <exec+0x3ac>
    if(*s == '/')
    80007470:	fd843783          	ld	a5,-40(s0)
    80007474:	0007c783          	lbu	a5,0(a5)
    80007478:	873e                	mv	a4,a5
    8000747a:	02f00793          	li	a5,47
    8000747e:	00f71763          	bne	a4,a5,8000748c <exec+0x3a2>
      last = s+1;
    80007482:	fd843783          	ld	a5,-40(s0)
    80007486:	0785                	addi	a5,a5,1
    80007488:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    8000748c:	fd843783          	ld	a5,-40(s0)
    80007490:	0785                	addi	a5,a5,1
    80007492:	fcf43c23          	sd	a5,-40(s0)
    80007496:	fd843783          	ld	a5,-40(s0)
    8000749a:	0007c783          	lbu	a5,0(a5)
    8000749e:	fbe9                	bnez	a5,80007470 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    800074a0:	f9843783          	ld	a5,-104(s0)
    800074a4:	15878793          	addi	a5,a5,344
    800074a8:	4641                	li	a2,16
    800074aa:	fd043583          	ld	a1,-48(s0)
    800074ae:	853e                	mv	a0,a5
    800074b0:	ffffa097          	auipc	ra,0xffffa
    800074b4:	296080e7          	jalr	662(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    800074b8:	f9843783          	ld	a5,-104(s0)
    800074bc:	6bbc                	ld	a5,80(a5)
    800074be:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    800074c2:	f9843783          	ld	a5,-104(s0)
    800074c6:	fa043703          	ld	a4,-96(s0)
    800074ca:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    800074cc:	f9843783          	ld	a5,-104(s0)
    800074d0:	fb843703          	ld	a4,-72(s0)
    800074d4:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    800074d6:	f9843783          	ld	a5,-104(s0)
    800074da:	6fbc                	ld	a5,88(a5)
    800074dc:	e4843703          	ld	a4,-440(s0)
    800074e0:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    800074e2:	f9843783          	ld	a5,-104(s0)
    800074e6:	6fbc                	ld	a5,88(a5)
    800074e8:	fb043703          	ld	a4,-80(s0)
    800074ec:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    800074ee:	f9043583          	ld	a1,-112(s0)
    800074f2:	f7843503          	ld	a0,-136(s0)
    800074f6:	ffffb097          	auipc	ra,0xffffb
    800074fa:	640080e7          	jalr	1600(ra) # 80002b36 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    800074fe:	fc043783          	ld	a5,-64(s0)
    80007502:	2781                	sext.w	a5,a5
    80007504:	a0bd                	j	80007572 <exec+0x488>
    goto bad;
    80007506:	0001                	nop
    80007508:	a825                	j	80007540 <exec+0x456>
    goto bad;
    8000750a:	0001                	nop
    8000750c:	a815                	j	80007540 <exec+0x456>
    goto bad;
    8000750e:	0001                	nop
    80007510:	a805                	j	80007540 <exec+0x456>
      goto bad;
    80007512:	0001                	nop
    80007514:	a035                	j	80007540 <exec+0x456>
      goto bad;
    80007516:	0001                	nop
    80007518:	a025                	j	80007540 <exec+0x456>
      goto bad;
    8000751a:	0001                	nop
    8000751c:	a015                	j	80007540 <exec+0x456>
      goto bad;
    8000751e:	0001                	nop
    80007520:	a005                	j	80007540 <exec+0x456>
      goto bad;
    80007522:	0001                	nop
    80007524:	a831                	j	80007540 <exec+0x456>
      goto bad;
    80007526:	0001                	nop
    80007528:	a821                	j	80007540 <exec+0x456>
    goto bad;
    8000752a:	0001                	nop
    8000752c:	a811                	j	80007540 <exec+0x456>
      goto bad;
    8000752e:	0001                	nop
    80007530:	a801                	j	80007540 <exec+0x456>
      goto bad;
    80007532:	0001                	nop
    80007534:	a031                	j	80007540 <exec+0x456>
      goto bad;
    80007536:	0001                	nop
    80007538:	a021                	j	80007540 <exec+0x456>
    goto bad;
    8000753a:	0001                	nop
    8000753c:	a011                	j	80007540 <exec+0x456>
    goto bad;
    8000753e:	0001                	nop

 bad:
  if(pagetable)
    80007540:	fa043783          	ld	a5,-96(s0)
    80007544:	cb89                	beqz	a5,80007556 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    80007546:	fb843583          	ld	a1,-72(s0)
    8000754a:	fa043503          	ld	a0,-96(s0)
    8000754e:	ffffb097          	auipc	ra,0xffffb
    80007552:	5e8080e7          	jalr	1512(ra) # 80002b36 <proc_freepagetable>
  if(ip){
    80007556:	fa843783          	ld	a5,-88(s0)
    8000755a:	cb99                	beqz	a5,80007570 <exec+0x486>
    iunlockput(ip);
    8000755c:	fa843503          	ld	a0,-88(s0)
    80007560:	ffffe097          	auipc	ra,0xffffe
    80007564:	d4e080e7          	jalr	-690(ra) # 800052ae <iunlockput>
    end_op();
    80007568:	fffff097          	auipc	ra,0xfffff
    8000756c:	c04080e7          	jalr	-1020(ra) # 8000616c <end_op>
  }
  return -1;
    80007570:	57fd                	li	a5,-1
}
    80007572:	853e                	mv	a0,a5
    80007574:	21813083          	ld	ra,536(sp)
    80007578:	21013403          	ld	s0,528(sp)
    8000757c:	20813483          	ld	s1,520(sp)
    80007580:	22010113          	addi	sp,sp,544
    80007584:	8082                	ret

0000000080007586 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007586:	7139                	addi	sp,sp,-64
    80007588:	fc06                	sd	ra,56(sp)
    8000758a:	f822                	sd	s0,48(sp)
    8000758c:	0080                	addi	s0,sp,64
    8000758e:	fca43c23          	sd	a0,-40(s0)
    80007592:	fcb43823          	sd	a1,-48(s0)
    80007596:	fcc43423          	sd	a2,-56(s0)
    8000759a:	87b6                	mv	a5,a3
    8000759c:	fcf42223          	sw	a5,-60(s0)
    800075a0:	87ba                	mv	a5,a4
    800075a2:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800075a6:	fe042623          	sw	zero,-20(s0)
    800075aa:	a05d                	j	80007650 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800075ac:	fec46703          	lwu	a4,-20(s0)
    800075b0:	fd043783          	ld	a5,-48(s0)
    800075b4:	97ba                	add	a5,a5,a4
    800075b6:	85be                	mv	a1,a5
    800075b8:	fd843503          	ld	a0,-40(s0)
    800075bc:	ffffa097          	auipc	ra,0xffffa
    800075c0:	5d8080e7          	jalr	1496(ra) # 80001b94 <walkaddr>
    800075c4:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800075c8:	fe043783          	ld	a5,-32(s0)
    800075cc:	eb89                	bnez	a5,800075de <loadseg+0x58>
      panic("loadseg: address should exist");
    800075ce:	00004517          	auipc	a0,0x4
    800075d2:	01a50513          	addi	a0,a0,26 # 8000b5e8 <etext+0x5e8>
    800075d6:	ffff9097          	auipc	ra,0xffff9
    800075da:	6a8080e7          	jalr	1704(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    800075de:	fc042703          	lw	a4,-64(s0)
    800075e2:	fec42783          	lw	a5,-20(s0)
    800075e6:	40f707bb          	subw	a5,a4,a5
    800075ea:	2781                	sext.w	a5,a5
    800075ec:	873e                	mv	a4,a5
    800075ee:	6785                	lui	a5,0x1
    800075f0:	00f77b63          	bgeu	a4,a5,80007606 <loadseg+0x80>
      n = sz - i;
    800075f4:	fc042703          	lw	a4,-64(s0)
    800075f8:	fec42783          	lw	a5,-20(s0)
    800075fc:	40f707bb          	subw	a5,a4,a5
    80007600:	fef42423          	sw	a5,-24(s0)
    80007604:	a021                	j	8000760c <loadseg+0x86>
    else
      n = PGSIZE;
    80007606:	6785                	lui	a5,0x1
    80007608:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    8000760c:	fc442703          	lw	a4,-60(s0)
    80007610:	fec42783          	lw	a5,-20(s0)
    80007614:	9fb9                	addw	a5,a5,a4
    80007616:	2781                	sext.w	a5,a5
    80007618:	fe842703          	lw	a4,-24(s0)
    8000761c:	86be                	mv	a3,a5
    8000761e:	fe043603          	ld	a2,-32(s0)
    80007622:	4581                	li	a1,0
    80007624:	fc843503          	ld	a0,-56(s0)
    80007628:	ffffe097          	auipc	ra,0xffffe
    8000762c:	fbe080e7          	jalr	-66(ra) # 800055e6 <readi>
    80007630:	87aa                	mv	a5,a0
    80007632:	0007871b          	sext.w	a4,a5
    80007636:	fe842783          	lw	a5,-24(s0)
    8000763a:	2781                	sext.w	a5,a5
    8000763c:	00e78463          	beq	a5,a4,80007644 <loadseg+0xbe>
      return -1;
    80007640:	57fd                	li	a5,-1
    80007642:	a005                	j	80007662 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007644:	fec42703          	lw	a4,-20(s0)
    80007648:	6785                	lui	a5,0x1
    8000764a:	9fb9                	addw	a5,a5,a4
    8000764c:	fef42623          	sw	a5,-20(s0)
    80007650:	fec42703          	lw	a4,-20(s0)
    80007654:	fc042783          	lw	a5,-64(s0)
    80007658:	2701                	sext.w	a4,a4
    8000765a:	2781                	sext.w	a5,a5
    8000765c:	f4f768e3          	bltu	a4,a5,800075ac <loadseg+0x26>
  }
  
  return 0;
    80007660:	4781                	li	a5,0
}
    80007662:	853e                	mv	a0,a5
    80007664:	70e2                	ld	ra,56(sp)
    80007666:	7442                	ld	s0,48(sp)
    80007668:	6121                	addi	sp,sp,64
    8000766a:	8082                	ret

000000008000766c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    8000766c:	7139                	addi	sp,sp,-64
    8000766e:	fc06                	sd	ra,56(sp)
    80007670:	f822                	sd	s0,48(sp)
    80007672:	0080                	addi	s0,sp,64
    80007674:	87aa                	mv	a5,a0
    80007676:	fcb43823          	sd	a1,-48(s0)
    8000767a:	fcc43423          	sd	a2,-56(s0)
    8000767e:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007682:	fe440713          	addi	a4,s0,-28
    80007686:	fdc42783          	lw	a5,-36(s0)
    8000768a:	85ba                	mv	a1,a4
    8000768c:	853e                	mv	a0,a5
    8000768e:	ffffd097          	auipc	ra,0xffffd
    80007692:	9f0080e7          	jalr	-1552(ra) # 8000407e <argint>
    80007696:	87aa                	mv	a5,a0
    80007698:	0007d463          	bgez	a5,800076a0 <argfd+0x34>
    return -1;
    8000769c:	57fd                	li	a5,-1
    8000769e:	a8b1                	j	800076fa <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    800076a0:	fe442783          	lw	a5,-28(s0)
    800076a4:	0207c863          	bltz	a5,800076d4 <argfd+0x68>
    800076a8:	fe442783          	lw	a5,-28(s0)
    800076ac:	873e                	mv	a4,a5
    800076ae:	47bd                	li	a5,15
    800076b0:	02e7c263          	blt	a5,a4,800076d4 <argfd+0x68>
    800076b4:	ffffb097          	auipc	ra,0xffffb
    800076b8:	160080e7          	jalr	352(ra) # 80002814 <myproc>
    800076bc:	872a                	mv	a4,a0
    800076be:	fe442783          	lw	a5,-28(s0)
    800076c2:	07e9                	addi	a5,a5,26
    800076c4:	078e                	slli	a5,a5,0x3
    800076c6:	97ba                	add	a5,a5,a4
    800076c8:	639c                	ld	a5,0(a5)
    800076ca:	fef43423          	sd	a5,-24(s0)
    800076ce:	fe843783          	ld	a5,-24(s0)
    800076d2:	e399                	bnez	a5,800076d8 <argfd+0x6c>
    return -1;
    800076d4:	57fd                	li	a5,-1
    800076d6:	a015                	j	800076fa <argfd+0x8e>
  if(pfd)
    800076d8:	fd043783          	ld	a5,-48(s0)
    800076dc:	c791                	beqz	a5,800076e8 <argfd+0x7c>
    *pfd = fd;
    800076de:	fe442703          	lw	a4,-28(s0)
    800076e2:	fd043783          	ld	a5,-48(s0)
    800076e6:	c398                	sw	a4,0(a5)
  if(pf)
    800076e8:	fc843783          	ld	a5,-56(s0)
    800076ec:	c791                	beqz	a5,800076f8 <argfd+0x8c>
    *pf = f;
    800076ee:	fc843783          	ld	a5,-56(s0)
    800076f2:	fe843703          	ld	a4,-24(s0)
    800076f6:	e398                	sd	a4,0(a5)
  return 0;
    800076f8:	4781                	li	a5,0
}
    800076fa:	853e                	mv	a0,a5
    800076fc:	70e2                	ld	ra,56(sp)
    800076fe:	7442                	ld	s0,48(sp)
    80007700:	6121                	addi	sp,sp,64
    80007702:	8082                	ret

0000000080007704 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007704:	7179                	addi	sp,sp,-48
    80007706:	f406                	sd	ra,40(sp)
    80007708:	f022                	sd	s0,32(sp)
    8000770a:	1800                	addi	s0,sp,48
    8000770c:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007710:	ffffb097          	auipc	ra,0xffffb
    80007714:	104080e7          	jalr	260(ra) # 80002814 <myproc>
    80007718:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    8000771c:	fe042623          	sw	zero,-20(s0)
    80007720:	a825                	j	80007758 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007722:	fe043703          	ld	a4,-32(s0)
    80007726:	fec42783          	lw	a5,-20(s0)
    8000772a:	07e9                	addi	a5,a5,26
    8000772c:	078e                	slli	a5,a5,0x3
    8000772e:	97ba                	add	a5,a5,a4
    80007730:	639c                	ld	a5,0(a5)
    80007732:	ef91                	bnez	a5,8000774e <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007734:	fe043703          	ld	a4,-32(s0)
    80007738:	fec42783          	lw	a5,-20(s0)
    8000773c:	07e9                	addi	a5,a5,26
    8000773e:	078e                	slli	a5,a5,0x3
    80007740:	97ba                	add	a5,a5,a4
    80007742:	fd843703          	ld	a4,-40(s0)
    80007746:	e398                	sd	a4,0(a5)
      return fd;
    80007748:	fec42783          	lw	a5,-20(s0)
    8000774c:	a831                	j	80007768 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    8000774e:	fec42783          	lw	a5,-20(s0)
    80007752:	2785                	addiw	a5,a5,1
    80007754:	fef42623          	sw	a5,-20(s0)
    80007758:	fec42783          	lw	a5,-20(s0)
    8000775c:	0007871b          	sext.w	a4,a5
    80007760:	47bd                	li	a5,15
    80007762:	fce7d0e3          	bge	a5,a4,80007722 <fdalloc+0x1e>
    }
  }
  return -1;
    80007766:	57fd                	li	a5,-1
}
    80007768:	853e                	mv	a0,a5
    8000776a:	70a2                	ld	ra,40(sp)
    8000776c:	7402                	ld	s0,32(sp)
    8000776e:	6145                	addi	sp,sp,48
    80007770:	8082                	ret

0000000080007772 <sys_dup>:

uint64
sys_dup(void)
{
    80007772:	1101                	addi	sp,sp,-32
    80007774:	ec06                	sd	ra,24(sp)
    80007776:	e822                	sd	s0,16(sp)
    80007778:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    8000777a:	fe040793          	addi	a5,s0,-32
    8000777e:	863e                	mv	a2,a5
    80007780:	4581                	li	a1,0
    80007782:	4501                	li	a0,0
    80007784:	00000097          	auipc	ra,0x0
    80007788:	ee8080e7          	jalr	-280(ra) # 8000766c <argfd>
    8000778c:	87aa                	mv	a5,a0
    8000778e:	0007d463          	bgez	a5,80007796 <sys_dup+0x24>
    return -1;
    80007792:	57fd                	li	a5,-1
    80007794:	a81d                	j	800077ca <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007796:	fe043783          	ld	a5,-32(s0)
    8000779a:	853e                	mv	a0,a5
    8000779c:	00000097          	auipc	ra,0x0
    800077a0:	f68080e7          	jalr	-152(ra) # 80007704 <fdalloc>
    800077a4:	87aa                	mv	a5,a0
    800077a6:	fef42623          	sw	a5,-20(s0)
    800077aa:	fec42783          	lw	a5,-20(s0)
    800077ae:	2781                	sext.w	a5,a5
    800077b0:	0007d463          	bgez	a5,800077b8 <sys_dup+0x46>
    return -1;
    800077b4:	57fd                	li	a5,-1
    800077b6:	a811                	j	800077ca <sys_dup+0x58>
  filedup(f);
    800077b8:	fe043783          	ld	a5,-32(s0)
    800077bc:	853e                	mv	a0,a5
    800077be:	fffff097          	auipc	ra,0xfffff
    800077c2:	f20080e7          	jalr	-224(ra) # 800066de <filedup>
  return fd;
    800077c6:	fec42783          	lw	a5,-20(s0)
}
    800077ca:	853e                	mv	a0,a5
    800077cc:	60e2                	ld	ra,24(sp)
    800077ce:	6442                	ld	s0,16(sp)
    800077d0:	6105                	addi	sp,sp,32
    800077d2:	8082                	ret

00000000800077d4 <sys_read>:

uint64
sys_read(void)
{
    800077d4:	7179                	addi	sp,sp,-48
    800077d6:	f406                	sd	ra,40(sp)
    800077d8:	f022                	sd	s0,32(sp)
    800077da:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    800077dc:	fe840793          	addi	a5,s0,-24
    800077e0:	863e                	mv	a2,a5
    800077e2:	4581                	li	a1,0
    800077e4:	4501                	li	a0,0
    800077e6:	00000097          	auipc	ra,0x0
    800077ea:	e86080e7          	jalr	-378(ra) # 8000766c <argfd>
    800077ee:	87aa                	mv	a5,a0
    800077f0:	0207c863          	bltz	a5,80007820 <sys_read+0x4c>
    800077f4:	fe440793          	addi	a5,s0,-28
    800077f8:	85be                	mv	a1,a5
    800077fa:	4509                	li	a0,2
    800077fc:	ffffd097          	auipc	ra,0xffffd
    80007800:	882080e7          	jalr	-1918(ra) # 8000407e <argint>
    80007804:	87aa                	mv	a5,a0
    80007806:	0007cd63          	bltz	a5,80007820 <sys_read+0x4c>
    8000780a:	fd840793          	addi	a5,s0,-40
    8000780e:	85be                	mv	a1,a5
    80007810:	4505                	li	a0,1
    80007812:	ffffd097          	auipc	ra,0xffffd
    80007816:	8a4080e7          	jalr	-1884(ra) # 800040b6 <argaddr>
    8000781a:	87aa                	mv	a5,a0
    8000781c:	0007d463          	bgez	a5,80007824 <sys_read+0x50>
    return -1;
    80007820:	57fd                	li	a5,-1
    80007822:	a839                	j	80007840 <sys_read+0x6c>
  return fileread(f, p, n);
    80007824:	fe843783          	ld	a5,-24(s0)
    80007828:	fd843703          	ld	a4,-40(s0)
    8000782c:	fe442683          	lw	a3,-28(s0)
    80007830:	8636                	mv	a2,a3
    80007832:	85ba                	mv	a1,a4
    80007834:	853e                	mv	a0,a5
    80007836:	fffff097          	auipc	ra,0xfffff
    8000783a:	0ba080e7          	jalr	186(ra) # 800068f0 <fileread>
    8000783e:	87aa                	mv	a5,a0
}
    80007840:	853e                	mv	a0,a5
    80007842:	70a2                	ld	ra,40(sp)
    80007844:	7402                	ld	s0,32(sp)
    80007846:	6145                	addi	sp,sp,48
    80007848:	8082                	ret

000000008000784a <sys_write>:

uint64
sys_write(void)
{
    8000784a:	7179                	addi	sp,sp,-48
    8000784c:	f406                	sd	ra,40(sp)
    8000784e:	f022                	sd	s0,32(sp)
    80007850:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007852:	fe840793          	addi	a5,s0,-24
    80007856:	863e                	mv	a2,a5
    80007858:	4581                	li	a1,0
    8000785a:	4501                	li	a0,0
    8000785c:	00000097          	auipc	ra,0x0
    80007860:	e10080e7          	jalr	-496(ra) # 8000766c <argfd>
    80007864:	87aa                	mv	a5,a0
    80007866:	0207c863          	bltz	a5,80007896 <sys_write+0x4c>
    8000786a:	fe440793          	addi	a5,s0,-28
    8000786e:	85be                	mv	a1,a5
    80007870:	4509                	li	a0,2
    80007872:	ffffd097          	auipc	ra,0xffffd
    80007876:	80c080e7          	jalr	-2036(ra) # 8000407e <argint>
    8000787a:	87aa                	mv	a5,a0
    8000787c:	0007cd63          	bltz	a5,80007896 <sys_write+0x4c>
    80007880:	fd840793          	addi	a5,s0,-40
    80007884:	85be                	mv	a1,a5
    80007886:	4505                	li	a0,1
    80007888:	ffffd097          	auipc	ra,0xffffd
    8000788c:	82e080e7          	jalr	-2002(ra) # 800040b6 <argaddr>
    80007890:	87aa                	mv	a5,a0
    80007892:	0007d463          	bgez	a5,8000789a <sys_write+0x50>
    return -1;
    80007896:	57fd                	li	a5,-1
    80007898:	a839                	j	800078b6 <sys_write+0x6c>

  return filewrite(f, p, n);
    8000789a:	fe843783          	ld	a5,-24(s0)
    8000789e:	fd843703          	ld	a4,-40(s0)
    800078a2:	fe442683          	lw	a3,-28(s0)
    800078a6:	8636                	mv	a2,a3
    800078a8:	85ba                	mv	a1,a4
    800078aa:	853e                	mv	a0,a5
    800078ac:	fffff097          	auipc	ra,0xfffff
    800078b0:	1aa080e7          	jalr	426(ra) # 80006a56 <filewrite>
    800078b4:	87aa                	mv	a5,a0
}
    800078b6:	853e                	mv	a0,a5
    800078b8:	70a2                	ld	ra,40(sp)
    800078ba:	7402                	ld	s0,32(sp)
    800078bc:	6145                	addi	sp,sp,48
    800078be:	8082                	ret

00000000800078c0 <sys_close>:

uint64
sys_close(void)
{
    800078c0:	1101                	addi	sp,sp,-32
    800078c2:	ec06                	sd	ra,24(sp)
    800078c4:	e822                	sd	s0,16(sp)
    800078c6:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    800078c8:	fe040713          	addi	a4,s0,-32
    800078cc:	fec40793          	addi	a5,s0,-20
    800078d0:	863a                	mv	a2,a4
    800078d2:	85be                	mv	a1,a5
    800078d4:	4501                	li	a0,0
    800078d6:	00000097          	auipc	ra,0x0
    800078da:	d96080e7          	jalr	-618(ra) # 8000766c <argfd>
    800078de:	87aa                	mv	a5,a0
    800078e0:	0007d463          	bgez	a5,800078e8 <sys_close+0x28>
    return -1;
    800078e4:	57fd                	li	a5,-1
    800078e6:	a02d                	j	80007910 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    800078e8:	ffffb097          	auipc	ra,0xffffb
    800078ec:	f2c080e7          	jalr	-212(ra) # 80002814 <myproc>
    800078f0:	872a                	mv	a4,a0
    800078f2:	fec42783          	lw	a5,-20(s0)
    800078f6:	07e9                	addi	a5,a5,26
    800078f8:	078e                	slli	a5,a5,0x3
    800078fa:	97ba                	add	a5,a5,a4
    800078fc:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007900:	fe043783          	ld	a5,-32(s0)
    80007904:	853e                	mv	a0,a5
    80007906:	fffff097          	auipc	ra,0xfffff
    8000790a:	e3e080e7          	jalr	-450(ra) # 80006744 <fileclose>
  return 0;
    8000790e:	4781                	li	a5,0
}
    80007910:	853e                	mv	a0,a5
    80007912:	60e2                	ld	ra,24(sp)
    80007914:	6442                	ld	s0,16(sp)
    80007916:	6105                	addi	sp,sp,32
    80007918:	8082                	ret

000000008000791a <sys_fstat>:

uint64
sys_fstat(void)
{
    8000791a:	1101                	addi	sp,sp,-32
    8000791c:	ec06                	sd	ra,24(sp)
    8000791e:	e822                	sd	s0,16(sp)
    80007920:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80007922:	fe840793          	addi	a5,s0,-24
    80007926:	863e                	mv	a2,a5
    80007928:	4581                	li	a1,0
    8000792a:	4501                	li	a0,0
    8000792c:	00000097          	auipc	ra,0x0
    80007930:	d40080e7          	jalr	-704(ra) # 8000766c <argfd>
    80007934:	87aa                	mv	a5,a0
    80007936:	0007cd63          	bltz	a5,80007950 <sys_fstat+0x36>
    8000793a:	fe040793          	addi	a5,s0,-32
    8000793e:	85be                	mv	a1,a5
    80007940:	4505                	li	a0,1
    80007942:	ffffc097          	auipc	ra,0xffffc
    80007946:	774080e7          	jalr	1908(ra) # 800040b6 <argaddr>
    8000794a:	87aa                	mv	a5,a0
    8000794c:	0007d463          	bgez	a5,80007954 <sys_fstat+0x3a>
    return -1;
    80007950:	57fd                	li	a5,-1
    80007952:	a821                	j	8000796a <sys_fstat+0x50>
  return filestat(f, st);
    80007954:	fe843783          	ld	a5,-24(s0)
    80007958:	fe043703          	ld	a4,-32(s0)
    8000795c:	85ba                	mv	a1,a4
    8000795e:	853e                	mv	a0,a5
    80007960:	fffff097          	auipc	ra,0xfffff
    80007964:	eec080e7          	jalr	-276(ra) # 8000684c <filestat>
    80007968:	87aa                	mv	a5,a0
}
    8000796a:	853e                	mv	a0,a5
    8000796c:	60e2                	ld	ra,24(sp)
    8000796e:	6442                	ld	s0,16(sp)
    80007970:	6105                	addi	sp,sp,32
    80007972:	8082                	ret

0000000080007974 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007974:	7169                	addi	sp,sp,-304
    80007976:	f606                	sd	ra,296(sp)
    80007978:	f222                	sd	s0,288(sp)
    8000797a:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    8000797c:	ed040793          	addi	a5,s0,-304
    80007980:	08000613          	li	a2,128
    80007984:	85be                	mv	a1,a5
    80007986:	4501                	li	a0,0
    80007988:	ffffc097          	auipc	ra,0xffffc
    8000798c:	762080e7          	jalr	1890(ra) # 800040ea <argstr>
    80007990:	87aa                	mv	a5,a0
    80007992:	0007cf63          	bltz	a5,800079b0 <sys_link+0x3c>
    80007996:	f5040793          	addi	a5,s0,-176
    8000799a:	08000613          	li	a2,128
    8000799e:	85be                	mv	a1,a5
    800079a0:	4505                	li	a0,1
    800079a2:	ffffc097          	auipc	ra,0xffffc
    800079a6:	748080e7          	jalr	1864(ra) # 800040ea <argstr>
    800079aa:	87aa                	mv	a5,a0
    800079ac:	0007d463          	bgez	a5,800079b4 <sys_link+0x40>
    return -1;
    800079b0:	57fd                	li	a5,-1
    800079b2:	aab5                	j	80007b2e <sys_link+0x1ba>

  begin_op();
    800079b4:	ffffe097          	auipc	ra,0xffffe
    800079b8:	6f6080e7          	jalr	1782(ra) # 800060aa <begin_op>
  if((ip = namei(old)) == 0){
    800079bc:	ed040793          	addi	a5,s0,-304
    800079c0:	853e                	mv	a0,a5
    800079c2:	ffffe097          	auipc	ra,0xffffe
    800079c6:	384080e7          	jalr	900(ra) # 80005d46 <namei>
    800079ca:	fea43423          	sd	a0,-24(s0)
    800079ce:	fe843783          	ld	a5,-24(s0)
    800079d2:	e799                	bnez	a5,800079e0 <sys_link+0x6c>
    end_op();
    800079d4:	ffffe097          	auipc	ra,0xffffe
    800079d8:	798080e7          	jalr	1944(ra) # 8000616c <end_op>
    return -1;
    800079dc:	57fd                	li	a5,-1
    800079de:	aa81                	j	80007b2e <sys_link+0x1ba>
  }

  ilock(ip);
    800079e0:	fe843503          	ld	a0,-24(s0)
    800079e4:	ffffd097          	auipc	ra,0xffffd
    800079e8:	66c080e7          	jalr	1644(ra) # 80005050 <ilock>
  if(ip->type == T_DIR){
    800079ec:	fe843783          	ld	a5,-24(s0)
    800079f0:	04479783          	lh	a5,68(a5)
    800079f4:	0007871b          	sext.w	a4,a5
    800079f8:	4785                	li	a5,1
    800079fa:	00f71e63          	bne	a4,a5,80007a16 <sys_link+0xa2>
    iunlockput(ip);
    800079fe:	fe843503          	ld	a0,-24(s0)
    80007a02:	ffffe097          	auipc	ra,0xffffe
    80007a06:	8ac080e7          	jalr	-1876(ra) # 800052ae <iunlockput>
    end_op();
    80007a0a:	ffffe097          	auipc	ra,0xffffe
    80007a0e:	762080e7          	jalr	1890(ra) # 8000616c <end_op>
    return -1;
    80007a12:	57fd                	li	a5,-1
    80007a14:	aa29                	j	80007b2e <sys_link+0x1ba>
  }

  ip->nlink++;
    80007a16:	fe843783          	ld	a5,-24(s0)
    80007a1a:	04a79783          	lh	a5,74(a5)
    80007a1e:	17c2                	slli	a5,a5,0x30
    80007a20:	93c1                	srli	a5,a5,0x30
    80007a22:	2785                	addiw	a5,a5,1
    80007a24:	17c2                	slli	a5,a5,0x30
    80007a26:	93c1                	srli	a5,a5,0x30
    80007a28:	0107971b          	slliw	a4,a5,0x10
    80007a2c:	4107571b          	sraiw	a4,a4,0x10
    80007a30:	fe843783          	ld	a5,-24(s0)
    80007a34:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007a38:	fe843503          	ld	a0,-24(s0)
    80007a3c:	ffffd097          	auipc	ra,0xffffd
    80007a40:	3c4080e7          	jalr	964(ra) # 80004e00 <iupdate>
  iunlock(ip);
    80007a44:	fe843503          	ld	a0,-24(s0)
    80007a48:	ffffd097          	auipc	ra,0xffffd
    80007a4c:	73c080e7          	jalr	1852(ra) # 80005184 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007a50:	fd040713          	addi	a4,s0,-48
    80007a54:	f5040793          	addi	a5,s0,-176
    80007a58:	85ba                	mv	a1,a4
    80007a5a:	853e                	mv	a0,a5
    80007a5c:	ffffe097          	auipc	ra,0xffffe
    80007a60:	316080e7          	jalr	790(ra) # 80005d72 <nameiparent>
    80007a64:	fea43023          	sd	a0,-32(s0)
    80007a68:	fe043783          	ld	a5,-32(s0)
    80007a6c:	cba5                	beqz	a5,80007adc <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007a6e:	fe043503          	ld	a0,-32(s0)
    80007a72:	ffffd097          	auipc	ra,0xffffd
    80007a76:	5de080e7          	jalr	1502(ra) # 80005050 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007a7a:	fe043783          	ld	a5,-32(s0)
    80007a7e:	4398                	lw	a4,0(a5)
    80007a80:	fe843783          	ld	a5,-24(s0)
    80007a84:	439c                	lw	a5,0(a5)
    80007a86:	02f71263          	bne	a4,a5,80007aaa <sys_link+0x136>
    80007a8a:	fe843783          	ld	a5,-24(s0)
    80007a8e:	43d8                	lw	a4,4(a5)
    80007a90:	fd040793          	addi	a5,s0,-48
    80007a94:	863a                	mv	a2,a4
    80007a96:	85be                	mv	a1,a5
    80007a98:	fe043503          	ld	a0,-32(s0)
    80007a9c:	ffffe097          	auipc	ra,0xffffe
    80007aa0:	f90080e7          	jalr	-112(ra) # 80005a2c <dirlink>
    80007aa4:	87aa                	mv	a5,a0
    80007aa6:	0007d963          	bgez	a5,80007ab8 <sys_link+0x144>
    iunlockput(dp);
    80007aaa:	fe043503          	ld	a0,-32(s0)
    80007aae:	ffffe097          	auipc	ra,0xffffe
    80007ab2:	800080e7          	jalr	-2048(ra) # 800052ae <iunlockput>
    goto bad;
    80007ab6:	a025                	j	80007ade <sys_link+0x16a>
  }
  iunlockput(dp);
    80007ab8:	fe043503          	ld	a0,-32(s0)
    80007abc:	ffffd097          	auipc	ra,0xffffd
    80007ac0:	7f2080e7          	jalr	2034(ra) # 800052ae <iunlockput>
  iput(ip);
    80007ac4:	fe843503          	ld	a0,-24(s0)
    80007ac8:	ffffd097          	auipc	ra,0xffffd
    80007acc:	716080e7          	jalr	1814(ra) # 800051de <iput>

  end_op();
    80007ad0:	ffffe097          	auipc	ra,0xffffe
    80007ad4:	69c080e7          	jalr	1692(ra) # 8000616c <end_op>

  return 0;
    80007ad8:	4781                	li	a5,0
    80007ada:	a891                	j	80007b2e <sys_link+0x1ba>
    goto bad;
    80007adc:	0001                	nop

bad:
  ilock(ip);
    80007ade:	fe843503          	ld	a0,-24(s0)
    80007ae2:	ffffd097          	auipc	ra,0xffffd
    80007ae6:	56e080e7          	jalr	1390(ra) # 80005050 <ilock>
  ip->nlink--;
    80007aea:	fe843783          	ld	a5,-24(s0)
    80007aee:	04a79783          	lh	a5,74(a5)
    80007af2:	17c2                	slli	a5,a5,0x30
    80007af4:	93c1                	srli	a5,a5,0x30
    80007af6:	37fd                	addiw	a5,a5,-1
    80007af8:	17c2                	slli	a5,a5,0x30
    80007afa:	93c1                	srli	a5,a5,0x30
    80007afc:	0107971b          	slliw	a4,a5,0x10
    80007b00:	4107571b          	sraiw	a4,a4,0x10
    80007b04:	fe843783          	ld	a5,-24(s0)
    80007b08:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007b0c:	fe843503          	ld	a0,-24(s0)
    80007b10:	ffffd097          	auipc	ra,0xffffd
    80007b14:	2f0080e7          	jalr	752(ra) # 80004e00 <iupdate>
  iunlockput(ip);
    80007b18:	fe843503          	ld	a0,-24(s0)
    80007b1c:	ffffd097          	auipc	ra,0xffffd
    80007b20:	792080e7          	jalr	1938(ra) # 800052ae <iunlockput>
  end_op();
    80007b24:	ffffe097          	auipc	ra,0xffffe
    80007b28:	648080e7          	jalr	1608(ra) # 8000616c <end_op>
  return -1;
    80007b2c:	57fd                	li	a5,-1
}
    80007b2e:	853e                	mv	a0,a5
    80007b30:	70b2                	ld	ra,296(sp)
    80007b32:	7412                	ld	s0,288(sp)
    80007b34:	6155                	addi	sp,sp,304
    80007b36:	8082                	ret

0000000080007b38 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007b38:	7139                	addi	sp,sp,-64
    80007b3a:	fc06                	sd	ra,56(sp)
    80007b3c:	f822                	sd	s0,48(sp)
    80007b3e:	0080                	addi	s0,sp,64
    80007b40:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007b44:	02000793          	li	a5,32
    80007b48:	fef42623          	sw	a5,-20(s0)
    80007b4c:	a0b1                	j	80007b98 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007b4e:	fd840793          	addi	a5,s0,-40
    80007b52:	fec42683          	lw	a3,-20(s0)
    80007b56:	4741                	li	a4,16
    80007b58:	863e                	mv	a2,a5
    80007b5a:	4581                	li	a1,0
    80007b5c:	fc843503          	ld	a0,-56(s0)
    80007b60:	ffffe097          	auipc	ra,0xffffe
    80007b64:	a86080e7          	jalr	-1402(ra) # 800055e6 <readi>
    80007b68:	87aa                	mv	a5,a0
    80007b6a:	873e                	mv	a4,a5
    80007b6c:	47c1                	li	a5,16
    80007b6e:	00f70a63          	beq	a4,a5,80007b82 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007b72:	00004517          	auipc	a0,0x4
    80007b76:	a9650513          	addi	a0,a0,-1386 # 8000b608 <etext+0x608>
    80007b7a:	ffff9097          	auipc	ra,0xffff9
    80007b7e:	104080e7          	jalr	260(ra) # 80000c7e <panic>
    if(de.inum != 0)
    80007b82:	fd845783          	lhu	a5,-40(s0)
    80007b86:	c399                	beqz	a5,80007b8c <isdirempty+0x54>
      return 0;
    80007b88:	4781                	li	a5,0
    80007b8a:	a839                	j	80007ba8 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007b8c:	fec42783          	lw	a5,-20(s0)
    80007b90:	27c1                	addiw	a5,a5,16
    80007b92:	2781                	sext.w	a5,a5
    80007b94:	fef42623          	sw	a5,-20(s0)
    80007b98:	fc843783          	ld	a5,-56(s0)
    80007b9c:	47f8                	lw	a4,76(a5)
    80007b9e:	fec42783          	lw	a5,-20(s0)
    80007ba2:	fae7e6e3          	bltu	a5,a4,80007b4e <isdirempty+0x16>
  }
  return 1;
    80007ba6:	4785                	li	a5,1
}
    80007ba8:	853e                	mv	a0,a5
    80007baa:	70e2                	ld	ra,56(sp)
    80007bac:	7442                	ld	s0,48(sp)
    80007bae:	6121                	addi	sp,sp,64
    80007bb0:	8082                	ret

0000000080007bb2 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007bb2:	7155                	addi	sp,sp,-208
    80007bb4:	e586                	sd	ra,200(sp)
    80007bb6:	e1a2                	sd	s0,192(sp)
    80007bb8:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007bba:	f4040793          	addi	a5,s0,-192
    80007bbe:	08000613          	li	a2,128
    80007bc2:	85be                	mv	a1,a5
    80007bc4:	4501                	li	a0,0
    80007bc6:	ffffc097          	auipc	ra,0xffffc
    80007bca:	524080e7          	jalr	1316(ra) # 800040ea <argstr>
    80007bce:	87aa                	mv	a5,a0
    80007bd0:	0007d463          	bgez	a5,80007bd8 <sys_unlink+0x26>
    return -1;
    80007bd4:	57fd                	li	a5,-1
    80007bd6:	a2ed                	j	80007dc0 <sys_unlink+0x20e>

  begin_op();
    80007bd8:	ffffe097          	auipc	ra,0xffffe
    80007bdc:	4d2080e7          	jalr	1234(ra) # 800060aa <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007be0:	fc040713          	addi	a4,s0,-64
    80007be4:	f4040793          	addi	a5,s0,-192
    80007be8:	85ba                	mv	a1,a4
    80007bea:	853e                	mv	a0,a5
    80007bec:	ffffe097          	auipc	ra,0xffffe
    80007bf0:	186080e7          	jalr	390(ra) # 80005d72 <nameiparent>
    80007bf4:	fea43423          	sd	a0,-24(s0)
    80007bf8:	fe843783          	ld	a5,-24(s0)
    80007bfc:	e799                	bnez	a5,80007c0a <sys_unlink+0x58>
    end_op();
    80007bfe:	ffffe097          	auipc	ra,0xffffe
    80007c02:	56e080e7          	jalr	1390(ra) # 8000616c <end_op>
    return -1;
    80007c06:	57fd                	li	a5,-1
    80007c08:	aa65                	j	80007dc0 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007c0a:	fe843503          	ld	a0,-24(s0)
    80007c0e:	ffffd097          	auipc	ra,0xffffd
    80007c12:	442080e7          	jalr	1090(ra) # 80005050 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007c16:	fc040793          	addi	a5,s0,-64
    80007c1a:	00004597          	auipc	a1,0x4
    80007c1e:	a0658593          	addi	a1,a1,-1530 # 8000b620 <etext+0x620>
    80007c22:	853e                	mv	a0,a5
    80007c24:	ffffe097          	auipc	ra,0xffffe
    80007c28:	cf2080e7          	jalr	-782(ra) # 80005916 <namecmp>
    80007c2c:	87aa                	mv	a5,a0
    80007c2e:	16078b63          	beqz	a5,80007da4 <sys_unlink+0x1f2>
    80007c32:	fc040793          	addi	a5,s0,-64
    80007c36:	00004597          	auipc	a1,0x4
    80007c3a:	9f258593          	addi	a1,a1,-1550 # 8000b628 <etext+0x628>
    80007c3e:	853e                	mv	a0,a5
    80007c40:	ffffe097          	auipc	ra,0xffffe
    80007c44:	cd6080e7          	jalr	-810(ra) # 80005916 <namecmp>
    80007c48:	87aa                	mv	a5,a0
    80007c4a:	14078d63          	beqz	a5,80007da4 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007c4e:	f3c40713          	addi	a4,s0,-196
    80007c52:	fc040793          	addi	a5,s0,-64
    80007c56:	863a                	mv	a2,a4
    80007c58:	85be                	mv	a1,a5
    80007c5a:	fe843503          	ld	a0,-24(s0)
    80007c5e:	ffffe097          	auipc	ra,0xffffe
    80007c62:	ce6080e7          	jalr	-794(ra) # 80005944 <dirlookup>
    80007c66:	fea43023          	sd	a0,-32(s0)
    80007c6a:	fe043783          	ld	a5,-32(s0)
    80007c6e:	12078d63          	beqz	a5,80007da8 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007c72:	fe043503          	ld	a0,-32(s0)
    80007c76:	ffffd097          	auipc	ra,0xffffd
    80007c7a:	3da080e7          	jalr	986(ra) # 80005050 <ilock>

  if(ip->nlink < 1)
    80007c7e:	fe043783          	ld	a5,-32(s0)
    80007c82:	04a79783          	lh	a5,74(a5)
    80007c86:	2781                	sext.w	a5,a5
    80007c88:	00f04a63          	bgtz	a5,80007c9c <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007c8c:	00004517          	auipc	a0,0x4
    80007c90:	9a450513          	addi	a0,a0,-1628 # 8000b630 <etext+0x630>
    80007c94:	ffff9097          	auipc	ra,0xffff9
    80007c98:	fea080e7          	jalr	-22(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007c9c:	fe043783          	ld	a5,-32(s0)
    80007ca0:	04479783          	lh	a5,68(a5)
    80007ca4:	0007871b          	sext.w	a4,a5
    80007ca8:	4785                	li	a5,1
    80007caa:	02f71163          	bne	a4,a5,80007ccc <sys_unlink+0x11a>
    80007cae:	fe043503          	ld	a0,-32(s0)
    80007cb2:	00000097          	auipc	ra,0x0
    80007cb6:	e86080e7          	jalr	-378(ra) # 80007b38 <isdirempty>
    80007cba:	87aa                	mv	a5,a0
    80007cbc:	eb81                	bnez	a5,80007ccc <sys_unlink+0x11a>
    iunlockput(ip);
    80007cbe:	fe043503          	ld	a0,-32(s0)
    80007cc2:	ffffd097          	auipc	ra,0xffffd
    80007cc6:	5ec080e7          	jalr	1516(ra) # 800052ae <iunlockput>
    goto bad;
    80007cca:	a0c5                	j	80007daa <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007ccc:	fd040793          	addi	a5,s0,-48
    80007cd0:	4641                	li	a2,16
    80007cd2:	4581                	li	a1,0
    80007cd4:	853e                	mv	a0,a5
    80007cd6:	ffff9097          	auipc	ra,0xffff9
    80007cda:	76c080e7          	jalr	1900(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007cde:	fd040793          	addi	a5,s0,-48
    80007ce2:	f3c42683          	lw	a3,-196(s0)
    80007ce6:	4741                	li	a4,16
    80007ce8:	863e                	mv	a2,a5
    80007cea:	4581                	li	a1,0
    80007cec:	fe843503          	ld	a0,-24(s0)
    80007cf0:	ffffe097          	auipc	ra,0xffffe
    80007cf4:	a80080e7          	jalr	-1408(ra) # 80005770 <writei>
    80007cf8:	87aa                	mv	a5,a0
    80007cfa:	873e                	mv	a4,a5
    80007cfc:	47c1                	li	a5,16
    80007cfe:	00f70a63          	beq	a4,a5,80007d12 <sys_unlink+0x160>
    panic("unlink: writei");
    80007d02:	00004517          	auipc	a0,0x4
    80007d06:	94650513          	addi	a0,a0,-1722 # 8000b648 <etext+0x648>
    80007d0a:	ffff9097          	auipc	ra,0xffff9
    80007d0e:	f74080e7          	jalr	-140(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    80007d12:	fe043783          	ld	a5,-32(s0)
    80007d16:	04479783          	lh	a5,68(a5)
    80007d1a:	0007871b          	sext.w	a4,a5
    80007d1e:	4785                	li	a5,1
    80007d20:	02f71963          	bne	a4,a5,80007d52 <sys_unlink+0x1a0>
    dp->nlink--;
    80007d24:	fe843783          	ld	a5,-24(s0)
    80007d28:	04a79783          	lh	a5,74(a5)
    80007d2c:	17c2                	slli	a5,a5,0x30
    80007d2e:	93c1                	srli	a5,a5,0x30
    80007d30:	37fd                	addiw	a5,a5,-1
    80007d32:	17c2                	slli	a5,a5,0x30
    80007d34:	93c1                	srli	a5,a5,0x30
    80007d36:	0107971b          	slliw	a4,a5,0x10
    80007d3a:	4107571b          	sraiw	a4,a4,0x10
    80007d3e:	fe843783          	ld	a5,-24(s0)
    80007d42:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007d46:	fe843503          	ld	a0,-24(s0)
    80007d4a:	ffffd097          	auipc	ra,0xffffd
    80007d4e:	0b6080e7          	jalr	182(ra) # 80004e00 <iupdate>
  }
  iunlockput(dp);
    80007d52:	fe843503          	ld	a0,-24(s0)
    80007d56:	ffffd097          	auipc	ra,0xffffd
    80007d5a:	558080e7          	jalr	1368(ra) # 800052ae <iunlockput>

  ip->nlink--;
    80007d5e:	fe043783          	ld	a5,-32(s0)
    80007d62:	04a79783          	lh	a5,74(a5)
    80007d66:	17c2                	slli	a5,a5,0x30
    80007d68:	93c1                	srli	a5,a5,0x30
    80007d6a:	37fd                	addiw	a5,a5,-1
    80007d6c:	17c2                	slli	a5,a5,0x30
    80007d6e:	93c1                	srli	a5,a5,0x30
    80007d70:	0107971b          	slliw	a4,a5,0x10
    80007d74:	4107571b          	sraiw	a4,a4,0x10
    80007d78:	fe043783          	ld	a5,-32(s0)
    80007d7c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d80:	fe043503          	ld	a0,-32(s0)
    80007d84:	ffffd097          	auipc	ra,0xffffd
    80007d88:	07c080e7          	jalr	124(ra) # 80004e00 <iupdate>
  iunlockput(ip);
    80007d8c:	fe043503          	ld	a0,-32(s0)
    80007d90:	ffffd097          	auipc	ra,0xffffd
    80007d94:	51e080e7          	jalr	1310(ra) # 800052ae <iunlockput>

  end_op();
    80007d98:	ffffe097          	auipc	ra,0xffffe
    80007d9c:	3d4080e7          	jalr	980(ra) # 8000616c <end_op>

  return 0;
    80007da0:	4781                	li	a5,0
    80007da2:	a839                	j	80007dc0 <sys_unlink+0x20e>
    goto bad;
    80007da4:	0001                	nop
    80007da6:	a011                	j	80007daa <sys_unlink+0x1f8>
    goto bad;
    80007da8:	0001                	nop

bad:
  iunlockput(dp);
    80007daa:	fe843503          	ld	a0,-24(s0)
    80007dae:	ffffd097          	auipc	ra,0xffffd
    80007db2:	500080e7          	jalr	1280(ra) # 800052ae <iunlockput>
  end_op();
    80007db6:	ffffe097          	auipc	ra,0xffffe
    80007dba:	3b6080e7          	jalr	950(ra) # 8000616c <end_op>
  return -1;
    80007dbe:	57fd                	li	a5,-1
}
    80007dc0:	853e                	mv	a0,a5
    80007dc2:	60ae                	ld	ra,200(sp)
    80007dc4:	640e                	ld	s0,192(sp)
    80007dc6:	6169                	addi	sp,sp,208
    80007dc8:	8082                	ret

0000000080007dca <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80007dca:	7139                	addi	sp,sp,-64
    80007dcc:	fc06                	sd	ra,56(sp)
    80007dce:	f822                	sd	s0,48(sp)
    80007dd0:	0080                	addi	s0,sp,64
    80007dd2:	fca43423          	sd	a0,-56(s0)
    80007dd6:	87ae                	mv	a5,a1
    80007dd8:	8736                	mv	a4,a3
    80007dda:	fcf41323          	sh	a5,-58(s0)
    80007dde:	87b2                	mv	a5,a2
    80007de0:	fcf41223          	sh	a5,-60(s0)
    80007de4:	87ba                	mv	a5,a4
    80007de6:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80007dea:	fd040793          	addi	a5,s0,-48
    80007dee:	85be                	mv	a1,a5
    80007df0:	fc843503          	ld	a0,-56(s0)
    80007df4:	ffffe097          	auipc	ra,0xffffe
    80007df8:	f7e080e7          	jalr	-130(ra) # 80005d72 <nameiparent>
    80007dfc:	fea43423          	sd	a0,-24(s0)
    80007e00:	fe843783          	ld	a5,-24(s0)
    80007e04:	e399                	bnez	a5,80007e0a <create+0x40>
    return 0;
    80007e06:	4781                	li	a5,0
    80007e08:	a2d9                	j	80007fce <create+0x204>

  ilock(dp);
    80007e0a:	fe843503          	ld	a0,-24(s0)
    80007e0e:	ffffd097          	auipc	ra,0xffffd
    80007e12:	242080e7          	jalr	578(ra) # 80005050 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80007e16:	fd040793          	addi	a5,s0,-48
    80007e1a:	4601                	li	a2,0
    80007e1c:	85be                	mv	a1,a5
    80007e1e:	fe843503          	ld	a0,-24(s0)
    80007e22:	ffffe097          	auipc	ra,0xffffe
    80007e26:	b22080e7          	jalr	-1246(ra) # 80005944 <dirlookup>
    80007e2a:	fea43023          	sd	a0,-32(s0)
    80007e2e:	fe043783          	ld	a5,-32(s0)
    80007e32:	c3ad                	beqz	a5,80007e94 <create+0xca>
    iunlockput(dp);
    80007e34:	fe843503          	ld	a0,-24(s0)
    80007e38:	ffffd097          	auipc	ra,0xffffd
    80007e3c:	476080e7          	jalr	1142(ra) # 800052ae <iunlockput>
    ilock(ip);
    80007e40:	fe043503          	ld	a0,-32(s0)
    80007e44:	ffffd097          	auipc	ra,0xffffd
    80007e48:	20c080e7          	jalr	524(ra) # 80005050 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80007e4c:	fc641783          	lh	a5,-58(s0)
    80007e50:	0007871b          	sext.w	a4,a5
    80007e54:	4789                	li	a5,2
    80007e56:	02f71763          	bne	a4,a5,80007e84 <create+0xba>
    80007e5a:	fe043783          	ld	a5,-32(s0)
    80007e5e:	04479783          	lh	a5,68(a5)
    80007e62:	0007871b          	sext.w	a4,a5
    80007e66:	4789                	li	a5,2
    80007e68:	00f70b63          	beq	a4,a5,80007e7e <create+0xb4>
    80007e6c:	fe043783          	ld	a5,-32(s0)
    80007e70:	04479783          	lh	a5,68(a5)
    80007e74:	0007871b          	sext.w	a4,a5
    80007e78:	478d                	li	a5,3
    80007e7a:	00f71563          	bne	a4,a5,80007e84 <create+0xba>
      return ip;
    80007e7e:	fe043783          	ld	a5,-32(s0)
    80007e82:	a2b1                	j	80007fce <create+0x204>
    iunlockput(ip);
    80007e84:	fe043503          	ld	a0,-32(s0)
    80007e88:	ffffd097          	auipc	ra,0xffffd
    80007e8c:	426080e7          	jalr	1062(ra) # 800052ae <iunlockput>
    return 0;
    80007e90:	4781                	li	a5,0
    80007e92:	aa35                	j	80007fce <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    80007e94:	fe843783          	ld	a5,-24(s0)
    80007e98:	439c                	lw	a5,0(a5)
    80007e9a:	fc641703          	lh	a4,-58(s0)
    80007e9e:	85ba                	mv	a1,a4
    80007ea0:	853e                	mv	a0,a5
    80007ea2:	ffffd097          	auipc	ra,0xffffd
    80007ea6:	e62080e7          	jalr	-414(ra) # 80004d04 <ialloc>
    80007eaa:	fea43023          	sd	a0,-32(s0)
    80007eae:	fe043783          	ld	a5,-32(s0)
    80007eb2:	eb89                	bnez	a5,80007ec4 <create+0xfa>
    panic("create: ialloc");
    80007eb4:	00003517          	auipc	a0,0x3
    80007eb8:	7a450513          	addi	a0,a0,1956 # 8000b658 <etext+0x658>
    80007ebc:	ffff9097          	auipc	ra,0xffff9
    80007ec0:	dc2080e7          	jalr	-574(ra) # 80000c7e <panic>

  ilock(ip);
    80007ec4:	fe043503          	ld	a0,-32(s0)
    80007ec8:	ffffd097          	auipc	ra,0xffffd
    80007ecc:	188080e7          	jalr	392(ra) # 80005050 <ilock>
  ip->major = major;
    80007ed0:	fe043783          	ld	a5,-32(s0)
    80007ed4:	fc445703          	lhu	a4,-60(s0)
    80007ed8:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80007edc:	fe043783          	ld	a5,-32(s0)
    80007ee0:	fc245703          	lhu	a4,-62(s0)
    80007ee4:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80007ee8:	fe043783          	ld	a5,-32(s0)
    80007eec:	4705                	li	a4,1
    80007eee:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ef2:	fe043503          	ld	a0,-32(s0)
    80007ef6:	ffffd097          	auipc	ra,0xffffd
    80007efa:	f0a080e7          	jalr	-246(ra) # 80004e00 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80007efe:	fc641783          	lh	a5,-58(s0)
    80007f02:	0007871b          	sext.w	a4,a5
    80007f06:	4785                	li	a5,1
    80007f08:	08f71363          	bne	a4,a5,80007f8e <create+0x1c4>
    dp->nlink++;  // for ".."
    80007f0c:	fe843783          	ld	a5,-24(s0)
    80007f10:	04a79783          	lh	a5,74(a5)
    80007f14:	17c2                	slli	a5,a5,0x30
    80007f16:	93c1                	srli	a5,a5,0x30
    80007f18:	2785                	addiw	a5,a5,1
    80007f1a:	17c2                	slli	a5,a5,0x30
    80007f1c:	93c1                	srli	a5,a5,0x30
    80007f1e:	0107971b          	slliw	a4,a5,0x10
    80007f22:	4107571b          	sraiw	a4,a4,0x10
    80007f26:	fe843783          	ld	a5,-24(s0)
    80007f2a:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007f2e:	fe843503          	ld	a0,-24(s0)
    80007f32:	ffffd097          	auipc	ra,0xffffd
    80007f36:	ece080e7          	jalr	-306(ra) # 80004e00 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80007f3a:	fe043783          	ld	a5,-32(s0)
    80007f3e:	43dc                	lw	a5,4(a5)
    80007f40:	863e                	mv	a2,a5
    80007f42:	00003597          	auipc	a1,0x3
    80007f46:	6de58593          	addi	a1,a1,1758 # 8000b620 <etext+0x620>
    80007f4a:	fe043503          	ld	a0,-32(s0)
    80007f4e:	ffffe097          	auipc	ra,0xffffe
    80007f52:	ade080e7          	jalr	-1314(ra) # 80005a2c <dirlink>
    80007f56:	87aa                	mv	a5,a0
    80007f58:	0207c363          	bltz	a5,80007f7e <create+0x1b4>
    80007f5c:	fe843783          	ld	a5,-24(s0)
    80007f60:	43dc                	lw	a5,4(a5)
    80007f62:	863e                	mv	a2,a5
    80007f64:	00003597          	auipc	a1,0x3
    80007f68:	6c458593          	addi	a1,a1,1732 # 8000b628 <etext+0x628>
    80007f6c:	fe043503          	ld	a0,-32(s0)
    80007f70:	ffffe097          	auipc	ra,0xffffe
    80007f74:	abc080e7          	jalr	-1348(ra) # 80005a2c <dirlink>
    80007f78:	87aa                	mv	a5,a0
    80007f7a:	0007da63          	bgez	a5,80007f8e <create+0x1c4>
      panic("create dots");
    80007f7e:	00003517          	auipc	a0,0x3
    80007f82:	6ea50513          	addi	a0,a0,1770 # 8000b668 <etext+0x668>
    80007f86:	ffff9097          	auipc	ra,0xffff9
    80007f8a:	cf8080e7          	jalr	-776(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80007f8e:	fe043783          	ld	a5,-32(s0)
    80007f92:	43d8                	lw	a4,4(a5)
    80007f94:	fd040793          	addi	a5,s0,-48
    80007f98:	863a                	mv	a2,a4
    80007f9a:	85be                	mv	a1,a5
    80007f9c:	fe843503          	ld	a0,-24(s0)
    80007fa0:	ffffe097          	auipc	ra,0xffffe
    80007fa4:	a8c080e7          	jalr	-1396(ra) # 80005a2c <dirlink>
    80007fa8:	87aa                	mv	a5,a0
    80007faa:	0007da63          	bgez	a5,80007fbe <create+0x1f4>
    panic("create: dirlink");
    80007fae:	00003517          	auipc	a0,0x3
    80007fb2:	6ca50513          	addi	a0,a0,1738 # 8000b678 <etext+0x678>
    80007fb6:	ffff9097          	auipc	ra,0xffff9
    80007fba:	cc8080e7          	jalr	-824(ra) # 80000c7e <panic>

  iunlockput(dp);
    80007fbe:	fe843503          	ld	a0,-24(s0)
    80007fc2:	ffffd097          	auipc	ra,0xffffd
    80007fc6:	2ec080e7          	jalr	748(ra) # 800052ae <iunlockput>

  return ip;
    80007fca:	fe043783          	ld	a5,-32(s0)
}
    80007fce:	853e                	mv	a0,a5
    80007fd0:	70e2                	ld	ra,56(sp)
    80007fd2:	7442                	ld	s0,48(sp)
    80007fd4:	6121                	addi	sp,sp,64
    80007fd6:	8082                	ret

0000000080007fd8 <sys_open>:

uint64
sys_open(void)
{
    80007fd8:	7131                	addi	sp,sp,-192
    80007fda:	fd06                	sd	ra,184(sp)
    80007fdc:	f922                	sd	s0,176(sp)
    80007fde:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80007fe0:	f5040793          	addi	a5,s0,-176
    80007fe4:	08000613          	li	a2,128
    80007fe8:	85be                	mv	a1,a5
    80007fea:	4501                	li	a0,0
    80007fec:	ffffc097          	auipc	ra,0xffffc
    80007ff0:	0fe080e7          	jalr	254(ra) # 800040ea <argstr>
    80007ff4:	87aa                	mv	a5,a0
    80007ff6:	fef42223          	sw	a5,-28(s0)
    80007ffa:	fe442783          	lw	a5,-28(s0)
    80007ffe:	2781                	sext.w	a5,a5
    80008000:	0007cd63          	bltz	a5,8000801a <sys_open+0x42>
    80008004:	f4c40793          	addi	a5,s0,-180
    80008008:	85be                	mv	a1,a5
    8000800a:	4505                	li	a0,1
    8000800c:	ffffc097          	auipc	ra,0xffffc
    80008010:	072080e7          	jalr	114(ra) # 8000407e <argint>
    80008014:	87aa                	mv	a5,a0
    80008016:	0007d463          	bgez	a5,8000801e <sys_open+0x46>
    return -1;
    8000801a:	57fd                	li	a5,-1
    8000801c:	a429                	j	80008226 <sys_open+0x24e>

  begin_op();
    8000801e:	ffffe097          	auipc	ra,0xffffe
    80008022:	08c080e7          	jalr	140(ra) # 800060aa <begin_op>

  if(omode & O_CREATE){
    80008026:	f4c42783          	lw	a5,-180(s0)
    8000802a:	2007f793          	andi	a5,a5,512
    8000802e:	2781                	sext.w	a5,a5
    80008030:	c795                	beqz	a5,8000805c <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    80008032:	f5040793          	addi	a5,s0,-176
    80008036:	4681                	li	a3,0
    80008038:	4601                	li	a2,0
    8000803a:	4589                	li	a1,2
    8000803c:	853e                	mv	a0,a5
    8000803e:	00000097          	auipc	ra,0x0
    80008042:	d8c080e7          	jalr	-628(ra) # 80007dca <create>
    80008046:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000804a:	fe843783          	ld	a5,-24(s0)
    8000804e:	e7bd                	bnez	a5,800080bc <sys_open+0xe4>
      end_op();
    80008050:	ffffe097          	auipc	ra,0xffffe
    80008054:	11c080e7          	jalr	284(ra) # 8000616c <end_op>
      return -1;
    80008058:	57fd                	li	a5,-1
    8000805a:	a2f1                	j	80008226 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000805c:	f5040793          	addi	a5,s0,-176
    80008060:	853e                	mv	a0,a5
    80008062:	ffffe097          	auipc	ra,0xffffe
    80008066:	ce4080e7          	jalr	-796(ra) # 80005d46 <namei>
    8000806a:	fea43423          	sd	a0,-24(s0)
    8000806e:	fe843783          	ld	a5,-24(s0)
    80008072:	e799                	bnez	a5,80008080 <sys_open+0xa8>
      end_op();
    80008074:	ffffe097          	auipc	ra,0xffffe
    80008078:	0f8080e7          	jalr	248(ra) # 8000616c <end_op>
      return -1;
    8000807c:	57fd                	li	a5,-1
    8000807e:	a265                	j	80008226 <sys_open+0x24e>
    }
    ilock(ip);
    80008080:	fe843503          	ld	a0,-24(s0)
    80008084:	ffffd097          	auipc	ra,0xffffd
    80008088:	fcc080e7          	jalr	-52(ra) # 80005050 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000808c:	fe843783          	ld	a5,-24(s0)
    80008090:	04479783          	lh	a5,68(a5)
    80008094:	0007871b          	sext.w	a4,a5
    80008098:	4785                	li	a5,1
    8000809a:	02f71163          	bne	a4,a5,800080bc <sys_open+0xe4>
    8000809e:	f4c42783          	lw	a5,-180(s0)
    800080a2:	cf89                	beqz	a5,800080bc <sys_open+0xe4>
      iunlockput(ip);
    800080a4:	fe843503          	ld	a0,-24(s0)
    800080a8:	ffffd097          	auipc	ra,0xffffd
    800080ac:	206080e7          	jalr	518(ra) # 800052ae <iunlockput>
      end_op();
    800080b0:	ffffe097          	auipc	ra,0xffffe
    800080b4:	0bc080e7          	jalr	188(ra) # 8000616c <end_op>
      return -1;
    800080b8:	57fd                	li	a5,-1
    800080ba:	a2b5                	j	80008226 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800080bc:	fe843783          	ld	a5,-24(s0)
    800080c0:	04479783          	lh	a5,68(a5)
    800080c4:	0007871b          	sext.w	a4,a5
    800080c8:	478d                	li	a5,3
    800080ca:	02f71e63          	bne	a4,a5,80008106 <sys_open+0x12e>
    800080ce:	fe843783          	ld	a5,-24(s0)
    800080d2:	04679783          	lh	a5,70(a5)
    800080d6:	2781                	sext.w	a5,a5
    800080d8:	0007cb63          	bltz	a5,800080ee <sys_open+0x116>
    800080dc:	fe843783          	ld	a5,-24(s0)
    800080e0:	04679783          	lh	a5,70(a5)
    800080e4:	0007871b          	sext.w	a4,a5
    800080e8:	47a5                	li	a5,9
    800080ea:	00e7de63          	bge	a5,a4,80008106 <sys_open+0x12e>
    iunlockput(ip);
    800080ee:	fe843503          	ld	a0,-24(s0)
    800080f2:	ffffd097          	auipc	ra,0xffffd
    800080f6:	1bc080e7          	jalr	444(ra) # 800052ae <iunlockput>
    end_op();
    800080fa:	ffffe097          	auipc	ra,0xffffe
    800080fe:	072080e7          	jalr	114(ra) # 8000616c <end_op>
    return -1;
    80008102:	57fd                	li	a5,-1
    80008104:	a20d                	j	80008226 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008106:	ffffe097          	auipc	ra,0xffffe
    8000810a:	554080e7          	jalr	1364(ra) # 8000665a <filealloc>
    8000810e:	fca43c23          	sd	a0,-40(s0)
    80008112:	fd843783          	ld	a5,-40(s0)
    80008116:	cf99                	beqz	a5,80008134 <sys_open+0x15c>
    80008118:	fd843503          	ld	a0,-40(s0)
    8000811c:	fffff097          	auipc	ra,0xfffff
    80008120:	5e8080e7          	jalr	1512(ra) # 80007704 <fdalloc>
    80008124:	87aa                	mv	a5,a0
    80008126:	fcf42a23          	sw	a5,-44(s0)
    8000812a:	fd442783          	lw	a5,-44(s0)
    8000812e:	2781                	sext.w	a5,a5
    80008130:	0207d763          	bgez	a5,8000815e <sys_open+0x186>
    if(f)
    80008134:	fd843783          	ld	a5,-40(s0)
    80008138:	c799                	beqz	a5,80008146 <sys_open+0x16e>
      fileclose(f);
    8000813a:	fd843503          	ld	a0,-40(s0)
    8000813e:	ffffe097          	auipc	ra,0xffffe
    80008142:	606080e7          	jalr	1542(ra) # 80006744 <fileclose>
    iunlockput(ip);
    80008146:	fe843503          	ld	a0,-24(s0)
    8000814a:	ffffd097          	auipc	ra,0xffffd
    8000814e:	164080e7          	jalr	356(ra) # 800052ae <iunlockput>
    end_op();
    80008152:	ffffe097          	auipc	ra,0xffffe
    80008156:	01a080e7          	jalr	26(ra) # 8000616c <end_op>
    return -1;
    8000815a:	57fd                	li	a5,-1
    8000815c:	a0e9                	j	80008226 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    8000815e:	fe843783          	ld	a5,-24(s0)
    80008162:	04479783          	lh	a5,68(a5)
    80008166:	0007871b          	sext.w	a4,a5
    8000816a:	478d                	li	a5,3
    8000816c:	00f71f63          	bne	a4,a5,8000818a <sys_open+0x1b2>
    f->type = FD_DEVICE;
    80008170:	fd843783          	ld	a5,-40(s0)
    80008174:	470d                	li	a4,3
    80008176:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008178:	fe843783          	ld	a5,-24(s0)
    8000817c:	04679703          	lh	a4,70(a5)
    80008180:	fd843783          	ld	a5,-40(s0)
    80008184:	02e79223          	sh	a4,36(a5)
    80008188:	a809                	j	8000819a <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    8000818a:	fd843783          	ld	a5,-40(s0)
    8000818e:	4709                	li	a4,2
    80008190:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008192:	fd843783          	ld	a5,-40(s0)
    80008196:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000819a:	fd843783          	ld	a5,-40(s0)
    8000819e:	fe843703          	ld	a4,-24(s0)
    800081a2:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800081a4:	f4c42783          	lw	a5,-180(s0)
    800081a8:	8b85                	andi	a5,a5,1
    800081aa:	2781                	sext.w	a5,a5
    800081ac:	0017b793          	seqz	a5,a5
    800081b0:	0ff7f793          	andi	a5,a5,255
    800081b4:	873e                	mv	a4,a5
    800081b6:	fd843783          	ld	a5,-40(s0)
    800081ba:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800081be:	f4c42783          	lw	a5,-180(s0)
    800081c2:	8b85                	andi	a5,a5,1
    800081c4:	2781                	sext.w	a5,a5
    800081c6:	e791                	bnez	a5,800081d2 <sys_open+0x1fa>
    800081c8:	f4c42783          	lw	a5,-180(s0)
    800081cc:	8b89                	andi	a5,a5,2
    800081ce:	2781                	sext.w	a5,a5
    800081d0:	c399                	beqz	a5,800081d6 <sys_open+0x1fe>
    800081d2:	4785                	li	a5,1
    800081d4:	a011                	j	800081d8 <sys_open+0x200>
    800081d6:	4781                	li	a5,0
    800081d8:	0ff7f713          	andi	a4,a5,255
    800081dc:	fd843783          	ld	a5,-40(s0)
    800081e0:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    800081e4:	f4c42783          	lw	a5,-180(s0)
    800081e8:	4007f793          	andi	a5,a5,1024
    800081ec:	2781                	sext.w	a5,a5
    800081ee:	c385                	beqz	a5,8000820e <sys_open+0x236>
    800081f0:	fe843783          	ld	a5,-24(s0)
    800081f4:	04479783          	lh	a5,68(a5)
    800081f8:	0007871b          	sext.w	a4,a5
    800081fc:	4789                	li	a5,2
    800081fe:	00f71863          	bne	a4,a5,8000820e <sys_open+0x236>
    itrunc(ip);
    80008202:	fe843503          	ld	a0,-24(s0)
    80008206:	ffffd097          	auipc	ra,0xffffd
    8000820a:	232080e7          	jalr	562(ra) # 80005438 <itrunc>
  }

  iunlock(ip);
    8000820e:	fe843503          	ld	a0,-24(s0)
    80008212:	ffffd097          	auipc	ra,0xffffd
    80008216:	f72080e7          	jalr	-142(ra) # 80005184 <iunlock>
  end_op();
    8000821a:	ffffe097          	auipc	ra,0xffffe
    8000821e:	f52080e7          	jalr	-174(ra) # 8000616c <end_op>

  return fd;
    80008222:	fd442783          	lw	a5,-44(s0)
}
    80008226:	853e                	mv	a0,a5
    80008228:	70ea                	ld	ra,184(sp)
    8000822a:	744a                	ld	s0,176(sp)
    8000822c:	6129                	addi	sp,sp,192
    8000822e:	8082                	ret

0000000080008230 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008230:	7135                	addi	sp,sp,-160
    80008232:	ed06                	sd	ra,152(sp)
    80008234:	e922                	sd	s0,144(sp)
    80008236:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008238:	ffffe097          	auipc	ra,0xffffe
    8000823c:	e72080e7          	jalr	-398(ra) # 800060aa <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008240:	f6840793          	addi	a5,s0,-152
    80008244:	08000613          	li	a2,128
    80008248:	85be                	mv	a1,a5
    8000824a:	4501                	li	a0,0
    8000824c:	ffffc097          	auipc	ra,0xffffc
    80008250:	e9e080e7          	jalr	-354(ra) # 800040ea <argstr>
    80008254:	87aa                	mv	a5,a0
    80008256:	0207c163          	bltz	a5,80008278 <sys_mkdir+0x48>
    8000825a:	f6840793          	addi	a5,s0,-152
    8000825e:	4681                	li	a3,0
    80008260:	4601                	li	a2,0
    80008262:	4585                	li	a1,1
    80008264:	853e                	mv	a0,a5
    80008266:	00000097          	auipc	ra,0x0
    8000826a:	b64080e7          	jalr	-1180(ra) # 80007dca <create>
    8000826e:	fea43423          	sd	a0,-24(s0)
    80008272:	fe843783          	ld	a5,-24(s0)
    80008276:	e799                	bnez	a5,80008284 <sys_mkdir+0x54>
    end_op();
    80008278:	ffffe097          	auipc	ra,0xffffe
    8000827c:	ef4080e7          	jalr	-268(ra) # 8000616c <end_op>
    return -1;
    80008280:	57fd                	li	a5,-1
    80008282:	a821                	j	8000829a <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008284:	fe843503          	ld	a0,-24(s0)
    80008288:	ffffd097          	auipc	ra,0xffffd
    8000828c:	026080e7          	jalr	38(ra) # 800052ae <iunlockput>
  end_op();
    80008290:	ffffe097          	auipc	ra,0xffffe
    80008294:	edc080e7          	jalr	-292(ra) # 8000616c <end_op>
  return 0;
    80008298:	4781                	li	a5,0
}
    8000829a:	853e                	mv	a0,a5
    8000829c:	60ea                	ld	ra,152(sp)
    8000829e:	644a                	ld	s0,144(sp)
    800082a0:	610d                	addi	sp,sp,160
    800082a2:	8082                	ret

00000000800082a4 <sys_mknod>:

uint64
sys_mknod(void)
{
    800082a4:	7135                	addi	sp,sp,-160
    800082a6:	ed06                	sd	ra,152(sp)
    800082a8:	e922                	sd	s0,144(sp)
    800082aa:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800082ac:	ffffe097          	auipc	ra,0xffffe
    800082b0:	dfe080e7          	jalr	-514(ra) # 800060aa <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    800082b4:	f6840793          	addi	a5,s0,-152
    800082b8:	08000613          	li	a2,128
    800082bc:	85be                	mv	a1,a5
    800082be:	4501                	li	a0,0
    800082c0:	ffffc097          	auipc	ra,0xffffc
    800082c4:	e2a080e7          	jalr	-470(ra) # 800040ea <argstr>
    800082c8:	87aa                	mv	a5,a0
    800082ca:	0607c263          	bltz	a5,8000832e <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    800082ce:	f6440793          	addi	a5,s0,-156
    800082d2:	85be                	mv	a1,a5
    800082d4:	4505                	li	a0,1
    800082d6:	ffffc097          	auipc	ra,0xffffc
    800082da:	da8080e7          	jalr	-600(ra) # 8000407e <argint>
    800082de:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    800082e0:	0407c763          	bltz	a5,8000832e <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    800082e4:	f6040793          	addi	a5,s0,-160
    800082e8:	85be                	mv	a1,a5
    800082ea:	4509                	li	a0,2
    800082ec:	ffffc097          	auipc	ra,0xffffc
    800082f0:	d92080e7          	jalr	-622(ra) # 8000407e <argint>
    800082f4:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    800082f6:	0207cc63          	bltz	a5,8000832e <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    800082fa:	f6442783          	lw	a5,-156(s0)
    800082fe:	0107971b          	slliw	a4,a5,0x10
    80008302:	4107571b          	sraiw	a4,a4,0x10
    80008306:	f6042783          	lw	a5,-160(s0)
    8000830a:	0107969b          	slliw	a3,a5,0x10
    8000830e:	4106d69b          	sraiw	a3,a3,0x10
    80008312:	f6840793          	addi	a5,s0,-152
    80008316:	863a                	mv	a2,a4
    80008318:	458d                	li	a1,3
    8000831a:	853e                	mv	a0,a5
    8000831c:	00000097          	auipc	ra,0x0
    80008320:	aae080e7          	jalr	-1362(ra) # 80007dca <create>
    80008324:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    80008328:	fe843783          	ld	a5,-24(s0)
    8000832c:	e799                	bnez	a5,8000833a <sys_mknod+0x96>
    end_op();
    8000832e:	ffffe097          	auipc	ra,0xffffe
    80008332:	e3e080e7          	jalr	-450(ra) # 8000616c <end_op>
    return -1;
    80008336:	57fd                	li	a5,-1
    80008338:	a821                	j	80008350 <sys_mknod+0xac>
  }
  iunlockput(ip);
    8000833a:	fe843503          	ld	a0,-24(s0)
    8000833e:	ffffd097          	auipc	ra,0xffffd
    80008342:	f70080e7          	jalr	-144(ra) # 800052ae <iunlockput>
  end_op();
    80008346:	ffffe097          	auipc	ra,0xffffe
    8000834a:	e26080e7          	jalr	-474(ra) # 8000616c <end_op>
  return 0;
    8000834e:	4781                	li	a5,0
}
    80008350:	853e                	mv	a0,a5
    80008352:	60ea                	ld	ra,152(sp)
    80008354:	644a                	ld	s0,144(sp)
    80008356:	610d                	addi	sp,sp,160
    80008358:	8082                	ret

000000008000835a <sys_chdir>:

uint64
sys_chdir(void)
{
    8000835a:	7135                	addi	sp,sp,-160
    8000835c:	ed06                	sd	ra,152(sp)
    8000835e:	e922                	sd	s0,144(sp)
    80008360:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008362:	ffffa097          	auipc	ra,0xffffa
    80008366:	4b2080e7          	jalr	1202(ra) # 80002814 <myproc>
    8000836a:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    8000836e:	ffffe097          	auipc	ra,0xffffe
    80008372:	d3c080e7          	jalr	-708(ra) # 800060aa <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008376:	f6040793          	addi	a5,s0,-160
    8000837a:	08000613          	li	a2,128
    8000837e:	85be                	mv	a1,a5
    80008380:	4501                	li	a0,0
    80008382:	ffffc097          	auipc	ra,0xffffc
    80008386:	d68080e7          	jalr	-664(ra) # 800040ea <argstr>
    8000838a:	87aa                	mv	a5,a0
    8000838c:	0007ce63          	bltz	a5,800083a8 <sys_chdir+0x4e>
    80008390:	f6040793          	addi	a5,s0,-160
    80008394:	853e                	mv	a0,a5
    80008396:	ffffe097          	auipc	ra,0xffffe
    8000839a:	9b0080e7          	jalr	-1616(ra) # 80005d46 <namei>
    8000839e:	fea43023          	sd	a0,-32(s0)
    800083a2:	fe043783          	ld	a5,-32(s0)
    800083a6:	e799                	bnez	a5,800083b4 <sys_chdir+0x5a>
    end_op();
    800083a8:	ffffe097          	auipc	ra,0xffffe
    800083ac:	dc4080e7          	jalr	-572(ra) # 8000616c <end_op>
    return -1;
    800083b0:	57fd                	li	a5,-1
    800083b2:	a0b5                	j	8000841e <sys_chdir+0xc4>
  }
  ilock(ip);
    800083b4:	fe043503          	ld	a0,-32(s0)
    800083b8:	ffffd097          	auipc	ra,0xffffd
    800083bc:	c98080e7          	jalr	-872(ra) # 80005050 <ilock>
  if(ip->type != T_DIR){
    800083c0:	fe043783          	ld	a5,-32(s0)
    800083c4:	04479783          	lh	a5,68(a5)
    800083c8:	0007871b          	sext.w	a4,a5
    800083cc:	4785                	li	a5,1
    800083ce:	00f70e63          	beq	a4,a5,800083ea <sys_chdir+0x90>
    iunlockput(ip);
    800083d2:	fe043503          	ld	a0,-32(s0)
    800083d6:	ffffd097          	auipc	ra,0xffffd
    800083da:	ed8080e7          	jalr	-296(ra) # 800052ae <iunlockput>
    end_op();
    800083de:	ffffe097          	auipc	ra,0xffffe
    800083e2:	d8e080e7          	jalr	-626(ra) # 8000616c <end_op>
    return -1;
    800083e6:	57fd                	li	a5,-1
    800083e8:	a81d                	j	8000841e <sys_chdir+0xc4>
  }
  iunlock(ip);
    800083ea:	fe043503          	ld	a0,-32(s0)
    800083ee:	ffffd097          	auipc	ra,0xffffd
    800083f2:	d96080e7          	jalr	-618(ra) # 80005184 <iunlock>
  iput(p->cwd);
    800083f6:	fe843783          	ld	a5,-24(s0)
    800083fa:	1507b783          	ld	a5,336(a5)
    800083fe:	853e                	mv	a0,a5
    80008400:	ffffd097          	auipc	ra,0xffffd
    80008404:	dde080e7          	jalr	-546(ra) # 800051de <iput>
  end_op();
    80008408:	ffffe097          	auipc	ra,0xffffe
    8000840c:	d64080e7          	jalr	-668(ra) # 8000616c <end_op>
  p->cwd = ip;
    80008410:	fe843783          	ld	a5,-24(s0)
    80008414:	fe043703          	ld	a4,-32(s0)
    80008418:	14e7b823          	sd	a4,336(a5)
  return 0;
    8000841c:	4781                	li	a5,0
}
    8000841e:	853e                	mv	a0,a5
    80008420:	60ea                	ld	ra,152(sp)
    80008422:	644a                	ld	s0,144(sp)
    80008424:	610d                	addi	sp,sp,160
    80008426:	8082                	ret

0000000080008428 <sys_exec>:

uint64
sys_exec(void)
{
    80008428:	7161                	addi	sp,sp,-432
    8000842a:	f706                	sd	ra,424(sp)
    8000842c:	f322                	sd	s0,416(sp)
    8000842e:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    80008430:	f6840793          	addi	a5,s0,-152
    80008434:	08000613          	li	a2,128
    80008438:	85be                	mv	a1,a5
    8000843a:	4501                	li	a0,0
    8000843c:	ffffc097          	auipc	ra,0xffffc
    80008440:	cae080e7          	jalr	-850(ra) # 800040ea <argstr>
    80008444:	87aa                	mv	a5,a0
    80008446:	0007cd63          	bltz	a5,80008460 <sys_exec+0x38>
    8000844a:	e6040793          	addi	a5,s0,-416
    8000844e:	85be                	mv	a1,a5
    80008450:	4505                	li	a0,1
    80008452:	ffffc097          	auipc	ra,0xffffc
    80008456:	c64080e7          	jalr	-924(ra) # 800040b6 <argaddr>
    8000845a:	87aa                	mv	a5,a0
    8000845c:	0007d463          	bgez	a5,80008464 <sys_exec+0x3c>
    return -1;
    80008460:	57fd                	li	a5,-1
    80008462:	a249                	j	800085e4 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    80008464:	e6840793          	addi	a5,s0,-408
    80008468:	10000613          	li	a2,256
    8000846c:	4581                	li	a1,0
    8000846e:	853e                	mv	a0,a5
    80008470:	ffff9097          	auipc	ra,0xffff9
    80008474:	fd2080e7          	jalr	-46(ra) # 80001442 <memset>
  for(i=0;; i++){
    80008478:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    8000847c:	fec42783          	lw	a5,-20(s0)
    80008480:	873e                	mv	a4,a5
    80008482:	47fd                	li	a5,31
    80008484:	10e7e463          	bltu	a5,a4,8000858c <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008488:	fec42783          	lw	a5,-20(s0)
    8000848c:	00379713          	slli	a4,a5,0x3
    80008490:	e6043783          	ld	a5,-416(s0)
    80008494:	97ba                	add	a5,a5,a4
    80008496:	e5840713          	addi	a4,s0,-424
    8000849a:	85ba                	mv	a1,a4
    8000849c:	853e                	mv	a0,a5
    8000849e:	ffffc097          	auipc	ra,0xffffc
    800084a2:	a62080e7          	jalr	-1438(ra) # 80003f00 <fetchaddr>
    800084a6:	87aa                	mv	a5,a0
    800084a8:	0e07c463          	bltz	a5,80008590 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    800084ac:	e5843783          	ld	a5,-424(s0)
    800084b0:	eb95                	bnez	a5,800084e4 <sys_exec+0xbc>
      argv[i] = 0;
    800084b2:	fec42783          	lw	a5,-20(s0)
    800084b6:	078e                	slli	a5,a5,0x3
    800084b8:	ff040713          	addi	a4,s0,-16
    800084bc:	97ba                	add	a5,a5,a4
    800084be:	e607bc23          	sd	zero,-392(a5)
      break;
    800084c2:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800084c4:	e6840713          	addi	a4,s0,-408
    800084c8:	f6840793          	addi	a5,s0,-152
    800084cc:	85ba                	mv	a1,a4
    800084ce:	853e                	mv	a0,a5
    800084d0:	fffff097          	auipc	ra,0xfffff
    800084d4:	c1a080e7          	jalr	-998(ra) # 800070ea <exec>
    800084d8:	87aa                	mv	a5,a0
    800084da:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800084de:	fe042623          	sw	zero,-20(s0)
    800084e2:	a059                	j	80008568 <sys_exec+0x140>
    argv[i] = kalloc();
    800084e4:	ffff9097          	auipc	ra,0xffff9
    800084e8:	c36080e7          	jalr	-970(ra) # 8000111a <kalloc>
    800084ec:	872a                	mv	a4,a0
    800084ee:	fec42783          	lw	a5,-20(s0)
    800084f2:	078e                	slli	a5,a5,0x3
    800084f4:	ff040693          	addi	a3,s0,-16
    800084f8:	97b6                	add	a5,a5,a3
    800084fa:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    800084fe:	fec42783          	lw	a5,-20(s0)
    80008502:	078e                	slli	a5,a5,0x3
    80008504:	ff040713          	addi	a4,s0,-16
    80008508:	97ba                	add	a5,a5,a4
    8000850a:	e787b783          	ld	a5,-392(a5)
    8000850e:	c3d9                	beqz	a5,80008594 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008510:	e5843703          	ld	a4,-424(s0)
    80008514:	fec42783          	lw	a5,-20(s0)
    80008518:	078e                	slli	a5,a5,0x3
    8000851a:	ff040693          	addi	a3,s0,-16
    8000851e:	97b6                	add	a5,a5,a3
    80008520:	e787b783          	ld	a5,-392(a5)
    80008524:	6605                	lui	a2,0x1
    80008526:	85be                	mv	a1,a5
    80008528:	853a                	mv	a0,a4
    8000852a:	ffffc097          	auipc	ra,0xffffc
    8000852e:	a44080e7          	jalr	-1468(ra) # 80003f6e <fetchstr>
    80008532:	87aa                	mv	a5,a0
    80008534:	0607c263          	bltz	a5,80008598 <sys_exec+0x170>
  for(i=0;; i++){
    80008538:	fec42783          	lw	a5,-20(s0)
    8000853c:	2785                	addiw	a5,a5,1
    8000853e:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008542:	bf2d                	j	8000847c <sys_exec+0x54>
    kfree(argv[i]);
    80008544:	fec42783          	lw	a5,-20(s0)
    80008548:	078e                	slli	a5,a5,0x3
    8000854a:	ff040713          	addi	a4,s0,-16
    8000854e:	97ba                	add	a5,a5,a4
    80008550:	e787b783          	ld	a5,-392(a5)
    80008554:	853e                	mv	a0,a5
    80008556:	ffff9097          	auipc	ra,0xffff9
    8000855a:	b20080e7          	jalr	-1248(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000855e:	fec42783          	lw	a5,-20(s0)
    80008562:	2785                	addiw	a5,a5,1
    80008564:	fef42623          	sw	a5,-20(s0)
    80008568:	fec42783          	lw	a5,-20(s0)
    8000856c:	873e                	mv	a4,a5
    8000856e:	47fd                	li	a5,31
    80008570:	00e7eb63          	bltu	a5,a4,80008586 <sys_exec+0x15e>
    80008574:	fec42783          	lw	a5,-20(s0)
    80008578:	078e                	slli	a5,a5,0x3
    8000857a:	ff040713          	addi	a4,s0,-16
    8000857e:	97ba                	add	a5,a5,a4
    80008580:	e787b783          	ld	a5,-392(a5)
    80008584:	f3e1                	bnez	a5,80008544 <sys_exec+0x11c>

  return ret;
    80008586:	fe842783          	lw	a5,-24(s0)
    8000858a:	a8a9                	j	800085e4 <sys_exec+0x1bc>
      goto bad;
    8000858c:	0001                	nop
    8000858e:	a031                	j	8000859a <sys_exec+0x172>
      goto bad;
    80008590:	0001                	nop
    80008592:	a021                	j	8000859a <sys_exec+0x172>
      goto bad;
    80008594:	0001                	nop
    80008596:	a011                	j	8000859a <sys_exec+0x172>
      goto bad;
    80008598:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000859a:	fe042623          	sw	zero,-20(s0)
    8000859e:	a01d                	j	800085c4 <sys_exec+0x19c>
    kfree(argv[i]);
    800085a0:	fec42783          	lw	a5,-20(s0)
    800085a4:	078e                	slli	a5,a5,0x3
    800085a6:	ff040713          	addi	a4,s0,-16
    800085aa:	97ba                	add	a5,a5,a4
    800085ac:	e787b783          	ld	a5,-392(a5)
    800085b0:	853e                	mv	a0,a5
    800085b2:	ffff9097          	auipc	ra,0xffff9
    800085b6:	ac4080e7          	jalr	-1340(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800085ba:	fec42783          	lw	a5,-20(s0)
    800085be:	2785                	addiw	a5,a5,1
    800085c0:	fef42623          	sw	a5,-20(s0)
    800085c4:	fec42783          	lw	a5,-20(s0)
    800085c8:	873e                	mv	a4,a5
    800085ca:	47fd                	li	a5,31
    800085cc:	00e7eb63          	bltu	a5,a4,800085e2 <sys_exec+0x1ba>
    800085d0:	fec42783          	lw	a5,-20(s0)
    800085d4:	078e                	slli	a5,a5,0x3
    800085d6:	ff040713          	addi	a4,s0,-16
    800085da:	97ba                	add	a5,a5,a4
    800085dc:	e787b783          	ld	a5,-392(a5)
    800085e0:	f3e1                	bnez	a5,800085a0 <sys_exec+0x178>
  return -1;
    800085e2:	57fd                	li	a5,-1
}
    800085e4:	853e                	mv	a0,a5
    800085e6:	70ba                	ld	ra,424(sp)
    800085e8:	741a                	ld	s0,416(sp)
    800085ea:	615d                	addi	sp,sp,432
    800085ec:	8082                	ret

00000000800085ee <sys_pipe>:

uint64
sys_pipe(void)
{
    800085ee:	7139                	addi	sp,sp,-64
    800085f0:	fc06                	sd	ra,56(sp)
    800085f2:	f822                	sd	s0,48(sp)
    800085f4:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    800085f6:	ffffa097          	auipc	ra,0xffffa
    800085fa:	21e080e7          	jalr	542(ra) # 80002814 <myproc>
    800085fe:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008602:	fe040793          	addi	a5,s0,-32
    80008606:	85be                	mv	a1,a5
    80008608:	4501                	li	a0,0
    8000860a:	ffffc097          	auipc	ra,0xffffc
    8000860e:	aac080e7          	jalr	-1364(ra) # 800040b6 <argaddr>
    80008612:	87aa                	mv	a5,a0
    80008614:	0007d463          	bgez	a5,8000861c <sys_pipe+0x2e>
    return -1;
    80008618:	57fd                	li	a5,-1
    8000861a:	a215                	j	8000873e <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    8000861c:	fd040713          	addi	a4,s0,-48
    80008620:	fd840793          	addi	a5,s0,-40
    80008624:	85ba                	mv	a1,a4
    80008626:	853e                	mv	a0,a5
    80008628:	ffffe097          	auipc	ra,0xffffe
    8000862c:	632080e7          	jalr	1586(ra) # 80006c5a <pipealloc>
    80008630:	87aa                	mv	a5,a0
    80008632:	0007d463          	bgez	a5,8000863a <sys_pipe+0x4c>
    return -1;
    80008636:	57fd                	li	a5,-1
    80008638:	a219                	j	8000873e <sys_pipe+0x150>
  fd0 = -1;
    8000863a:	57fd                	li	a5,-1
    8000863c:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008640:	fd843783          	ld	a5,-40(s0)
    80008644:	853e                	mv	a0,a5
    80008646:	fffff097          	auipc	ra,0xfffff
    8000864a:	0be080e7          	jalr	190(ra) # 80007704 <fdalloc>
    8000864e:	87aa                	mv	a5,a0
    80008650:	fcf42623          	sw	a5,-52(s0)
    80008654:	fcc42783          	lw	a5,-52(s0)
    80008658:	0207c063          	bltz	a5,80008678 <sys_pipe+0x8a>
    8000865c:	fd043783          	ld	a5,-48(s0)
    80008660:	853e                	mv	a0,a5
    80008662:	fffff097          	auipc	ra,0xfffff
    80008666:	0a2080e7          	jalr	162(ra) # 80007704 <fdalloc>
    8000866a:	87aa                	mv	a5,a0
    8000866c:	fcf42423          	sw	a5,-56(s0)
    80008670:	fc842783          	lw	a5,-56(s0)
    80008674:	0207df63          	bgez	a5,800086b2 <sys_pipe+0xc4>
    if(fd0 >= 0)
    80008678:	fcc42783          	lw	a5,-52(s0)
    8000867c:	0007cb63          	bltz	a5,80008692 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008680:	fcc42783          	lw	a5,-52(s0)
    80008684:	fe843703          	ld	a4,-24(s0)
    80008688:	07e9                	addi	a5,a5,26
    8000868a:	078e                	slli	a5,a5,0x3
    8000868c:	97ba                	add	a5,a5,a4
    8000868e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008692:	fd843783          	ld	a5,-40(s0)
    80008696:	853e                	mv	a0,a5
    80008698:	ffffe097          	auipc	ra,0xffffe
    8000869c:	0ac080e7          	jalr	172(ra) # 80006744 <fileclose>
    fileclose(wf);
    800086a0:	fd043783          	ld	a5,-48(s0)
    800086a4:	853e                	mv	a0,a5
    800086a6:	ffffe097          	auipc	ra,0xffffe
    800086aa:	09e080e7          	jalr	158(ra) # 80006744 <fileclose>
    return -1;
    800086ae:	57fd                	li	a5,-1
    800086b0:	a079                	j	8000873e <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800086b2:	fe843783          	ld	a5,-24(s0)
    800086b6:	6bbc                	ld	a5,80(a5)
    800086b8:	fe043703          	ld	a4,-32(s0)
    800086bc:	fcc40613          	addi	a2,s0,-52
    800086c0:	4691                	li	a3,4
    800086c2:	85ba                	mv	a1,a4
    800086c4:	853e                	mv	a0,a5
    800086c6:	ffffa097          	auipc	ra,0xffffa
    800086ca:	c20080e7          	jalr	-992(ra) # 800022e6 <copyout>
    800086ce:	87aa                	mv	a5,a0
    800086d0:	0207c463          	bltz	a5,800086f8 <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    800086d4:	fe843783          	ld	a5,-24(s0)
    800086d8:	6bb8                	ld	a4,80(a5)
    800086da:	fe043783          	ld	a5,-32(s0)
    800086de:	0791                	addi	a5,a5,4
    800086e0:	fc840613          	addi	a2,s0,-56
    800086e4:	4691                	li	a3,4
    800086e6:	85be                	mv	a1,a5
    800086e8:	853a                	mv	a0,a4
    800086ea:	ffffa097          	auipc	ra,0xffffa
    800086ee:	bfc080e7          	jalr	-1028(ra) # 800022e6 <copyout>
    800086f2:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800086f4:	0407d463          	bgez	a5,8000873c <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    800086f8:	fcc42783          	lw	a5,-52(s0)
    800086fc:	fe843703          	ld	a4,-24(s0)
    80008700:	07e9                	addi	a5,a5,26
    80008702:	078e                	slli	a5,a5,0x3
    80008704:	97ba                	add	a5,a5,a4
    80008706:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    8000870a:	fc842783          	lw	a5,-56(s0)
    8000870e:	fe843703          	ld	a4,-24(s0)
    80008712:	07e9                	addi	a5,a5,26
    80008714:	078e                	slli	a5,a5,0x3
    80008716:	97ba                	add	a5,a5,a4
    80008718:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    8000871c:	fd843783          	ld	a5,-40(s0)
    80008720:	853e                	mv	a0,a5
    80008722:	ffffe097          	auipc	ra,0xffffe
    80008726:	022080e7          	jalr	34(ra) # 80006744 <fileclose>
    fileclose(wf);
    8000872a:	fd043783          	ld	a5,-48(s0)
    8000872e:	853e                	mv	a0,a5
    80008730:	ffffe097          	auipc	ra,0xffffe
    80008734:	014080e7          	jalr	20(ra) # 80006744 <fileclose>
    return -1;
    80008738:	57fd                	li	a5,-1
    8000873a:	a011                	j	8000873e <sys_pipe+0x150>
  }
  return 0;
    8000873c:	4781                	li	a5,0
}
    8000873e:	853e                	mv	a0,a5
    80008740:	70e2                	ld	ra,56(sp)
    80008742:	7442                	ld	s0,48(sp)
    80008744:	6121                	addi	sp,sp,64
    80008746:	8082                	ret
	...

0000000080008750 <kernelvec>:
    80008750:	7111                	addi	sp,sp,-256
    80008752:	e006                	sd	ra,0(sp)
    80008754:	e40a                	sd	sp,8(sp)
    80008756:	e80e                	sd	gp,16(sp)
    80008758:	ec12                	sd	tp,24(sp)
    8000875a:	f016                	sd	t0,32(sp)
    8000875c:	f41a                	sd	t1,40(sp)
    8000875e:	f81e                	sd	t2,48(sp)
    80008760:	fc22                	sd	s0,56(sp)
    80008762:	e0a6                	sd	s1,64(sp)
    80008764:	e4aa                	sd	a0,72(sp)
    80008766:	e8ae                	sd	a1,80(sp)
    80008768:	ecb2                	sd	a2,88(sp)
    8000876a:	f0b6                	sd	a3,96(sp)
    8000876c:	f4ba                	sd	a4,104(sp)
    8000876e:	f8be                	sd	a5,112(sp)
    80008770:	fcc2                	sd	a6,120(sp)
    80008772:	e146                	sd	a7,128(sp)
    80008774:	e54a                	sd	s2,136(sp)
    80008776:	e94e                	sd	s3,144(sp)
    80008778:	ed52                	sd	s4,152(sp)
    8000877a:	f156                	sd	s5,160(sp)
    8000877c:	f55a                	sd	s6,168(sp)
    8000877e:	f95e                	sd	s7,176(sp)
    80008780:	fd62                	sd	s8,184(sp)
    80008782:	e1e6                	sd	s9,192(sp)
    80008784:	e5ea                	sd	s10,200(sp)
    80008786:	e9ee                	sd	s11,208(sp)
    80008788:	edf2                	sd	t3,216(sp)
    8000878a:	f1f6                	sd	t4,224(sp)
    8000878c:	f5fa                	sd	t5,232(sp)
    8000878e:	f9fe                	sd	t6,240(sp)
    80008790:	d08fb0ef          	jal	ra,80003c98 <kerneltrap>
    80008794:	6082                	ld	ra,0(sp)
    80008796:	6122                	ld	sp,8(sp)
    80008798:	61c2                	ld	gp,16(sp)
    8000879a:	7282                	ld	t0,32(sp)
    8000879c:	7322                	ld	t1,40(sp)
    8000879e:	73c2                	ld	t2,48(sp)
    800087a0:	7462                	ld	s0,56(sp)
    800087a2:	6486                	ld	s1,64(sp)
    800087a4:	6526                	ld	a0,72(sp)
    800087a6:	65c6                	ld	a1,80(sp)
    800087a8:	6666                	ld	a2,88(sp)
    800087aa:	7686                	ld	a3,96(sp)
    800087ac:	7726                	ld	a4,104(sp)
    800087ae:	77c6                	ld	a5,112(sp)
    800087b0:	7866                	ld	a6,120(sp)
    800087b2:	688a                	ld	a7,128(sp)
    800087b4:	692a                	ld	s2,136(sp)
    800087b6:	69ca                	ld	s3,144(sp)
    800087b8:	6a6a                	ld	s4,152(sp)
    800087ba:	7a8a                	ld	s5,160(sp)
    800087bc:	7b2a                	ld	s6,168(sp)
    800087be:	7bca                	ld	s7,176(sp)
    800087c0:	7c6a                	ld	s8,184(sp)
    800087c2:	6c8e                	ld	s9,192(sp)
    800087c4:	6d2e                	ld	s10,200(sp)
    800087c6:	6dce                	ld	s11,208(sp)
    800087c8:	6e6e                	ld	t3,216(sp)
    800087ca:	7e8e                	ld	t4,224(sp)
    800087cc:	7f2e                	ld	t5,232(sp)
    800087ce:	7fce                	ld	t6,240(sp)
    800087d0:	6111                	addi	sp,sp,256
    800087d2:	10200073          	sret
    800087d6:	00000013          	nop
    800087da:	00000013          	nop
    800087de:	0001                	nop

00000000800087e0 <timervec>:
    800087e0:	34051573          	csrrw	a0,mscratch,a0
    800087e4:	e10c                	sd	a1,0(a0)
    800087e6:	e510                	sd	a2,8(a0)
    800087e8:	e914                	sd	a3,16(a0)
    800087ea:	6d0c                	ld	a1,24(a0)
    800087ec:	7110                	ld	a2,32(a0)
    800087ee:	6194                	ld	a3,0(a1)
    800087f0:	96b2                	add	a3,a3,a2
    800087f2:	e194                	sd	a3,0(a1)
    800087f4:	4589                	li	a1,2
    800087f6:	14459073          	csrw	sip,a1
    800087fa:	6914                	ld	a3,16(a0)
    800087fc:	6510                	ld	a2,8(a0)
    800087fe:	610c                	ld	a1,0(a0)
    80008800:	34051573          	csrrw	a0,mscratch,a0
    80008804:	30200073          	mret
	...

000000008000880a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    8000880a:	1141                	addi	sp,sp,-16
    8000880c:	e422                	sd	s0,8(sp)
    8000880e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008810:	0c0007b7          	lui	a5,0xc000
    80008814:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008818:	4705                	li	a4,1
    8000881a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    8000881c:	0c0007b7          	lui	a5,0xc000
    80008820:	0791                	addi	a5,a5,4
    80008822:	4705                	li	a4,1
    80008824:	c398                	sw	a4,0(a5)
}
    80008826:	0001                	nop
    80008828:	6422                	ld	s0,8(sp)
    8000882a:	0141                	addi	sp,sp,16
    8000882c:	8082                	ret

000000008000882e <plicinithart>:

void
plicinithart(void)
{
    8000882e:	1101                	addi	sp,sp,-32
    80008830:	ec06                	sd	ra,24(sp)
    80008832:	e822                	sd	s0,16(sp)
    80008834:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008836:	ffffa097          	auipc	ra,0xffffa
    8000883a:	f80080e7          	jalr	-128(ra) # 800027b6 <cpuid>
    8000883e:	87aa                	mv	a5,a0
    80008840:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008844:	fec42783          	lw	a5,-20(s0)
    80008848:	0087979b          	slliw	a5,a5,0x8
    8000884c:	2781                	sext.w	a5,a5
    8000884e:	873e                	mv	a4,a5
    80008850:	0c0027b7          	lui	a5,0xc002
    80008854:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008858:	97ba                	add	a5,a5,a4
    8000885a:	873e                	mv	a4,a5
    8000885c:	40200793          	li	a5,1026
    80008860:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008862:	fec42783          	lw	a5,-20(s0)
    80008866:	00d7979b          	slliw	a5,a5,0xd
    8000886a:	2781                	sext.w	a5,a5
    8000886c:	873e                	mv	a4,a5
    8000886e:	0c2017b7          	lui	a5,0xc201
    80008872:	97ba                	add	a5,a5,a4
    80008874:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008878:	0001                	nop
    8000887a:	60e2                	ld	ra,24(sp)
    8000887c:	6442                	ld	s0,16(sp)
    8000887e:	6105                	addi	sp,sp,32
    80008880:	8082                	ret

0000000080008882 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008882:	1101                	addi	sp,sp,-32
    80008884:	ec06                	sd	ra,24(sp)
    80008886:	e822                	sd	s0,16(sp)
    80008888:	1000                	addi	s0,sp,32
  int hart = cpuid();
    8000888a:	ffffa097          	auipc	ra,0xffffa
    8000888e:	f2c080e7          	jalr	-212(ra) # 800027b6 <cpuid>
    80008892:	87aa                	mv	a5,a0
    80008894:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008898:	fec42783          	lw	a5,-20(s0)
    8000889c:	00d7979b          	slliw	a5,a5,0xd
    800088a0:	2781                	sext.w	a5,a5
    800088a2:	873e                	mv	a4,a5
    800088a4:	0c2017b7          	lui	a5,0xc201
    800088a8:	0791                	addi	a5,a5,4
    800088aa:	97ba                	add	a5,a5,a4
    800088ac:	439c                	lw	a5,0(a5)
    800088ae:	fef42423          	sw	a5,-24(s0)
  return irq;
    800088b2:	fe842783          	lw	a5,-24(s0)
}
    800088b6:	853e                	mv	a0,a5
    800088b8:	60e2                	ld	ra,24(sp)
    800088ba:	6442                	ld	s0,16(sp)
    800088bc:	6105                	addi	sp,sp,32
    800088be:	8082                	ret

00000000800088c0 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    800088c0:	7179                	addi	sp,sp,-48
    800088c2:	f406                	sd	ra,40(sp)
    800088c4:	f022                	sd	s0,32(sp)
    800088c6:	1800                	addi	s0,sp,48
    800088c8:	87aa                	mv	a5,a0
    800088ca:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    800088ce:	ffffa097          	auipc	ra,0xffffa
    800088d2:	ee8080e7          	jalr	-280(ra) # 800027b6 <cpuid>
    800088d6:	87aa                	mv	a5,a0
    800088d8:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    800088dc:	fec42783          	lw	a5,-20(s0)
    800088e0:	00d7979b          	slliw	a5,a5,0xd
    800088e4:	2781                	sext.w	a5,a5
    800088e6:	873e                	mv	a4,a5
    800088e8:	0c2017b7          	lui	a5,0xc201
    800088ec:	0791                	addi	a5,a5,4
    800088ee:	97ba                	add	a5,a5,a4
    800088f0:	873e                	mv	a4,a5
    800088f2:	fdc42783          	lw	a5,-36(s0)
    800088f6:	c31c                	sw	a5,0(a4)
}
    800088f8:	0001                	nop
    800088fa:	70a2                	ld	ra,40(sp)
    800088fc:	7402                	ld	s0,32(sp)
    800088fe:	6145                	addi	sp,sp,48
    80008900:	8082                	ret

0000000080008902 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80008902:	7179                	addi	sp,sp,-48
    80008904:	f406                	sd	ra,40(sp)
    80008906:	f022                	sd	s0,32(sp)
    80008908:	1800                	addi	s0,sp,48
  uint32 status = 0;
    8000890a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    8000890e:	00003597          	auipc	a1,0x3
    80008912:	d7a58593          	addi	a1,a1,-646 # 8000b688 <etext+0x688>
    80008916:	00020517          	auipc	a0,0x20
    8000891a:	81250513          	addi	a0,a0,-2030 # 80028128 <disk+0x2128>
    8000891e:	ffff9097          	auipc	ra,0xffff9
    80008922:	920080e7          	jalr	-1760(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008926:	100017b7          	lui	a5,0x10001
    8000892a:	439c                	lw	a5,0(a5)
    8000892c:	2781                	sext.w	a5,a5
    8000892e:	873e                	mv	a4,a5
    80008930:	747277b7          	lui	a5,0x74727
    80008934:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008938:	04f71063          	bne	a4,a5,80008978 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8000893c:	100017b7          	lui	a5,0x10001
    80008940:	0791                	addi	a5,a5,4
    80008942:	439c                	lw	a5,0(a5)
    80008944:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008946:	873e                	mv	a4,a5
    80008948:	4785                	li	a5,1
    8000894a:	02f71763          	bne	a4,a5,80008978 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8000894e:	100017b7          	lui	a5,0x10001
    80008952:	07a1                	addi	a5,a5,8
    80008954:	439c                	lw	a5,0(a5)
    80008956:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80008958:	873e                	mv	a4,a5
    8000895a:	4789                	li	a5,2
    8000895c:	00f71e63          	bne	a4,a5,80008978 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008960:	100017b7          	lui	a5,0x10001
    80008964:	07b1                	addi	a5,a5,12
    80008966:	439c                	lw	a5,0(a5)
    80008968:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8000896a:	873e                	mv	a4,a5
    8000896c:	554d47b7          	lui	a5,0x554d4
    80008970:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008974:	00f70a63          	beq	a4,a5,80008988 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008978:	00003517          	auipc	a0,0x3
    8000897c:	d2050513          	addi	a0,a0,-736 # 8000b698 <etext+0x698>
    80008980:	ffff8097          	auipc	ra,0xffff8
    80008984:	2fe080e7          	jalr	766(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008988:	fe842783          	lw	a5,-24(s0)
    8000898c:	0017e793          	ori	a5,a5,1
    80008990:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008994:	100017b7          	lui	a5,0x10001
    80008998:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    8000899c:	fe842703          	lw	a4,-24(s0)
    800089a0:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    800089a2:	fe842783          	lw	a5,-24(s0)
    800089a6:	0027e793          	ori	a5,a5,2
    800089aa:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    800089ae:	100017b7          	lui	a5,0x10001
    800089b2:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    800089b6:	fe842703          	lw	a4,-24(s0)
    800089ba:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    800089bc:	100017b7          	lui	a5,0x10001
    800089c0:	07c1                	addi	a5,a5,16
    800089c2:	439c                	lw	a5,0(a5)
    800089c4:	2781                	sext.w	a5,a5
    800089c6:	1782                	slli	a5,a5,0x20
    800089c8:	9381                	srli	a5,a5,0x20
    800089ca:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    800089ce:	fe043783          	ld	a5,-32(s0)
    800089d2:	fdf7f793          	andi	a5,a5,-33
    800089d6:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    800089da:	fe043783          	ld	a5,-32(s0)
    800089de:	f7f7f793          	andi	a5,a5,-129
    800089e2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    800089e6:	fe043703          	ld	a4,-32(s0)
    800089ea:	77fd                	lui	a5,0xfffff
    800089ec:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd67ff>
    800089f0:	8ff9                	and	a5,a5,a4
    800089f2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    800089f6:	fe043703          	ld	a4,-32(s0)
    800089fa:	77fd                	lui	a5,0xfffff
    800089fc:	17fd                	addi	a5,a5,-1
    800089fe:	8ff9                	and	a5,a5,a4
    80008a00:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008a04:	fe043703          	ld	a4,-32(s0)
    80008a08:	f80007b7          	lui	a5,0xf8000
    80008a0c:	17fd                	addi	a5,a5,-1
    80008a0e:	8ff9                	and	a5,a5,a4
    80008a10:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008a14:	fe043703          	ld	a4,-32(s0)
    80008a18:	e00007b7          	lui	a5,0xe0000
    80008a1c:	17fd                	addi	a5,a5,-1
    80008a1e:	8ff9                	and	a5,a5,a4
    80008a20:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008a24:	fe043703          	ld	a4,-32(s0)
    80008a28:	f00007b7          	lui	a5,0xf0000
    80008a2c:	17fd                	addi	a5,a5,-1
    80008a2e:	8ff9                	and	a5,a5,a4
    80008a30:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008a34:	100017b7          	lui	a5,0x10001
    80008a38:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008a3c:	fe043703          	ld	a4,-32(s0)
    80008a40:	2701                	sext.w	a4,a4
    80008a42:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008a44:	fe842783          	lw	a5,-24(s0)
    80008a48:	0087e793          	ori	a5,a5,8
    80008a4c:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a50:	100017b7          	lui	a5,0x10001
    80008a54:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a58:	fe842703          	lw	a4,-24(s0)
    80008a5c:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008a5e:	fe842783          	lw	a5,-24(s0)
    80008a62:	0047e793          	ori	a5,a5,4
    80008a66:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a6a:	100017b7          	lui	a5,0x10001
    80008a6e:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a72:	fe842703          	lw	a4,-24(s0)
    80008a76:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008a78:	100017b7          	lui	a5,0x10001
    80008a7c:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008a80:	6705                	lui	a4,0x1
    80008a82:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008a84:	100017b7          	lui	a5,0x10001
    80008a88:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008a8c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008a90:	100017b7          	lui	a5,0x10001
    80008a94:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008a98:	439c                	lw	a5,0(a5)
    80008a9a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008a9e:	fdc42783          	lw	a5,-36(s0)
    80008aa2:	2781                	sext.w	a5,a5
    80008aa4:	eb89                	bnez	a5,80008ab6 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008aa6:	00003517          	auipc	a0,0x3
    80008aaa:	c1250513          	addi	a0,a0,-1006 # 8000b6b8 <etext+0x6b8>
    80008aae:	ffff8097          	auipc	ra,0xffff8
    80008ab2:	1d0080e7          	jalr	464(ra) # 80000c7e <panic>
  if(max < NUM)
    80008ab6:	fdc42783          	lw	a5,-36(s0)
    80008aba:	0007871b          	sext.w	a4,a5
    80008abe:	479d                	li	a5,7
    80008ac0:	00e7ea63          	bltu	a5,a4,80008ad4 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008ac4:	00003517          	auipc	a0,0x3
    80008ac8:	c1450513          	addi	a0,a0,-1004 # 8000b6d8 <etext+0x6d8>
    80008acc:	ffff8097          	auipc	ra,0xffff8
    80008ad0:	1b2080e7          	jalr	434(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008ad4:	100017b7          	lui	a5,0x10001
    80008ad8:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008adc:	4721                	li	a4,8
    80008ade:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008ae0:	6609                	lui	a2,0x2
    80008ae2:	4581                	li	a1,0
    80008ae4:	0001d517          	auipc	a0,0x1d
    80008ae8:	51c50513          	addi	a0,a0,1308 # 80026000 <disk>
    80008aec:	ffff9097          	auipc	ra,0xffff9
    80008af0:	956080e7          	jalr	-1706(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008af4:	0001d797          	auipc	a5,0x1d
    80008af8:	50c78793          	addi	a5,a5,1292 # 80026000 <disk>
    80008afc:	00c7d713          	srli	a4,a5,0xc
    80008b00:	100017b7          	lui	a5,0x10001
    80008b04:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008b08:	2701                	sext.w	a4,a4
    80008b0a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008b0c:	0001d717          	auipc	a4,0x1d
    80008b10:	4f470713          	addi	a4,a4,1268 # 80026000 <disk>
    80008b14:	6789                	lui	a5,0x2
    80008b16:	97ba                	add	a5,a5,a4
    80008b18:	0001d717          	auipc	a4,0x1d
    80008b1c:	4e870713          	addi	a4,a4,1256 # 80026000 <disk>
    80008b20:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008b22:	0001d717          	auipc	a4,0x1d
    80008b26:	55e70713          	addi	a4,a4,1374 # 80026080 <disk+0x80>
    80008b2a:	0001d697          	auipc	a3,0x1d
    80008b2e:	4d668693          	addi	a3,a3,1238 # 80026000 <disk>
    80008b32:	6789                	lui	a5,0x2
    80008b34:	97b6                	add	a5,a5,a3
    80008b36:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008b38:	0001e717          	auipc	a4,0x1e
    80008b3c:	4c870713          	addi	a4,a4,1224 # 80027000 <disk+0x1000>
    80008b40:	0001d697          	auipc	a3,0x1d
    80008b44:	4c068693          	addi	a3,a3,1216 # 80026000 <disk>
    80008b48:	6789                	lui	a5,0x2
    80008b4a:	97b6                	add	a5,a5,a3
    80008b4c:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008b4e:	fe042623          	sw	zero,-20(s0)
    80008b52:	a015                	j	80008b76 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008b54:	0001d717          	auipc	a4,0x1d
    80008b58:	4ac70713          	addi	a4,a4,1196 # 80026000 <disk>
    80008b5c:	fec42783          	lw	a5,-20(s0)
    80008b60:	97ba                	add	a5,a5,a4
    80008b62:	6709                	lui	a4,0x2
    80008b64:	97ba                	add	a5,a5,a4
    80008b66:	4705                	li	a4,1
    80008b68:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008b6c:	fec42783          	lw	a5,-20(s0)
    80008b70:	2785                	addiw	a5,a5,1
    80008b72:	fef42623          	sw	a5,-20(s0)
    80008b76:	fec42783          	lw	a5,-20(s0)
    80008b7a:	0007871b          	sext.w	a4,a5
    80008b7e:	479d                	li	a5,7
    80008b80:	fce7dae3          	bge	a5,a4,80008b54 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008b84:	0001                	nop
    80008b86:	0001                	nop
    80008b88:	70a2                	ld	ra,40(sp)
    80008b8a:	7402                	ld	s0,32(sp)
    80008b8c:	6145                	addi	sp,sp,48
    80008b8e:	8082                	ret

0000000080008b90 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008b90:	1101                	addi	sp,sp,-32
    80008b92:	ec22                	sd	s0,24(sp)
    80008b94:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008b96:	fe042623          	sw	zero,-20(s0)
    80008b9a:	a081                	j	80008bda <alloc_desc+0x4a>
    if(disk.free[i]){
    80008b9c:	0001d717          	auipc	a4,0x1d
    80008ba0:	46470713          	addi	a4,a4,1124 # 80026000 <disk>
    80008ba4:	fec42783          	lw	a5,-20(s0)
    80008ba8:	97ba                	add	a5,a5,a4
    80008baa:	6709                	lui	a4,0x2
    80008bac:	97ba                	add	a5,a5,a4
    80008bae:	0187c783          	lbu	a5,24(a5)
    80008bb2:	cf99                	beqz	a5,80008bd0 <alloc_desc+0x40>
      disk.free[i] = 0;
    80008bb4:	0001d717          	auipc	a4,0x1d
    80008bb8:	44c70713          	addi	a4,a4,1100 # 80026000 <disk>
    80008bbc:	fec42783          	lw	a5,-20(s0)
    80008bc0:	97ba                	add	a5,a5,a4
    80008bc2:	6709                	lui	a4,0x2
    80008bc4:	97ba                	add	a5,a5,a4
    80008bc6:	00078c23          	sb	zero,24(a5)
      return i;
    80008bca:	fec42783          	lw	a5,-20(s0)
    80008bce:	a831                	j	80008bea <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80008bd0:	fec42783          	lw	a5,-20(s0)
    80008bd4:	2785                	addiw	a5,a5,1
    80008bd6:	fef42623          	sw	a5,-20(s0)
    80008bda:	fec42783          	lw	a5,-20(s0)
    80008bde:	0007871b          	sext.w	a4,a5
    80008be2:	479d                	li	a5,7
    80008be4:	fae7dce3          	bge	a5,a4,80008b9c <alloc_desc+0xc>
    }
  }
  return -1;
    80008be8:	57fd                	li	a5,-1
}
    80008bea:	853e                	mv	a0,a5
    80008bec:	6462                	ld	s0,24(sp)
    80008bee:	6105                	addi	sp,sp,32
    80008bf0:	8082                	ret

0000000080008bf2 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008bf2:	1101                	addi	sp,sp,-32
    80008bf4:	ec06                	sd	ra,24(sp)
    80008bf6:	e822                	sd	s0,16(sp)
    80008bf8:	1000                	addi	s0,sp,32
    80008bfa:	87aa                	mv	a5,a0
    80008bfc:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008c00:	fec42783          	lw	a5,-20(s0)
    80008c04:	0007871b          	sext.w	a4,a5
    80008c08:	479d                	li	a5,7
    80008c0a:	00e7da63          	bge	a5,a4,80008c1e <free_desc+0x2c>
    panic("free_desc 1");
    80008c0e:	00003517          	auipc	a0,0x3
    80008c12:	aea50513          	addi	a0,a0,-1302 # 8000b6f8 <etext+0x6f8>
    80008c16:	ffff8097          	auipc	ra,0xffff8
    80008c1a:	068080e7          	jalr	104(ra) # 80000c7e <panic>
  if(disk.free[i])
    80008c1e:	0001d717          	auipc	a4,0x1d
    80008c22:	3e270713          	addi	a4,a4,994 # 80026000 <disk>
    80008c26:	fec42783          	lw	a5,-20(s0)
    80008c2a:	97ba                	add	a5,a5,a4
    80008c2c:	6709                	lui	a4,0x2
    80008c2e:	97ba                	add	a5,a5,a4
    80008c30:	0187c783          	lbu	a5,24(a5)
    80008c34:	cb89                	beqz	a5,80008c46 <free_desc+0x54>
    panic("free_desc 2");
    80008c36:	00003517          	auipc	a0,0x3
    80008c3a:	ad250513          	addi	a0,a0,-1326 # 8000b708 <etext+0x708>
    80008c3e:	ffff8097          	auipc	ra,0xffff8
    80008c42:	040080e7          	jalr	64(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    80008c46:	0001d717          	auipc	a4,0x1d
    80008c4a:	3ba70713          	addi	a4,a4,954 # 80026000 <disk>
    80008c4e:	6789                	lui	a5,0x2
    80008c50:	97ba                	add	a5,a5,a4
    80008c52:	6398                	ld	a4,0(a5)
    80008c54:	fec42783          	lw	a5,-20(s0)
    80008c58:	0792                	slli	a5,a5,0x4
    80008c5a:	97ba                	add	a5,a5,a4
    80008c5c:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    80008c60:	0001d717          	auipc	a4,0x1d
    80008c64:	3a070713          	addi	a4,a4,928 # 80026000 <disk>
    80008c68:	6789                	lui	a5,0x2
    80008c6a:	97ba                	add	a5,a5,a4
    80008c6c:	6398                	ld	a4,0(a5)
    80008c6e:	fec42783          	lw	a5,-20(s0)
    80008c72:	0792                	slli	a5,a5,0x4
    80008c74:	97ba                	add	a5,a5,a4
    80008c76:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    80008c7a:	0001d717          	auipc	a4,0x1d
    80008c7e:	38670713          	addi	a4,a4,902 # 80026000 <disk>
    80008c82:	6789                	lui	a5,0x2
    80008c84:	97ba                	add	a5,a5,a4
    80008c86:	6398                	ld	a4,0(a5)
    80008c88:	fec42783          	lw	a5,-20(s0)
    80008c8c:	0792                	slli	a5,a5,0x4
    80008c8e:	97ba                	add	a5,a5,a4
    80008c90:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80008c94:	0001d717          	auipc	a4,0x1d
    80008c98:	36c70713          	addi	a4,a4,876 # 80026000 <disk>
    80008c9c:	6789                	lui	a5,0x2
    80008c9e:	97ba                	add	a5,a5,a4
    80008ca0:	6398                	ld	a4,0(a5)
    80008ca2:	fec42783          	lw	a5,-20(s0)
    80008ca6:	0792                	slli	a5,a5,0x4
    80008ca8:	97ba                	add	a5,a5,a4
    80008caa:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    80008cae:	0001d717          	auipc	a4,0x1d
    80008cb2:	35270713          	addi	a4,a4,850 # 80026000 <disk>
    80008cb6:	fec42783          	lw	a5,-20(s0)
    80008cba:	97ba                	add	a5,a5,a4
    80008cbc:	6709                	lui	a4,0x2
    80008cbe:	97ba                	add	a5,a5,a4
    80008cc0:	4705                	li	a4,1
    80008cc2:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80008cc6:	0001f517          	auipc	a0,0x1f
    80008cca:	35250513          	addi	a0,a0,850 # 80028018 <disk+0x2018>
    80008cce:	ffffb097          	auipc	ra,0xffffb
    80008cd2:	806080e7          	jalr	-2042(ra) # 800034d4 <wakeup>
}
    80008cd6:	0001                	nop
    80008cd8:	60e2                	ld	ra,24(sp)
    80008cda:	6442                	ld	s0,16(sp)
    80008cdc:	6105                	addi	sp,sp,32
    80008cde:	8082                	ret

0000000080008ce0 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80008ce0:	7179                	addi	sp,sp,-48
    80008ce2:	f406                	sd	ra,40(sp)
    80008ce4:	f022                	sd	s0,32(sp)
    80008ce6:	1800                	addi	s0,sp,48
    80008ce8:	87aa                	mv	a5,a0
    80008cea:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    80008cee:	0001d717          	auipc	a4,0x1d
    80008cf2:	31270713          	addi	a4,a4,786 # 80026000 <disk>
    80008cf6:	6789                	lui	a5,0x2
    80008cf8:	97ba                	add	a5,a5,a4
    80008cfa:	6398                	ld	a4,0(a5)
    80008cfc:	fdc42783          	lw	a5,-36(s0)
    80008d00:	0792                	slli	a5,a5,0x4
    80008d02:	97ba                	add	a5,a5,a4
    80008d04:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80008d08:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    80008d0c:	0001d717          	auipc	a4,0x1d
    80008d10:	2f470713          	addi	a4,a4,756 # 80026000 <disk>
    80008d14:	6789                	lui	a5,0x2
    80008d16:	97ba                	add	a5,a5,a4
    80008d18:	6398                	ld	a4,0(a5)
    80008d1a:	fdc42783          	lw	a5,-36(s0)
    80008d1e:	0792                	slli	a5,a5,0x4
    80008d20:	97ba                	add	a5,a5,a4
    80008d22:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    80008d26:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    80008d2a:	fdc42783          	lw	a5,-36(s0)
    80008d2e:	853e                	mv	a0,a5
    80008d30:	00000097          	auipc	ra,0x0
    80008d34:	ec2080e7          	jalr	-318(ra) # 80008bf2 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80008d38:	fec42783          	lw	a5,-20(s0)
    80008d3c:	8b85                	andi	a5,a5,1
    80008d3e:	2781                	sext.w	a5,a5
    80008d40:	c791                	beqz	a5,80008d4c <free_chain+0x6c>
      i = nxt;
    80008d42:	fe842783          	lw	a5,-24(s0)
    80008d46:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    80008d4a:	b755                	j	80008cee <free_chain+0xe>
    else
      break;
    80008d4c:	0001                	nop
  }
}
    80008d4e:	0001                	nop
    80008d50:	70a2                	ld	ra,40(sp)
    80008d52:	7402                	ld	s0,32(sp)
    80008d54:	6145                	addi	sp,sp,48
    80008d56:	8082                	ret

0000000080008d58 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80008d58:	7139                	addi	sp,sp,-64
    80008d5a:	fc06                	sd	ra,56(sp)
    80008d5c:	f822                	sd	s0,48(sp)
    80008d5e:	f426                	sd	s1,40(sp)
    80008d60:	0080                	addi	s0,sp,64
    80008d62:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80008d66:	fc042e23          	sw	zero,-36(s0)
    80008d6a:	a895                	j	80008dde <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    80008d6c:	fdc42783          	lw	a5,-36(s0)
    80008d70:	078a                	slli	a5,a5,0x2
    80008d72:	fc843703          	ld	a4,-56(s0)
    80008d76:	00f704b3          	add	s1,a4,a5
    80008d7a:	00000097          	auipc	ra,0x0
    80008d7e:	e16080e7          	jalr	-490(ra) # 80008b90 <alloc_desc>
    80008d82:	87aa                	mv	a5,a0
    80008d84:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80008d86:	fdc42783          	lw	a5,-36(s0)
    80008d8a:	078a                	slli	a5,a5,0x2
    80008d8c:	fc843703          	ld	a4,-56(s0)
    80008d90:	97ba                	add	a5,a5,a4
    80008d92:	439c                	lw	a5,0(a5)
    80008d94:	0407d063          	bgez	a5,80008dd4 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80008d98:	fc042c23          	sw	zero,-40(s0)
    80008d9c:	a015                	j	80008dc0 <alloc3_desc+0x68>
        free_desc(idx[j]);
    80008d9e:	fd842783          	lw	a5,-40(s0)
    80008da2:	078a                	slli	a5,a5,0x2
    80008da4:	fc843703          	ld	a4,-56(s0)
    80008da8:	97ba                	add	a5,a5,a4
    80008daa:	439c                	lw	a5,0(a5)
    80008dac:	853e                	mv	a0,a5
    80008dae:	00000097          	auipc	ra,0x0
    80008db2:	e44080e7          	jalr	-444(ra) # 80008bf2 <free_desc>
      for(int j = 0; j < i; j++)
    80008db6:	fd842783          	lw	a5,-40(s0)
    80008dba:	2785                	addiw	a5,a5,1
    80008dbc:	fcf42c23          	sw	a5,-40(s0)
    80008dc0:	fd842703          	lw	a4,-40(s0)
    80008dc4:	fdc42783          	lw	a5,-36(s0)
    80008dc8:	2701                	sext.w	a4,a4
    80008dca:	2781                	sext.w	a5,a5
    80008dcc:	fcf749e3          	blt	a4,a5,80008d9e <alloc3_desc+0x46>
      return -1;
    80008dd0:	57fd                	li	a5,-1
    80008dd2:	a831                	j	80008dee <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80008dd4:	fdc42783          	lw	a5,-36(s0)
    80008dd8:	2785                	addiw	a5,a5,1
    80008dda:	fcf42e23          	sw	a5,-36(s0)
    80008dde:	fdc42783          	lw	a5,-36(s0)
    80008de2:	0007871b          	sext.w	a4,a5
    80008de6:	4789                	li	a5,2
    80008de8:	f8e7d2e3          	bge	a5,a4,80008d6c <alloc3_desc+0x14>
    }
  }
  return 0;
    80008dec:	4781                	li	a5,0
}
    80008dee:	853e                	mv	a0,a5
    80008df0:	70e2                	ld	ra,56(sp)
    80008df2:	7442                	ld	s0,48(sp)
    80008df4:	74a2                	ld	s1,40(sp)
    80008df6:	6121                	addi	sp,sp,64
    80008df8:	8082                	ret

0000000080008dfa <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    80008dfa:	7139                	addi	sp,sp,-64
    80008dfc:	fc06                	sd	ra,56(sp)
    80008dfe:	f822                	sd	s0,48(sp)
    80008e00:	0080                	addi	s0,sp,64
    80008e02:	fca43423          	sd	a0,-56(s0)
    80008e06:	87ae                	mv	a5,a1
    80008e08:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80008e0c:	fc843783          	ld	a5,-56(s0)
    80008e10:	47dc                	lw	a5,12(a5)
    80008e12:	0017979b          	slliw	a5,a5,0x1
    80008e16:	2781                	sext.w	a5,a5
    80008e18:	1782                	slli	a5,a5,0x20
    80008e1a:	9381                	srli	a5,a5,0x20
    80008e1c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    80008e20:	0001f517          	auipc	a0,0x1f
    80008e24:	30850513          	addi	a0,a0,776 # 80028128 <disk+0x2128>
    80008e28:	ffff8097          	auipc	ra,0xffff8
    80008e2c:	446080e7          	jalr	1094(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    80008e30:	fd040793          	addi	a5,s0,-48
    80008e34:	853e                	mv	a0,a5
    80008e36:	00000097          	auipc	ra,0x0
    80008e3a:	f22080e7          	jalr	-222(ra) # 80008d58 <alloc3_desc>
    80008e3e:	87aa                	mv	a5,a0
    80008e40:	cf91                	beqz	a5,80008e5c <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80008e42:	0001f597          	auipc	a1,0x1f
    80008e46:	2e658593          	addi	a1,a1,742 # 80028128 <disk+0x2128>
    80008e4a:	0001f517          	auipc	a0,0x1f
    80008e4e:	1ce50513          	addi	a0,a0,462 # 80028018 <disk+0x2018>
    80008e52:	ffffa097          	auipc	ra,0xffffa
    80008e56:	606080e7          	jalr	1542(ra) # 80003458 <sleep>
    if(alloc3_desc(idx) == 0) {
    80008e5a:	bfd9                	j	80008e30 <virtio_disk_rw+0x36>
      break;
    80008e5c:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    80008e5e:	fd042783          	lw	a5,-48(s0)
    80008e62:	20078793          	addi	a5,a5,512
    80008e66:	00479713          	slli	a4,a5,0x4
    80008e6a:	0001d797          	auipc	a5,0x1d
    80008e6e:	19678793          	addi	a5,a5,406 # 80026000 <disk>
    80008e72:	97ba                	add	a5,a5,a4
    80008e74:	0a878793          	addi	a5,a5,168
    80008e78:	fef43023          	sd	a5,-32(s0)

  if(write)
    80008e7c:	fc442783          	lw	a5,-60(s0)
    80008e80:	2781                	sext.w	a5,a5
    80008e82:	c791                	beqz	a5,80008e8e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80008e84:	fe043783          	ld	a5,-32(s0)
    80008e88:	4705                	li	a4,1
    80008e8a:	c398                	sw	a4,0(a5)
    80008e8c:	a029                	j	80008e96 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80008e8e:	fe043783          	ld	a5,-32(s0)
    80008e92:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80008e96:	fe043783          	ld	a5,-32(s0)
    80008e9a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    80008e9e:	fe043783          	ld	a5,-32(s0)
    80008ea2:	fe843703          	ld	a4,-24(s0)
    80008ea6:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80008ea8:	0001d717          	auipc	a4,0x1d
    80008eac:	15870713          	addi	a4,a4,344 # 80026000 <disk>
    80008eb0:	6789                	lui	a5,0x2
    80008eb2:	97ba                	add	a5,a5,a4
    80008eb4:	6398                	ld	a4,0(a5)
    80008eb6:	fd042783          	lw	a5,-48(s0)
    80008eba:	0792                	slli	a5,a5,0x4
    80008ebc:	97ba                	add	a5,a5,a4
    80008ebe:	fe043703          	ld	a4,-32(s0)
    80008ec2:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80008ec4:	0001d717          	auipc	a4,0x1d
    80008ec8:	13c70713          	addi	a4,a4,316 # 80026000 <disk>
    80008ecc:	6789                	lui	a5,0x2
    80008ece:	97ba                	add	a5,a5,a4
    80008ed0:	6398                	ld	a4,0(a5)
    80008ed2:	fd042783          	lw	a5,-48(s0)
    80008ed6:	0792                	slli	a5,a5,0x4
    80008ed8:	97ba                	add	a5,a5,a4
    80008eda:	4741                	li	a4,16
    80008edc:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80008ede:	0001d717          	auipc	a4,0x1d
    80008ee2:	12270713          	addi	a4,a4,290 # 80026000 <disk>
    80008ee6:	6789                	lui	a5,0x2
    80008ee8:	97ba                	add	a5,a5,a4
    80008eea:	6398                	ld	a4,0(a5)
    80008eec:	fd042783          	lw	a5,-48(s0)
    80008ef0:	0792                	slli	a5,a5,0x4
    80008ef2:	97ba                	add	a5,a5,a4
    80008ef4:	4705                	li	a4,1
    80008ef6:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    80008efa:	fd442683          	lw	a3,-44(s0)
    80008efe:	0001d717          	auipc	a4,0x1d
    80008f02:	10270713          	addi	a4,a4,258 # 80026000 <disk>
    80008f06:	6789                	lui	a5,0x2
    80008f08:	97ba                	add	a5,a5,a4
    80008f0a:	6398                	ld	a4,0(a5)
    80008f0c:	fd042783          	lw	a5,-48(s0)
    80008f10:	0792                	slli	a5,a5,0x4
    80008f12:	97ba                	add	a5,a5,a4
    80008f14:	03069713          	slli	a4,a3,0x30
    80008f18:	9341                	srli	a4,a4,0x30
    80008f1a:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    80008f1e:	fc843783          	ld	a5,-56(s0)
    80008f22:	05878693          	addi	a3,a5,88
    80008f26:	0001d717          	auipc	a4,0x1d
    80008f2a:	0da70713          	addi	a4,a4,218 # 80026000 <disk>
    80008f2e:	6789                	lui	a5,0x2
    80008f30:	97ba                	add	a5,a5,a4
    80008f32:	6398                	ld	a4,0(a5)
    80008f34:	fd442783          	lw	a5,-44(s0)
    80008f38:	0792                	slli	a5,a5,0x4
    80008f3a:	97ba                	add	a5,a5,a4
    80008f3c:	8736                	mv	a4,a3
    80008f3e:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80008f40:	0001d717          	auipc	a4,0x1d
    80008f44:	0c070713          	addi	a4,a4,192 # 80026000 <disk>
    80008f48:	6789                	lui	a5,0x2
    80008f4a:	97ba                	add	a5,a5,a4
    80008f4c:	6398                	ld	a4,0(a5)
    80008f4e:	fd442783          	lw	a5,-44(s0)
    80008f52:	0792                	slli	a5,a5,0x4
    80008f54:	97ba                	add	a5,a5,a4
    80008f56:	40000713          	li	a4,1024
    80008f5a:	c798                	sw	a4,8(a5)
  if(write)
    80008f5c:	fc442783          	lw	a5,-60(s0)
    80008f60:	2781                	sext.w	a5,a5
    80008f62:	cf99                	beqz	a5,80008f80 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80008f64:	0001d717          	auipc	a4,0x1d
    80008f68:	09c70713          	addi	a4,a4,156 # 80026000 <disk>
    80008f6c:	6789                	lui	a5,0x2
    80008f6e:	97ba                	add	a5,a5,a4
    80008f70:	6398                	ld	a4,0(a5)
    80008f72:	fd442783          	lw	a5,-44(s0)
    80008f76:	0792                	slli	a5,a5,0x4
    80008f78:	97ba                	add	a5,a5,a4
    80008f7a:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    80008f7e:	a839                	j	80008f9c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80008f80:	0001d717          	auipc	a4,0x1d
    80008f84:	08070713          	addi	a4,a4,128 # 80026000 <disk>
    80008f88:	6789                	lui	a5,0x2
    80008f8a:	97ba                	add	a5,a5,a4
    80008f8c:	6398                	ld	a4,0(a5)
    80008f8e:	fd442783          	lw	a5,-44(s0)
    80008f92:	0792                	slli	a5,a5,0x4
    80008f94:	97ba                	add	a5,a5,a4
    80008f96:	4709                	li	a4,2
    80008f98:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80008f9c:	0001d717          	auipc	a4,0x1d
    80008fa0:	06470713          	addi	a4,a4,100 # 80026000 <disk>
    80008fa4:	6789                	lui	a5,0x2
    80008fa6:	97ba                	add	a5,a5,a4
    80008fa8:	6398                	ld	a4,0(a5)
    80008faa:	fd442783          	lw	a5,-44(s0)
    80008fae:	0792                	slli	a5,a5,0x4
    80008fb0:	97ba                	add	a5,a5,a4
    80008fb2:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80008fb6:	0001d697          	auipc	a3,0x1d
    80008fba:	04a68693          	addi	a3,a3,74 # 80026000 <disk>
    80008fbe:	6789                	lui	a5,0x2
    80008fc0:	97b6                	add	a5,a5,a3
    80008fc2:	6394                	ld	a3,0(a5)
    80008fc4:	fd442783          	lw	a5,-44(s0)
    80008fc8:	0792                	slli	a5,a5,0x4
    80008fca:	97b6                	add	a5,a5,a3
    80008fcc:	00176713          	ori	a4,a4,1
    80008fd0:	1742                	slli	a4,a4,0x30
    80008fd2:	9341                	srli	a4,a4,0x30
    80008fd4:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80008fd8:	fd842683          	lw	a3,-40(s0)
    80008fdc:	0001d717          	auipc	a4,0x1d
    80008fe0:	02470713          	addi	a4,a4,36 # 80026000 <disk>
    80008fe4:	6789                	lui	a5,0x2
    80008fe6:	97ba                	add	a5,a5,a4
    80008fe8:	6398                	ld	a4,0(a5)
    80008fea:	fd442783          	lw	a5,-44(s0)
    80008fee:	0792                	slli	a5,a5,0x4
    80008ff0:	97ba                	add	a5,a5,a4
    80008ff2:	03069713          	slli	a4,a3,0x30
    80008ff6:	9341                	srli	a4,a4,0x30
    80008ff8:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    80008ffc:	fd042783          	lw	a5,-48(s0)
    80009000:	0001d717          	auipc	a4,0x1d
    80009004:	00070713          	mv	a4,a4
    80009008:	20078793          	addi	a5,a5,512
    8000900c:	0792                	slli	a5,a5,0x4
    8000900e:	97ba                	add	a5,a5,a4
    80009010:	577d                	li	a4,-1
    80009012:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009016:	fd042783          	lw	a5,-48(s0)
    8000901a:	20078793          	addi	a5,a5,512
    8000901e:	00479713          	slli	a4,a5,0x4
    80009022:	0001d797          	auipc	a5,0x1d
    80009026:	fde78793          	addi	a5,a5,-34 # 80026000 <disk>
    8000902a:	97ba                	add	a5,a5,a4
    8000902c:	03078693          	addi	a3,a5,48
    80009030:	0001d717          	auipc	a4,0x1d
    80009034:	fd070713          	addi	a4,a4,-48 # 80026000 <disk>
    80009038:	6789                	lui	a5,0x2
    8000903a:	97ba                	add	a5,a5,a4
    8000903c:	6398                	ld	a4,0(a5)
    8000903e:	fd842783          	lw	a5,-40(s0)
    80009042:	0792                	slli	a5,a5,0x4
    80009044:	97ba                	add	a5,a5,a4
    80009046:	8736                	mv	a4,a3
    80009048:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    8000904a:	0001d717          	auipc	a4,0x1d
    8000904e:	fb670713          	addi	a4,a4,-74 # 80026000 <disk>
    80009052:	6789                	lui	a5,0x2
    80009054:	97ba                	add	a5,a5,a4
    80009056:	6398                	ld	a4,0(a5)
    80009058:	fd842783          	lw	a5,-40(s0)
    8000905c:	0792                	slli	a5,a5,0x4
    8000905e:	97ba                	add	a5,a5,a4
    80009060:	4705                	li	a4,1
    80009062:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009064:	0001d717          	auipc	a4,0x1d
    80009068:	f9c70713          	addi	a4,a4,-100 # 80026000 <disk>
    8000906c:	6789                	lui	a5,0x2
    8000906e:	97ba                	add	a5,a5,a4
    80009070:	6398                	ld	a4,0(a5)
    80009072:	fd842783          	lw	a5,-40(s0)
    80009076:	0792                	slli	a5,a5,0x4
    80009078:	97ba                	add	a5,a5,a4
    8000907a:	4709                	li	a4,2
    8000907c:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009080:	0001d717          	auipc	a4,0x1d
    80009084:	f8070713          	addi	a4,a4,-128 # 80026000 <disk>
    80009088:	6789                	lui	a5,0x2
    8000908a:	97ba                	add	a5,a5,a4
    8000908c:	6398                	ld	a4,0(a5)
    8000908e:	fd842783          	lw	a5,-40(s0)
    80009092:	0792                	slli	a5,a5,0x4
    80009094:	97ba                	add	a5,a5,a4
    80009096:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000909a:	fc843783          	ld	a5,-56(s0)
    8000909e:	4705                	li	a4,1
    800090a0:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    800090a2:	fd042783          	lw	a5,-48(s0)
    800090a6:	0001d717          	auipc	a4,0x1d
    800090aa:	f5a70713          	addi	a4,a4,-166 # 80026000 <disk>
    800090ae:	20078793          	addi	a5,a5,512
    800090b2:	0792                	slli	a5,a5,0x4
    800090b4:	97ba                	add	a5,a5,a4
    800090b6:	fc843703          	ld	a4,-56(s0)
    800090ba:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    800090bc:	fd042603          	lw	a2,-48(s0)
    800090c0:	0001d717          	auipc	a4,0x1d
    800090c4:	f4070713          	addi	a4,a4,-192 # 80026000 <disk>
    800090c8:	6789                	lui	a5,0x2
    800090ca:	97ba                	add	a5,a5,a4
    800090cc:	6794                	ld	a3,8(a5)
    800090ce:	0001d717          	auipc	a4,0x1d
    800090d2:	f3270713          	addi	a4,a4,-206 # 80026000 <disk>
    800090d6:	6789                	lui	a5,0x2
    800090d8:	97ba                	add	a5,a5,a4
    800090da:	679c                	ld	a5,8(a5)
    800090dc:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    800090e0:	2781                	sext.w	a5,a5
    800090e2:	8b9d                	andi	a5,a5,7
    800090e4:	2781                	sext.w	a5,a5
    800090e6:	03061713          	slli	a4,a2,0x30
    800090ea:	9341                	srli	a4,a4,0x30
    800090ec:	0786                	slli	a5,a5,0x1
    800090ee:	97b6                	add	a5,a5,a3
    800090f0:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    800090f4:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    800090f8:	0001d717          	auipc	a4,0x1d
    800090fc:	f0870713          	addi	a4,a4,-248 # 80026000 <disk>
    80009100:	6789                	lui	a5,0x2
    80009102:	97ba                	add	a5,a5,a4
    80009104:	679c                	ld	a5,8(a5)
    80009106:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000910a:	0001d697          	auipc	a3,0x1d
    8000910e:	ef668693          	addi	a3,a3,-266 # 80026000 <disk>
    80009112:	6789                	lui	a5,0x2
    80009114:	97b6                	add	a5,a5,a3
    80009116:	679c                	ld	a5,8(a5)
    80009118:	2705                	addiw	a4,a4,1
    8000911a:	1742                	slli	a4,a4,0x30
    8000911c:	9341                	srli	a4,a4,0x30
    8000911e:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    80009122:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009126:	100017b7          	lui	a5,0x10001
    8000912a:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    8000912e:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009132:	a819                	j	80009148 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    80009134:	0001f597          	auipc	a1,0x1f
    80009138:	ff458593          	addi	a1,a1,-12 # 80028128 <disk+0x2128>
    8000913c:	fc843503          	ld	a0,-56(s0)
    80009140:	ffffa097          	auipc	ra,0xffffa
    80009144:	318080e7          	jalr	792(ra) # 80003458 <sleep>
  while(b->disk == 1) {
    80009148:	fc843783          	ld	a5,-56(s0)
    8000914c:	43dc                	lw	a5,4(a5)
    8000914e:	873e                	mv	a4,a5
    80009150:	4785                	li	a5,1
    80009152:	fef701e3          	beq	a4,a5,80009134 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    80009156:	fd042783          	lw	a5,-48(s0)
    8000915a:	0001d717          	auipc	a4,0x1d
    8000915e:	ea670713          	addi	a4,a4,-346 # 80026000 <disk>
    80009162:	20078793          	addi	a5,a5,512
    80009166:	0792                	slli	a5,a5,0x4
    80009168:	97ba                	add	a5,a5,a4
    8000916a:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    8000916e:	fd042783          	lw	a5,-48(s0)
    80009172:	853e                	mv	a0,a5
    80009174:	00000097          	auipc	ra,0x0
    80009178:	b6c080e7          	jalr	-1172(ra) # 80008ce0 <free_chain>

  release(&disk.vdisk_lock);
    8000917c:	0001f517          	auipc	a0,0x1f
    80009180:	fac50513          	addi	a0,a0,-84 # 80028128 <disk+0x2128>
    80009184:	ffff8097          	auipc	ra,0xffff8
    80009188:	14e080e7          	jalr	334(ra) # 800012d2 <release>
}
    8000918c:	0001                	nop
    8000918e:	70e2                	ld	ra,56(sp)
    80009190:	7442                	ld	s0,48(sp)
    80009192:	6121                	addi	sp,sp,64
    80009194:	8082                	ret

0000000080009196 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009196:	1101                	addi	sp,sp,-32
    80009198:	ec06                	sd	ra,24(sp)
    8000919a:	e822                	sd	s0,16(sp)
    8000919c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000919e:	0001f517          	auipc	a0,0x1f
    800091a2:	f8a50513          	addi	a0,a0,-118 # 80028128 <disk+0x2128>
    800091a6:	ffff8097          	auipc	ra,0xffff8
    800091aa:	0c8080e7          	jalr	200(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    800091ae:	100017b7          	lui	a5,0x10001
    800091b2:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    800091b6:	439c                	lw	a5,0(a5)
    800091b8:	0007871b          	sext.w	a4,a5
    800091bc:	100017b7          	lui	a5,0x10001
    800091c0:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    800091c4:	8b0d                	andi	a4,a4,3
    800091c6:	2701                	sext.w	a4,a4
    800091c8:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    800091ca:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    800091ce:	a855                	j	80009282 <virtio_disk_intr+0xec>
    __sync_synchronize();
    800091d0:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    800091d4:	0001d717          	auipc	a4,0x1d
    800091d8:	e2c70713          	addi	a4,a4,-468 # 80026000 <disk>
    800091dc:	6789                	lui	a5,0x2
    800091de:	97ba                	add	a5,a5,a4
    800091e0:	6b98                	ld	a4,16(a5)
    800091e2:	0001d697          	auipc	a3,0x1d
    800091e6:	e1e68693          	addi	a3,a3,-482 # 80026000 <disk>
    800091ea:	6789                	lui	a5,0x2
    800091ec:	97b6                	add	a5,a5,a3
    800091ee:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    800091f2:	2781                	sext.w	a5,a5
    800091f4:	8b9d                	andi	a5,a5,7
    800091f6:	2781                	sext.w	a5,a5
    800091f8:	078e                	slli	a5,a5,0x3
    800091fa:	97ba                	add	a5,a5,a4
    800091fc:	43dc                	lw	a5,4(a5)
    800091fe:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009202:	0001d717          	auipc	a4,0x1d
    80009206:	dfe70713          	addi	a4,a4,-514 # 80026000 <disk>
    8000920a:	fec42783          	lw	a5,-20(s0)
    8000920e:	20078793          	addi	a5,a5,512
    80009212:	0792                	slli	a5,a5,0x4
    80009214:	97ba                	add	a5,a5,a4
    80009216:	0307c783          	lbu	a5,48(a5)
    8000921a:	cb89                	beqz	a5,8000922c <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000921c:	00002517          	auipc	a0,0x2
    80009220:	4fc50513          	addi	a0,a0,1276 # 8000b718 <etext+0x718>
    80009224:	ffff8097          	auipc	ra,0xffff8
    80009228:	a5a080e7          	jalr	-1446(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    8000922c:	0001d717          	auipc	a4,0x1d
    80009230:	dd470713          	addi	a4,a4,-556 # 80026000 <disk>
    80009234:	fec42783          	lw	a5,-20(s0)
    80009238:	20078793          	addi	a5,a5,512
    8000923c:	0792                	slli	a5,a5,0x4
    8000923e:	97ba                	add	a5,a5,a4
    80009240:	779c                	ld	a5,40(a5)
    80009242:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009246:	fe043783          	ld	a5,-32(s0)
    8000924a:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    8000924e:	fe043503          	ld	a0,-32(s0)
    80009252:	ffffa097          	auipc	ra,0xffffa
    80009256:	282080e7          	jalr	642(ra) # 800034d4 <wakeup>

    disk.used_idx += 1;
    8000925a:	0001d717          	auipc	a4,0x1d
    8000925e:	da670713          	addi	a4,a4,-602 # 80026000 <disk>
    80009262:	6789                	lui	a5,0x2
    80009264:	97ba                	add	a5,a5,a4
    80009266:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000926a:	2785                	addiw	a5,a5,1
    8000926c:	03079713          	slli	a4,a5,0x30
    80009270:	9341                	srli	a4,a4,0x30
    80009272:	0001d697          	auipc	a3,0x1d
    80009276:	d8e68693          	addi	a3,a3,-626 # 80026000 <disk>
    8000927a:	6789                	lui	a5,0x2
    8000927c:	97b6                	add	a5,a5,a3
    8000927e:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009282:	0001d717          	auipc	a4,0x1d
    80009286:	d7e70713          	addi	a4,a4,-642 # 80026000 <disk>
    8000928a:	6789                	lui	a5,0x2
    8000928c:	97ba                	add	a5,a5,a4
    8000928e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009292:	0001d717          	auipc	a4,0x1d
    80009296:	d6e70713          	addi	a4,a4,-658 # 80026000 <disk>
    8000929a:	6789                	lui	a5,0x2
    8000929c:	97ba                	add	a5,a5,a4
    8000929e:	6b9c                	ld	a5,16(a5)
    800092a0:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    800092a4:	0006871b          	sext.w	a4,a3
    800092a8:	2781                	sext.w	a5,a5
    800092aa:	f2f713e3          	bne	a4,a5,800091d0 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    800092ae:	0001f517          	auipc	a0,0x1f
    800092b2:	e7a50513          	addi	a0,a0,-390 # 80028128 <disk+0x2128>
    800092b6:	ffff8097          	auipc	ra,0xffff8
    800092ba:	01c080e7          	jalr	28(ra) # 800012d2 <release>
}
    800092be:	0001                	nop
    800092c0:	60e2                	ld	ra,24(sp)
    800092c2:	6442                	ld	s0,16(sp)
    800092c4:	6105                	addi	sp,sp,32
    800092c6:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
