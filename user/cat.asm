
user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
   8:	87aa                	mv	a5,a0
   a:	fcf42e23          	sw	a5,-36(s0)
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   e:	a091                	j	52 <cat+0x52>
    if (write(1, buf, n) != n) {
  10:	fec42783          	lw	a5,-20(s0)
  14:	863e                	mv	a2,a5
  16:	00001597          	auipc	a1,0x1
  1a:	ec258593          	addi	a1,a1,-318 # ed8 <buf>
  1e:	4505                	li	a0,1
  20:	00000097          	auipc	ra,0x0
  24:	60e080e7          	jalr	1550(ra) # 62e <write>
  28:	87aa                	mv	a5,a0
  2a:	873e                	mv	a4,a5
  2c:	fec42783          	lw	a5,-20(s0)
  30:	2781                	sext.w	a5,a5
  32:	02e78063          	beq	a5,a4,52 <cat+0x52>
      fprintf(2, "cat: write error\n");
  36:	00001597          	auipc	a1,0x1
  3a:	e3a58593          	addi	a1,a1,-454 # e70 <malloc+0x142>
  3e:	4509                	li	a0,2
  40:	00001097          	auipc	ra,0x1
  44:	aa4080e7          	jalr	-1372(ra) # ae4 <fprintf>
      exit(1);
  48:	4505                	li	a0,1
  4a:	00000097          	auipc	ra,0x0
  4e:	5c4080e7          	jalr	1476(ra) # 60e <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  52:	fdc42783          	lw	a5,-36(s0)
  56:	20000613          	li	a2,512
  5a:	00001597          	auipc	a1,0x1
  5e:	e7e58593          	addi	a1,a1,-386 # ed8 <buf>
  62:	853e                	mv	a0,a5
  64:	00000097          	auipc	ra,0x0
  68:	5c2080e7          	jalr	1474(ra) # 626 <read>
  6c:	87aa                	mv	a5,a0
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fec42783          	lw	a5,-20(s0)
  76:	2781                	sext.w	a5,a5
  78:	f8f04ce3          	bgtz	a5,10 <cat+0x10>
    }
  }
  if(n < 0){
  7c:	fec42783          	lw	a5,-20(s0)
  80:	2781                	sext.w	a5,a5
  82:	0207d063          	bgez	a5,a2 <cat+0xa2>
    fprintf(2, "cat: read error\n");
  86:	00001597          	auipc	a1,0x1
  8a:	e0258593          	addi	a1,a1,-510 # e88 <malloc+0x15a>
  8e:	4509                	li	a0,2
  90:	00001097          	auipc	ra,0x1
  94:	a54080e7          	jalr	-1452(ra) # ae4 <fprintf>
    exit(1);
  98:	4505                	li	a0,1
  9a:	00000097          	auipc	ra,0x0
  9e:	574080e7          	jalr	1396(ra) # 60e <exit>
  }
}
  a2:	0001                	nop
  a4:	70a2                	ld	ra,40(sp)
  a6:	7402                	ld	s0,32(sp)
  a8:	6145                	addi	sp,sp,48
  aa:	8082                	ret

00000000000000ac <main>:

int
main(int argc, char *argv[])
{
  ac:	7179                	addi	sp,sp,-48
  ae:	f406                	sd	ra,40(sp)
  b0:	f022                	sd	s0,32(sp)
  b2:	1800                	addi	s0,sp,48
  b4:	87aa                	mv	a5,a0
  b6:	fcb43823          	sd	a1,-48(s0)
  ba:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
  be:	fdc42783          	lw	a5,-36(s0)
  c2:	0007871b          	sext.w	a4,a5
  c6:	4785                	li	a5,1
  c8:	00e7cc63          	blt	a5,a4,e0 <main+0x34>
    cat(0);
  cc:	4501                	li	a0,0
  ce:	00000097          	auipc	ra,0x0
  d2:	f32080e7          	jalr	-206(ra) # 0 <cat>
    exit(0);
  d6:	4501                	li	a0,0
  d8:	00000097          	auipc	ra,0x0
  dc:	536080e7          	jalr	1334(ra) # 60e <exit>
  }

  for(i = 1; i < argc; i++){
  e0:	4785                	li	a5,1
  e2:	fef42623          	sw	a5,-20(s0)
  e6:	a8bd                	j	164 <main+0xb8>
    if((fd = open(argv[i], 0)) < 0){
  e8:	fec42783          	lw	a5,-20(s0)
  ec:	078e                	slli	a5,a5,0x3
  ee:	fd043703          	ld	a4,-48(s0)
  f2:	97ba                	add	a5,a5,a4
  f4:	639c                	ld	a5,0(a5)
  f6:	4581                	li	a1,0
  f8:	853e                	mv	a0,a5
  fa:	00000097          	auipc	ra,0x0
  fe:	554080e7          	jalr	1364(ra) # 64e <open>
 102:	87aa                	mv	a5,a0
 104:	fef42423          	sw	a5,-24(s0)
 108:	fe842783          	lw	a5,-24(s0)
 10c:	2781                	sext.w	a5,a5
 10e:	0207d863          	bgez	a5,13e <main+0x92>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
 112:	fec42783          	lw	a5,-20(s0)
 116:	078e                	slli	a5,a5,0x3
 118:	fd043703          	ld	a4,-48(s0)
 11c:	97ba                	add	a5,a5,a4
 11e:	639c                	ld	a5,0(a5)
 120:	863e                	mv	a2,a5
 122:	00001597          	auipc	a1,0x1
 126:	d7e58593          	addi	a1,a1,-642 # ea0 <malloc+0x172>
 12a:	4509                	li	a0,2
 12c:	00001097          	auipc	ra,0x1
 130:	9b8080e7          	jalr	-1608(ra) # ae4 <fprintf>
      exit(1);
 134:	4505                	li	a0,1
 136:	00000097          	auipc	ra,0x0
 13a:	4d8080e7          	jalr	1240(ra) # 60e <exit>
    }
    cat(fd);
 13e:	fe842783          	lw	a5,-24(s0)
 142:	853e                	mv	a0,a5
 144:	00000097          	auipc	ra,0x0
 148:	ebc080e7          	jalr	-324(ra) # 0 <cat>
    close(fd);
 14c:	fe842783          	lw	a5,-24(s0)
 150:	853e                	mv	a0,a5
 152:	00000097          	auipc	ra,0x0
 156:	4e4080e7          	jalr	1252(ra) # 636 <close>
  for(i = 1; i < argc; i++){
 15a:	fec42783          	lw	a5,-20(s0)
 15e:	2785                	addiw	a5,a5,1
 160:	fef42623          	sw	a5,-20(s0)
 164:	fec42703          	lw	a4,-20(s0)
 168:	fdc42783          	lw	a5,-36(s0)
 16c:	2701                	sext.w	a4,a4
 16e:	2781                	sext.w	a5,a5
 170:	f6f74ce3          	blt	a4,a5,e8 <main+0x3c>
  }
  exit(0);
 174:	4501                	li	a0,0
 176:	00000097          	auipc	ra,0x0
 17a:	498080e7          	jalr	1176(ra) # 60e <exit>

000000000000017e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 17e:	7179                	addi	sp,sp,-48
 180:	f422                	sd	s0,40(sp)
 182:	1800                	addi	s0,sp,48
 184:	fca43c23          	sd	a0,-40(s0)
 188:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 18c:	fd843783          	ld	a5,-40(s0)
 190:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 194:	0001                	nop
 196:	fd043703          	ld	a4,-48(s0)
 19a:	00170793          	addi	a5,a4,1
 19e:	fcf43823          	sd	a5,-48(s0)
 1a2:	fd843783          	ld	a5,-40(s0)
 1a6:	00178693          	addi	a3,a5,1
 1aa:	fcd43c23          	sd	a3,-40(s0)
 1ae:	00074703          	lbu	a4,0(a4)
 1b2:	00e78023          	sb	a4,0(a5)
 1b6:	0007c783          	lbu	a5,0(a5)
 1ba:	fff1                	bnez	a5,196 <strcpy+0x18>
    ;
  return os;
 1bc:	fe843783          	ld	a5,-24(s0)
}
 1c0:	853e                	mv	a0,a5
 1c2:	7422                	ld	s0,40(sp)
 1c4:	6145                	addi	sp,sp,48
 1c6:	8082                	ret

00000000000001c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c8:	1101                	addi	sp,sp,-32
 1ca:	ec22                	sd	s0,24(sp)
 1cc:	1000                	addi	s0,sp,32
 1ce:	fea43423          	sd	a0,-24(s0)
 1d2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 1d6:	a819                	j	1ec <strcmp+0x24>
    p++, q++;
 1d8:	fe843783          	ld	a5,-24(s0)
 1dc:	0785                	addi	a5,a5,1
 1de:	fef43423          	sd	a5,-24(s0)
 1e2:	fe043783          	ld	a5,-32(s0)
 1e6:	0785                	addi	a5,a5,1
 1e8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 1ec:	fe843783          	ld	a5,-24(s0)
 1f0:	0007c783          	lbu	a5,0(a5)
 1f4:	cb99                	beqz	a5,20a <strcmp+0x42>
 1f6:	fe843783          	ld	a5,-24(s0)
 1fa:	0007c703          	lbu	a4,0(a5)
 1fe:	fe043783          	ld	a5,-32(s0)
 202:	0007c783          	lbu	a5,0(a5)
 206:	fcf709e3          	beq	a4,a5,1d8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 20a:	fe843783          	ld	a5,-24(s0)
 20e:	0007c783          	lbu	a5,0(a5)
 212:	0007871b          	sext.w	a4,a5
 216:	fe043783          	ld	a5,-32(s0)
 21a:	0007c783          	lbu	a5,0(a5)
 21e:	2781                	sext.w	a5,a5
 220:	40f707bb          	subw	a5,a4,a5
 224:	2781                	sext.w	a5,a5
}
 226:	853e                	mv	a0,a5
 228:	6462                	ld	s0,24(sp)
 22a:	6105                	addi	sp,sp,32
 22c:	8082                	ret

000000000000022e <strlen>:

uint
strlen(const char *s)
{
 22e:	7179                	addi	sp,sp,-48
 230:	f422                	sd	s0,40(sp)
 232:	1800                	addi	s0,sp,48
 234:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 238:	fe042623          	sw	zero,-20(s0)
 23c:	a031                	j	248 <strlen+0x1a>
 23e:	fec42783          	lw	a5,-20(s0)
 242:	2785                	addiw	a5,a5,1
 244:	fef42623          	sw	a5,-20(s0)
 248:	fec42783          	lw	a5,-20(s0)
 24c:	fd843703          	ld	a4,-40(s0)
 250:	97ba                	add	a5,a5,a4
 252:	0007c783          	lbu	a5,0(a5)
 256:	f7e5                	bnez	a5,23e <strlen+0x10>
    ;
  return n;
 258:	fec42783          	lw	a5,-20(s0)
}
 25c:	853e                	mv	a0,a5
 25e:	7422                	ld	s0,40(sp)
 260:	6145                	addi	sp,sp,48
 262:	8082                	ret

0000000000000264 <memset>:

void*
memset(void *dst, int c, uint n)
{
 264:	7179                	addi	sp,sp,-48
 266:	f422                	sd	s0,40(sp)
 268:	1800                	addi	s0,sp,48
 26a:	fca43c23          	sd	a0,-40(s0)
 26e:	87ae                	mv	a5,a1
 270:	8732                	mv	a4,a2
 272:	fcf42a23          	sw	a5,-44(s0)
 276:	87ba                	mv	a5,a4
 278:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 27c:	fd843783          	ld	a5,-40(s0)
 280:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 284:	fe042623          	sw	zero,-20(s0)
 288:	a00d                	j	2aa <memset+0x46>
    cdst[i] = c;
 28a:	fec42783          	lw	a5,-20(s0)
 28e:	fe043703          	ld	a4,-32(s0)
 292:	97ba                	add	a5,a5,a4
 294:	fd442703          	lw	a4,-44(s0)
 298:	0ff77713          	andi	a4,a4,255
 29c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 2a0:	fec42783          	lw	a5,-20(s0)
 2a4:	2785                	addiw	a5,a5,1
 2a6:	fef42623          	sw	a5,-20(s0)
 2aa:	fec42703          	lw	a4,-20(s0)
 2ae:	fd042783          	lw	a5,-48(s0)
 2b2:	2781                	sext.w	a5,a5
 2b4:	fcf76be3          	bltu	a4,a5,28a <memset+0x26>
  }
  return dst;
 2b8:	fd843783          	ld	a5,-40(s0)
}
 2bc:	853e                	mv	a0,a5
 2be:	7422                	ld	s0,40(sp)
 2c0:	6145                	addi	sp,sp,48
 2c2:	8082                	ret

00000000000002c4 <strchr>:

char*
strchr(const char *s, char c)
{
 2c4:	1101                	addi	sp,sp,-32
 2c6:	ec22                	sd	s0,24(sp)
 2c8:	1000                	addi	s0,sp,32
 2ca:	fea43423          	sd	a0,-24(s0)
 2ce:	87ae                	mv	a5,a1
 2d0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 2d4:	a01d                	j	2fa <strchr+0x36>
    if(*s == c)
 2d6:	fe843783          	ld	a5,-24(s0)
 2da:	0007c703          	lbu	a4,0(a5)
 2de:	fe744783          	lbu	a5,-25(s0)
 2e2:	0ff7f793          	andi	a5,a5,255
 2e6:	00e79563          	bne	a5,a4,2f0 <strchr+0x2c>
      return (char*)s;
 2ea:	fe843783          	ld	a5,-24(s0)
 2ee:	a821                	j	306 <strchr+0x42>
  for(; *s; s++)
 2f0:	fe843783          	ld	a5,-24(s0)
 2f4:	0785                	addi	a5,a5,1
 2f6:	fef43423          	sd	a5,-24(s0)
 2fa:	fe843783          	ld	a5,-24(s0)
 2fe:	0007c783          	lbu	a5,0(a5)
 302:	fbf1                	bnez	a5,2d6 <strchr+0x12>
  return 0;
 304:	4781                	li	a5,0
}
 306:	853e                	mv	a0,a5
 308:	6462                	ld	s0,24(sp)
 30a:	6105                	addi	sp,sp,32
 30c:	8082                	ret

000000000000030e <gets>:

char*
gets(char *buf, int max)
{
 30e:	7179                	addi	sp,sp,-48
 310:	f406                	sd	ra,40(sp)
 312:	f022                	sd	s0,32(sp)
 314:	1800                	addi	s0,sp,48
 316:	fca43c23          	sd	a0,-40(s0)
 31a:	87ae                	mv	a5,a1
 31c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 320:	fe042623          	sw	zero,-20(s0)
 324:	a8a1                	j	37c <gets+0x6e>
    cc = read(0, &c, 1);
 326:	fe740793          	addi	a5,s0,-25
 32a:	4605                	li	a2,1
 32c:	85be                	mv	a1,a5
 32e:	4501                	li	a0,0
 330:	00000097          	auipc	ra,0x0
 334:	2f6080e7          	jalr	758(ra) # 626 <read>
 338:	87aa                	mv	a5,a0
 33a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 33e:	fe842783          	lw	a5,-24(s0)
 342:	2781                	sext.w	a5,a5
 344:	04f05763          	blez	a5,392 <gets+0x84>
      break;
    buf[i++] = c;
 348:	fec42783          	lw	a5,-20(s0)
 34c:	0017871b          	addiw	a4,a5,1
 350:	fee42623          	sw	a4,-20(s0)
 354:	873e                	mv	a4,a5
 356:	fd843783          	ld	a5,-40(s0)
 35a:	97ba                	add	a5,a5,a4
 35c:	fe744703          	lbu	a4,-25(s0)
 360:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 364:	fe744783          	lbu	a5,-25(s0)
 368:	873e                	mv	a4,a5
 36a:	47a9                	li	a5,10
 36c:	02f70463          	beq	a4,a5,394 <gets+0x86>
 370:	fe744783          	lbu	a5,-25(s0)
 374:	873e                	mv	a4,a5
 376:	47b5                	li	a5,13
 378:	00f70e63          	beq	a4,a5,394 <gets+0x86>
  for(i=0; i+1 < max; ){
 37c:	fec42783          	lw	a5,-20(s0)
 380:	2785                	addiw	a5,a5,1
 382:	0007871b          	sext.w	a4,a5
 386:	fd442783          	lw	a5,-44(s0)
 38a:	2781                	sext.w	a5,a5
 38c:	f8f74de3          	blt	a4,a5,326 <gets+0x18>
 390:	a011                	j	394 <gets+0x86>
      break;
 392:	0001                	nop
      break;
  }
  buf[i] = '\0';
 394:	fec42783          	lw	a5,-20(s0)
 398:	fd843703          	ld	a4,-40(s0)
 39c:	97ba                	add	a5,a5,a4
 39e:	00078023          	sb	zero,0(a5)
  return buf;
 3a2:	fd843783          	ld	a5,-40(s0)
}
 3a6:	853e                	mv	a0,a5
 3a8:	70a2                	ld	ra,40(sp)
 3aa:	7402                	ld	s0,32(sp)
 3ac:	6145                	addi	sp,sp,48
 3ae:	8082                	ret

00000000000003b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b0:	7179                	addi	sp,sp,-48
 3b2:	f406                	sd	ra,40(sp)
 3b4:	f022                	sd	s0,32(sp)
 3b6:	1800                	addi	s0,sp,48
 3b8:	fca43c23          	sd	a0,-40(s0)
 3bc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c0:	4581                	li	a1,0
 3c2:	fd843503          	ld	a0,-40(s0)
 3c6:	00000097          	auipc	ra,0x0
 3ca:	288080e7          	jalr	648(ra) # 64e <open>
 3ce:	87aa                	mv	a5,a0
 3d0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 3d4:	fec42783          	lw	a5,-20(s0)
 3d8:	2781                	sext.w	a5,a5
 3da:	0007d463          	bgez	a5,3e2 <stat+0x32>
    return -1;
 3de:	57fd                	li	a5,-1
 3e0:	a035                	j	40c <stat+0x5c>
  r = fstat(fd, st);
 3e2:	fec42783          	lw	a5,-20(s0)
 3e6:	fd043583          	ld	a1,-48(s0)
 3ea:	853e                	mv	a0,a5
 3ec:	00000097          	auipc	ra,0x0
 3f0:	27a080e7          	jalr	634(ra) # 666 <fstat>
 3f4:	87aa                	mv	a5,a0
 3f6:	fef42423          	sw	a5,-24(s0)
  close(fd);
 3fa:	fec42783          	lw	a5,-20(s0)
 3fe:	853e                	mv	a0,a5
 400:	00000097          	auipc	ra,0x0
 404:	236080e7          	jalr	566(ra) # 636 <close>
  return r;
 408:	fe842783          	lw	a5,-24(s0)
}
 40c:	853e                	mv	a0,a5
 40e:	70a2                	ld	ra,40(sp)
 410:	7402                	ld	s0,32(sp)
 412:	6145                	addi	sp,sp,48
 414:	8082                	ret

0000000000000416 <atoi>:

int
atoi(const char *s)
{
 416:	7179                	addi	sp,sp,-48
 418:	f422                	sd	s0,40(sp)
 41a:	1800                	addi	s0,sp,48
 41c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 420:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 424:	a815                	j	458 <atoi+0x42>
    n = n*10 + *s++ - '0';
 426:	fec42703          	lw	a4,-20(s0)
 42a:	87ba                	mv	a5,a4
 42c:	0027979b          	slliw	a5,a5,0x2
 430:	9fb9                	addw	a5,a5,a4
 432:	0017979b          	slliw	a5,a5,0x1
 436:	0007871b          	sext.w	a4,a5
 43a:	fd843783          	ld	a5,-40(s0)
 43e:	00178693          	addi	a3,a5,1
 442:	fcd43c23          	sd	a3,-40(s0)
 446:	0007c783          	lbu	a5,0(a5)
 44a:	2781                	sext.w	a5,a5
 44c:	9fb9                	addw	a5,a5,a4
 44e:	2781                	sext.w	a5,a5
 450:	fd07879b          	addiw	a5,a5,-48
 454:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 458:	fd843783          	ld	a5,-40(s0)
 45c:	0007c783          	lbu	a5,0(a5)
 460:	873e                	mv	a4,a5
 462:	02f00793          	li	a5,47
 466:	00e7fb63          	bgeu	a5,a4,47c <atoi+0x66>
 46a:	fd843783          	ld	a5,-40(s0)
 46e:	0007c783          	lbu	a5,0(a5)
 472:	873e                	mv	a4,a5
 474:	03900793          	li	a5,57
 478:	fae7f7e3          	bgeu	a5,a4,426 <atoi+0x10>
  return n;
 47c:	fec42783          	lw	a5,-20(s0)
}
 480:	853e                	mv	a0,a5
 482:	7422                	ld	s0,40(sp)
 484:	6145                	addi	sp,sp,48
 486:	8082                	ret

0000000000000488 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 488:	7139                	addi	sp,sp,-64
 48a:	fc22                	sd	s0,56(sp)
 48c:	0080                	addi	s0,sp,64
 48e:	fca43c23          	sd	a0,-40(s0)
 492:	fcb43823          	sd	a1,-48(s0)
 496:	87b2                	mv	a5,a2
 498:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 49c:	fd843783          	ld	a5,-40(s0)
 4a0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 4a4:	fd043783          	ld	a5,-48(s0)
 4a8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 4ac:	fe043703          	ld	a4,-32(s0)
 4b0:	fe843783          	ld	a5,-24(s0)
 4b4:	02e7fc63          	bgeu	a5,a4,4ec <memmove+0x64>
    while(n-- > 0)
 4b8:	a00d                	j	4da <memmove+0x52>
      *dst++ = *src++;
 4ba:	fe043703          	ld	a4,-32(s0)
 4be:	00170793          	addi	a5,a4,1
 4c2:	fef43023          	sd	a5,-32(s0)
 4c6:	fe843783          	ld	a5,-24(s0)
 4ca:	00178693          	addi	a3,a5,1
 4ce:	fed43423          	sd	a3,-24(s0)
 4d2:	00074703          	lbu	a4,0(a4)
 4d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4da:	fcc42783          	lw	a5,-52(s0)
 4de:	fff7871b          	addiw	a4,a5,-1
 4e2:	fce42623          	sw	a4,-52(s0)
 4e6:	fcf04ae3          	bgtz	a5,4ba <memmove+0x32>
 4ea:	a891                	j	53e <memmove+0xb6>
  } else {
    dst += n;
 4ec:	fcc42783          	lw	a5,-52(s0)
 4f0:	fe843703          	ld	a4,-24(s0)
 4f4:	97ba                	add	a5,a5,a4
 4f6:	fef43423          	sd	a5,-24(s0)
    src += n;
 4fa:	fcc42783          	lw	a5,-52(s0)
 4fe:	fe043703          	ld	a4,-32(s0)
 502:	97ba                	add	a5,a5,a4
 504:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 508:	a01d                	j	52e <memmove+0xa6>
      *--dst = *--src;
 50a:	fe043783          	ld	a5,-32(s0)
 50e:	17fd                	addi	a5,a5,-1
 510:	fef43023          	sd	a5,-32(s0)
 514:	fe843783          	ld	a5,-24(s0)
 518:	17fd                	addi	a5,a5,-1
 51a:	fef43423          	sd	a5,-24(s0)
 51e:	fe043783          	ld	a5,-32(s0)
 522:	0007c703          	lbu	a4,0(a5)
 526:	fe843783          	ld	a5,-24(s0)
 52a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 52e:	fcc42783          	lw	a5,-52(s0)
 532:	fff7871b          	addiw	a4,a5,-1
 536:	fce42623          	sw	a4,-52(s0)
 53a:	fcf048e3          	bgtz	a5,50a <memmove+0x82>
  }
  return vdst;
 53e:	fd843783          	ld	a5,-40(s0)
}
 542:	853e                	mv	a0,a5
 544:	7462                	ld	s0,56(sp)
 546:	6121                	addi	sp,sp,64
 548:	8082                	ret

000000000000054a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 54a:	7139                	addi	sp,sp,-64
 54c:	fc22                	sd	s0,56(sp)
 54e:	0080                	addi	s0,sp,64
 550:	fca43c23          	sd	a0,-40(s0)
 554:	fcb43823          	sd	a1,-48(s0)
 558:	87b2                	mv	a5,a2
 55a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 55e:	fd843783          	ld	a5,-40(s0)
 562:	fef43423          	sd	a5,-24(s0)
 566:	fd043783          	ld	a5,-48(s0)
 56a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 56e:	a0a1                	j	5b6 <memcmp+0x6c>
    if (*p1 != *p2) {
 570:	fe843783          	ld	a5,-24(s0)
 574:	0007c703          	lbu	a4,0(a5)
 578:	fe043783          	ld	a5,-32(s0)
 57c:	0007c783          	lbu	a5,0(a5)
 580:	02f70163          	beq	a4,a5,5a2 <memcmp+0x58>
      return *p1 - *p2;
 584:	fe843783          	ld	a5,-24(s0)
 588:	0007c783          	lbu	a5,0(a5)
 58c:	0007871b          	sext.w	a4,a5
 590:	fe043783          	ld	a5,-32(s0)
 594:	0007c783          	lbu	a5,0(a5)
 598:	2781                	sext.w	a5,a5
 59a:	40f707bb          	subw	a5,a4,a5
 59e:	2781                	sext.w	a5,a5
 5a0:	a01d                	j	5c6 <memcmp+0x7c>
    }
    p1++;
 5a2:	fe843783          	ld	a5,-24(s0)
 5a6:	0785                	addi	a5,a5,1
 5a8:	fef43423          	sd	a5,-24(s0)
    p2++;
 5ac:	fe043783          	ld	a5,-32(s0)
 5b0:	0785                	addi	a5,a5,1
 5b2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 5b6:	fcc42783          	lw	a5,-52(s0)
 5ba:	fff7871b          	addiw	a4,a5,-1
 5be:	fce42623          	sw	a4,-52(s0)
 5c2:	f7dd                	bnez	a5,570 <memcmp+0x26>
  }
  return 0;
 5c4:	4781                	li	a5,0
}
 5c6:	853e                	mv	a0,a5
 5c8:	7462                	ld	s0,56(sp)
 5ca:	6121                	addi	sp,sp,64
 5cc:	8082                	ret

00000000000005ce <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5ce:	7179                	addi	sp,sp,-48
 5d0:	f406                	sd	ra,40(sp)
 5d2:	f022                	sd	s0,32(sp)
 5d4:	1800                	addi	s0,sp,48
 5d6:	fea43423          	sd	a0,-24(s0)
 5da:	feb43023          	sd	a1,-32(s0)
 5de:	87b2                	mv	a5,a2
 5e0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 5e4:	fdc42783          	lw	a5,-36(s0)
 5e8:	863e                	mv	a2,a5
 5ea:	fe043583          	ld	a1,-32(s0)
 5ee:	fe843503          	ld	a0,-24(s0)
 5f2:	00000097          	auipc	ra,0x0
 5f6:	e96080e7          	jalr	-362(ra) # 488 <memmove>
 5fa:	87aa                	mv	a5,a0
}
 5fc:	853e                	mv	a0,a5
 5fe:	70a2                	ld	ra,40(sp)
 600:	7402                	ld	s0,32(sp)
 602:	6145                	addi	sp,sp,48
 604:	8082                	ret

0000000000000606 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 606:	4885                	li	a7,1
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <exit>:
.global exit
exit:
 li a7, SYS_exit
 60e:	4889                	li	a7,2
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <wait>:
.global wait
wait:
 li a7, SYS_wait
 616:	488d                	li	a7,3
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 61e:	4891                	li	a7,4
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <read>:
.global read
read:
 li a7, SYS_read
 626:	4895                	li	a7,5
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <write>:
.global write
write:
 li a7, SYS_write
 62e:	48c1                	li	a7,16
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <close>:
.global close
close:
 li a7, SYS_close
 636:	48d5                	li	a7,21
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <kill>:
.global kill
kill:
 li a7, SYS_kill
 63e:	4899                	li	a7,6
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <exec>:
.global exec
exec:
 li a7, SYS_exec
 646:	489d                	li	a7,7
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <open>:
.global open
open:
 li a7, SYS_open
 64e:	48bd                	li	a7,15
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 656:	48c5                	li	a7,17
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 65e:	48c9                	li	a7,18
 ecall
 660:	00000073          	ecall
 ret
 664:	8082                	ret

0000000000000666 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 666:	48a1                	li	a7,8
 ecall
 668:	00000073          	ecall
 ret
 66c:	8082                	ret

000000000000066e <link>:
.global link
link:
 li a7, SYS_link
 66e:	48cd                	li	a7,19
 ecall
 670:	00000073          	ecall
 ret
 674:	8082                	ret

0000000000000676 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 676:	48d1                	li	a7,20
 ecall
 678:	00000073          	ecall
 ret
 67c:	8082                	ret

000000000000067e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 67e:	48a5                	li	a7,9
 ecall
 680:	00000073          	ecall
 ret
 684:	8082                	ret

0000000000000686 <dup>:
.global dup
dup:
 li a7, SYS_dup
 686:	48a9                	li	a7,10
 ecall
 688:	00000073          	ecall
 ret
 68c:	8082                	ret

000000000000068e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 68e:	48ad                	li	a7,11
 ecall
 690:	00000073          	ecall
 ret
 694:	8082                	ret

0000000000000696 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 696:	48b1                	li	a7,12
 ecall
 698:	00000073          	ecall
 ret
 69c:	8082                	ret

000000000000069e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 69e:	48b5                	li	a7,13
 ecall
 6a0:	00000073          	ecall
 ret
 6a4:	8082                	ret

00000000000006a6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 6a6:	48b9                	li	a7,14
 ecall
 6a8:	00000073          	ecall
 ret
 6ac:	8082                	ret

00000000000006ae <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 6ae:	1101                	addi	sp,sp,-32
 6b0:	ec06                	sd	ra,24(sp)
 6b2:	e822                	sd	s0,16(sp)
 6b4:	1000                	addi	s0,sp,32
 6b6:	87aa                	mv	a5,a0
 6b8:	872e                	mv	a4,a1
 6ba:	fef42623          	sw	a5,-20(s0)
 6be:	87ba                	mv	a5,a4
 6c0:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 6c4:	feb40713          	addi	a4,s0,-21
 6c8:	fec42783          	lw	a5,-20(s0)
 6cc:	4605                	li	a2,1
 6ce:	85ba                	mv	a1,a4
 6d0:	853e                	mv	a0,a5
 6d2:	00000097          	auipc	ra,0x0
 6d6:	f5c080e7          	jalr	-164(ra) # 62e <write>
}
 6da:	0001                	nop
 6dc:	60e2                	ld	ra,24(sp)
 6de:	6442                	ld	s0,16(sp)
 6e0:	6105                	addi	sp,sp,32
 6e2:	8082                	ret

00000000000006e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6e4:	7139                	addi	sp,sp,-64
 6e6:	fc06                	sd	ra,56(sp)
 6e8:	f822                	sd	s0,48(sp)
 6ea:	0080                	addi	s0,sp,64
 6ec:	87aa                	mv	a5,a0
 6ee:	8736                	mv	a4,a3
 6f0:	fcf42623          	sw	a5,-52(s0)
 6f4:	87ae                	mv	a5,a1
 6f6:	fcf42423          	sw	a5,-56(s0)
 6fa:	87b2                	mv	a5,a2
 6fc:	fcf42223          	sw	a5,-60(s0)
 700:	87ba                	mv	a5,a4
 702:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 706:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 70a:	fc042783          	lw	a5,-64(s0)
 70e:	2781                	sext.w	a5,a5
 710:	c38d                	beqz	a5,732 <printint+0x4e>
 712:	fc842783          	lw	a5,-56(s0)
 716:	2781                	sext.w	a5,a5
 718:	0007dd63          	bgez	a5,732 <printint+0x4e>
    neg = 1;
 71c:	4785                	li	a5,1
 71e:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 722:	fc842783          	lw	a5,-56(s0)
 726:	40f007bb          	negw	a5,a5
 72a:	2781                	sext.w	a5,a5
 72c:	fef42223          	sw	a5,-28(s0)
 730:	a029                	j	73a <printint+0x56>
  } else {
    x = xx;
 732:	fc842783          	lw	a5,-56(s0)
 736:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 73a:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 73e:	fc442783          	lw	a5,-60(s0)
 742:	fe442703          	lw	a4,-28(s0)
 746:	02f777bb          	remuw	a5,a4,a5
 74a:	0007861b          	sext.w	a2,a5
 74e:	fec42783          	lw	a5,-20(s0)
 752:	0017871b          	addiw	a4,a5,1
 756:	fee42623          	sw	a4,-20(s0)
 75a:	00000697          	auipc	a3,0x0
 75e:	76668693          	addi	a3,a3,1894 # ec0 <digits>
 762:	02061713          	slli	a4,a2,0x20
 766:	9301                	srli	a4,a4,0x20
 768:	9736                	add	a4,a4,a3
 76a:	00074703          	lbu	a4,0(a4)
 76e:	ff040693          	addi	a3,s0,-16
 772:	97b6                	add	a5,a5,a3
 774:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 778:	fc442783          	lw	a5,-60(s0)
 77c:	fe442703          	lw	a4,-28(s0)
 780:	02f757bb          	divuw	a5,a4,a5
 784:	fef42223          	sw	a5,-28(s0)
 788:	fe442783          	lw	a5,-28(s0)
 78c:	2781                	sext.w	a5,a5
 78e:	fbc5                	bnez	a5,73e <printint+0x5a>
  if(neg)
 790:	fe842783          	lw	a5,-24(s0)
 794:	2781                	sext.w	a5,a5
 796:	cf95                	beqz	a5,7d2 <printint+0xee>
    buf[i++] = '-';
 798:	fec42783          	lw	a5,-20(s0)
 79c:	0017871b          	addiw	a4,a5,1
 7a0:	fee42623          	sw	a4,-20(s0)
 7a4:	ff040713          	addi	a4,s0,-16
 7a8:	97ba                	add	a5,a5,a4
 7aa:	02d00713          	li	a4,45
 7ae:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 7b2:	a005                	j	7d2 <printint+0xee>
    putc(fd, buf[i]);
 7b4:	fec42783          	lw	a5,-20(s0)
 7b8:	ff040713          	addi	a4,s0,-16
 7bc:	97ba                	add	a5,a5,a4
 7be:	fe07c703          	lbu	a4,-32(a5)
 7c2:	fcc42783          	lw	a5,-52(s0)
 7c6:	85ba                	mv	a1,a4
 7c8:	853e                	mv	a0,a5
 7ca:	00000097          	auipc	ra,0x0
 7ce:	ee4080e7          	jalr	-284(ra) # 6ae <putc>
  while(--i >= 0)
 7d2:	fec42783          	lw	a5,-20(s0)
 7d6:	37fd                	addiw	a5,a5,-1
 7d8:	fef42623          	sw	a5,-20(s0)
 7dc:	fec42783          	lw	a5,-20(s0)
 7e0:	2781                	sext.w	a5,a5
 7e2:	fc07d9e3          	bgez	a5,7b4 <printint+0xd0>
}
 7e6:	0001                	nop
 7e8:	0001                	nop
 7ea:	70e2                	ld	ra,56(sp)
 7ec:	7442                	ld	s0,48(sp)
 7ee:	6121                	addi	sp,sp,64
 7f0:	8082                	ret

00000000000007f2 <printptr>:

static void
printptr(int fd, uint64 x) {
 7f2:	7179                	addi	sp,sp,-48
 7f4:	f406                	sd	ra,40(sp)
 7f6:	f022                	sd	s0,32(sp)
 7f8:	1800                	addi	s0,sp,48
 7fa:	87aa                	mv	a5,a0
 7fc:	fcb43823          	sd	a1,-48(s0)
 800:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 804:	fdc42783          	lw	a5,-36(s0)
 808:	03000593          	li	a1,48
 80c:	853e                	mv	a0,a5
 80e:	00000097          	auipc	ra,0x0
 812:	ea0080e7          	jalr	-352(ra) # 6ae <putc>
  putc(fd, 'x');
 816:	fdc42783          	lw	a5,-36(s0)
 81a:	07800593          	li	a1,120
 81e:	853e                	mv	a0,a5
 820:	00000097          	auipc	ra,0x0
 824:	e8e080e7          	jalr	-370(ra) # 6ae <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 828:	fe042623          	sw	zero,-20(s0)
 82c:	a82d                	j	866 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 82e:	fd043783          	ld	a5,-48(s0)
 832:	93f1                	srli	a5,a5,0x3c
 834:	00000717          	auipc	a4,0x0
 838:	68c70713          	addi	a4,a4,1676 # ec0 <digits>
 83c:	97ba                	add	a5,a5,a4
 83e:	0007c703          	lbu	a4,0(a5)
 842:	fdc42783          	lw	a5,-36(s0)
 846:	85ba                	mv	a1,a4
 848:	853e                	mv	a0,a5
 84a:	00000097          	auipc	ra,0x0
 84e:	e64080e7          	jalr	-412(ra) # 6ae <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 852:	fec42783          	lw	a5,-20(s0)
 856:	2785                	addiw	a5,a5,1
 858:	fef42623          	sw	a5,-20(s0)
 85c:	fd043783          	ld	a5,-48(s0)
 860:	0792                	slli	a5,a5,0x4
 862:	fcf43823          	sd	a5,-48(s0)
 866:	fec42783          	lw	a5,-20(s0)
 86a:	873e                	mv	a4,a5
 86c:	47bd                	li	a5,15
 86e:	fce7f0e3          	bgeu	a5,a4,82e <printptr+0x3c>
}
 872:	0001                	nop
 874:	0001                	nop
 876:	70a2                	ld	ra,40(sp)
 878:	7402                	ld	s0,32(sp)
 87a:	6145                	addi	sp,sp,48
 87c:	8082                	ret

000000000000087e <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 87e:	715d                	addi	sp,sp,-80
 880:	e486                	sd	ra,72(sp)
 882:	e0a2                	sd	s0,64(sp)
 884:	0880                	addi	s0,sp,80
 886:	87aa                	mv	a5,a0
 888:	fcb43023          	sd	a1,-64(s0)
 88c:	fac43c23          	sd	a2,-72(s0)
 890:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 894:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 898:	fe042223          	sw	zero,-28(s0)
 89c:	a42d                	j	ac6 <vprintf+0x248>
    c = fmt[i] & 0xff;
 89e:	fe442783          	lw	a5,-28(s0)
 8a2:	fc043703          	ld	a4,-64(s0)
 8a6:	97ba                	add	a5,a5,a4
 8a8:	0007c783          	lbu	a5,0(a5)
 8ac:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 8b0:	fe042783          	lw	a5,-32(s0)
 8b4:	2781                	sext.w	a5,a5
 8b6:	eb9d                	bnez	a5,8ec <vprintf+0x6e>
      if(c == '%'){
 8b8:	fdc42783          	lw	a5,-36(s0)
 8bc:	0007871b          	sext.w	a4,a5
 8c0:	02500793          	li	a5,37
 8c4:	00f71763          	bne	a4,a5,8d2 <vprintf+0x54>
        state = '%';
 8c8:	02500793          	li	a5,37
 8cc:	fef42023          	sw	a5,-32(s0)
 8d0:	a2f5                	j	abc <vprintf+0x23e>
      } else {
        putc(fd, c);
 8d2:	fdc42783          	lw	a5,-36(s0)
 8d6:	0ff7f713          	andi	a4,a5,255
 8da:	fcc42783          	lw	a5,-52(s0)
 8de:	85ba                	mv	a1,a4
 8e0:	853e                	mv	a0,a5
 8e2:	00000097          	auipc	ra,0x0
 8e6:	dcc080e7          	jalr	-564(ra) # 6ae <putc>
 8ea:	aac9                	j	abc <vprintf+0x23e>
      }
    } else if(state == '%'){
 8ec:	fe042783          	lw	a5,-32(s0)
 8f0:	0007871b          	sext.w	a4,a5
 8f4:	02500793          	li	a5,37
 8f8:	1cf71263          	bne	a4,a5,abc <vprintf+0x23e>
      if(c == 'd'){
 8fc:	fdc42783          	lw	a5,-36(s0)
 900:	0007871b          	sext.w	a4,a5
 904:	06400793          	li	a5,100
 908:	02f71463          	bne	a4,a5,930 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 90c:	fb843783          	ld	a5,-72(s0)
 910:	00878713          	addi	a4,a5,8
 914:	fae43c23          	sd	a4,-72(s0)
 918:	4398                	lw	a4,0(a5)
 91a:	fcc42783          	lw	a5,-52(s0)
 91e:	4685                	li	a3,1
 920:	4629                	li	a2,10
 922:	85ba                	mv	a1,a4
 924:	853e                	mv	a0,a5
 926:	00000097          	auipc	ra,0x0
 92a:	dbe080e7          	jalr	-578(ra) # 6e4 <printint>
 92e:	a269                	j	ab8 <vprintf+0x23a>
      } else if(c == 'l') {
 930:	fdc42783          	lw	a5,-36(s0)
 934:	0007871b          	sext.w	a4,a5
 938:	06c00793          	li	a5,108
 93c:	02f71663          	bne	a4,a5,968 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 940:	fb843783          	ld	a5,-72(s0)
 944:	00878713          	addi	a4,a5,8
 948:	fae43c23          	sd	a4,-72(s0)
 94c:	639c                	ld	a5,0(a5)
 94e:	0007871b          	sext.w	a4,a5
 952:	fcc42783          	lw	a5,-52(s0)
 956:	4681                	li	a3,0
 958:	4629                	li	a2,10
 95a:	85ba                	mv	a1,a4
 95c:	853e                	mv	a0,a5
 95e:	00000097          	auipc	ra,0x0
 962:	d86080e7          	jalr	-634(ra) # 6e4 <printint>
 966:	aa89                	j	ab8 <vprintf+0x23a>
      } else if(c == 'x') {
 968:	fdc42783          	lw	a5,-36(s0)
 96c:	0007871b          	sext.w	a4,a5
 970:	07800793          	li	a5,120
 974:	02f71463          	bne	a4,a5,99c <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 978:	fb843783          	ld	a5,-72(s0)
 97c:	00878713          	addi	a4,a5,8
 980:	fae43c23          	sd	a4,-72(s0)
 984:	4398                	lw	a4,0(a5)
 986:	fcc42783          	lw	a5,-52(s0)
 98a:	4681                	li	a3,0
 98c:	4641                	li	a2,16
 98e:	85ba                	mv	a1,a4
 990:	853e                	mv	a0,a5
 992:	00000097          	auipc	ra,0x0
 996:	d52080e7          	jalr	-686(ra) # 6e4 <printint>
 99a:	aa39                	j	ab8 <vprintf+0x23a>
      } else if(c == 'p') {
 99c:	fdc42783          	lw	a5,-36(s0)
 9a0:	0007871b          	sext.w	a4,a5
 9a4:	07000793          	li	a5,112
 9a8:	02f71263          	bne	a4,a5,9cc <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 9ac:	fb843783          	ld	a5,-72(s0)
 9b0:	00878713          	addi	a4,a5,8
 9b4:	fae43c23          	sd	a4,-72(s0)
 9b8:	6398                	ld	a4,0(a5)
 9ba:	fcc42783          	lw	a5,-52(s0)
 9be:	85ba                	mv	a1,a4
 9c0:	853e                	mv	a0,a5
 9c2:	00000097          	auipc	ra,0x0
 9c6:	e30080e7          	jalr	-464(ra) # 7f2 <printptr>
 9ca:	a0fd                	j	ab8 <vprintf+0x23a>
      } else if(c == 's'){
 9cc:	fdc42783          	lw	a5,-36(s0)
 9d0:	0007871b          	sext.w	a4,a5
 9d4:	07300793          	li	a5,115
 9d8:	04f71c63          	bne	a4,a5,a30 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 9dc:	fb843783          	ld	a5,-72(s0)
 9e0:	00878713          	addi	a4,a5,8
 9e4:	fae43c23          	sd	a4,-72(s0)
 9e8:	639c                	ld	a5,0(a5)
 9ea:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 9ee:	fe843783          	ld	a5,-24(s0)
 9f2:	eb8d                	bnez	a5,a24 <vprintf+0x1a6>
          s = "(null)";
 9f4:	00000797          	auipc	a5,0x0
 9f8:	4c478793          	addi	a5,a5,1220 # eb8 <malloc+0x18a>
 9fc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a00:	a015                	j	a24 <vprintf+0x1a6>
          putc(fd, *s);
 a02:	fe843783          	ld	a5,-24(s0)
 a06:	0007c703          	lbu	a4,0(a5)
 a0a:	fcc42783          	lw	a5,-52(s0)
 a0e:	85ba                	mv	a1,a4
 a10:	853e                	mv	a0,a5
 a12:	00000097          	auipc	ra,0x0
 a16:	c9c080e7          	jalr	-868(ra) # 6ae <putc>
          s++;
 a1a:	fe843783          	ld	a5,-24(s0)
 a1e:	0785                	addi	a5,a5,1
 a20:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a24:	fe843783          	ld	a5,-24(s0)
 a28:	0007c783          	lbu	a5,0(a5)
 a2c:	fbf9                	bnez	a5,a02 <vprintf+0x184>
 a2e:	a069                	j	ab8 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 a30:	fdc42783          	lw	a5,-36(s0)
 a34:	0007871b          	sext.w	a4,a5
 a38:	06300793          	li	a5,99
 a3c:	02f71463          	bne	a4,a5,a64 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 a40:	fb843783          	ld	a5,-72(s0)
 a44:	00878713          	addi	a4,a5,8
 a48:	fae43c23          	sd	a4,-72(s0)
 a4c:	439c                	lw	a5,0(a5)
 a4e:	0ff7f713          	andi	a4,a5,255
 a52:	fcc42783          	lw	a5,-52(s0)
 a56:	85ba                	mv	a1,a4
 a58:	853e                	mv	a0,a5
 a5a:	00000097          	auipc	ra,0x0
 a5e:	c54080e7          	jalr	-940(ra) # 6ae <putc>
 a62:	a899                	j	ab8 <vprintf+0x23a>
      } else if(c == '%'){
 a64:	fdc42783          	lw	a5,-36(s0)
 a68:	0007871b          	sext.w	a4,a5
 a6c:	02500793          	li	a5,37
 a70:	00f71f63          	bne	a4,a5,a8e <vprintf+0x210>
        putc(fd, c);
 a74:	fdc42783          	lw	a5,-36(s0)
 a78:	0ff7f713          	andi	a4,a5,255
 a7c:	fcc42783          	lw	a5,-52(s0)
 a80:	85ba                	mv	a1,a4
 a82:	853e                	mv	a0,a5
 a84:	00000097          	auipc	ra,0x0
 a88:	c2a080e7          	jalr	-982(ra) # 6ae <putc>
 a8c:	a035                	j	ab8 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a8e:	fcc42783          	lw	a5,-52(s0)
 a92:	02500593          	li	a1,37
 a96:	853e                	mv	a0,a5
 a98:	00000097          	auipc	ra,0x0
 a9c:	c16080e7          	jalr	-1002(ra) # 6ae <putc>
        putc(fd, c);
 aa0:	fdc42783          	lw	a5,-36(s0)
 aa4:	0ff7f713          	andi	a4,a5,255
 aa8:	fcc42783          	lw	a5,-52(s0)
 aac:	85ba                	mv	a1,a4
 aae:	853e                	mv	a0,a5
 ab0:	00000097          	auipc	ra,0x0
 ab4:	bfe080e7          	jalr	-1026(ra) # 6ae <putc>
      }
      state = 0;
 ab8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 abc:	fe442783          	lw	a5,-28(s0)
 ac0:	2785                	addiw	a5,a5,1
 ac2:	fef42223          	sw	a5,-28(s0)
 ac6:	fe442783          	lw	a5,-28(s0)
 aca:	fc043703          	ld	a4,-64(s0)
 ace:	97ba                	add	a5,a5,a4
 ad0:	0007c783          	lbu	a5,0(a5)
 ad4:	dc0795e3          	bnez	a5,89e <vprintf+0x20>
    }
  }
}
 ad8:	0001                	nop
 ada:	0001                	nop
 adc:	60a6                	ld	ra,72(sp)
 ade:	6406                	ld	s0,64(sp)
 ae0:	6161                	addi	sp,sp,80
 ae2:	8082                	ret

0000000000000ae4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 ae4:	7159                	addi	sp,sp,-112
 ae6:	fc06                	sd	ra,56(sp)
 ae8:	f822                	sd	s0,48(sp)
 aea:	0080                	addi	s0,sp,64
 aec:	fcb43823          	sd	a1,-48(s0)
 af0:	e010                	sd	a2,0(s0)
 af2:	e414                	sd	a3,8(s0)
 af4:	e818                	sd	a4,16(s0)
 af6:	ec1c                	sd	a5,24(s0)
 af8:	03043023          	sd	a6,32(s0)
 afc:	03143423          	sd	a7,40(s0)
 b00:	87aa                	mv	a5,a0
 b02:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 b06:	03040793          	addi	a5,s0,48
 b0a:	fcf43423          	sd	a5,-56(s0)
 b0e:	fc843783          	ld	a5,-56(s0)
 b12:	fd078793          	addi	a5,a5,-48
 b16:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 b1a:	fe843703          	ld	a4,-24(s0)
 b1e:	fdc42783          	lw	a5,-36(s0)
 b22:	863a                	mv	a2,a4
 b24:	fd043583          	ld	a1,-48(s0)
 b28:	853e                	mv	a0,a5
 b2a:	00000097          	auipc	ra,0x0
 b2e:	d54080e7          	jalr	-684(ra) # 87e <vprintf>
}
 b32:	0001                	nop
 b34:	70e2                	ld	ra,56(sp)
 b36:	7442                	ld	s0,48(sp)
 b38:	6165                	addi	sp,sp,112
 b3a:	8082                	ret

0000000000000b3c <printf>:

void
printf(const char *fmt, ...)
{
 b3c:	7159                	addi	sp,sp,-112
 b3e:	f406                	sd	ra,40(sp)
 b40:	f022                	sd	s0,32(sp)
 b42:	1800                	addi	s0,sp,48
 b44:	fca43c23          	sd	a0,-40(s0)
 b48:	e40c                	sd	a1,8(s0)
 b4a:	e810                	sd	a2,16(s0)
 b4c:	ec14                	sd	a3,24(s0)
 b4e:	f018                	sd	a4,32(s0)
 b50:	f41c                	sd	a5,40(s0)
 b52:	03043823          	sd	a6,48(s0)
 b56:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b5a:	04040793          	addi	a5,s0,64
 b5e:	fcf43823          	sd	a5,-48(s0)
 b62:	fd043783          	ld	a5,-48(s0)
 b66:	fc878793          	addi	a5,a5,-56
 b6a:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 b6e:	fe843783          	ld	a5,-24(s0)
 b72:	863e                	mv	a2,a5
 b74:	fd843583          	ld	a1,-40(s0)
 b78:	4505                	li	a0,1
 b7a:	00000097          	auipc	ra,0x0
 b7e:	d04080e7          	jalr	-764(ra) # 87e <vprintf>
}
 b82:	0001                	nop
 b84:	70a2                	ld	ra,40(sp)
 b86:	7402                	ld	s0,32(sp)
 b88:	6165                	addi	sp,sp,112
 b8a:	8082                	ret

0000000000000b8c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b8c:	7179                	addi	sp,sp,-48
 b8e:	f422                	sd	s0,40(sp)
 b90:	1800                	addi	s0,sp,48
 b92:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b96:	fd843783          	ld	a5,-40(s0)
 b9a:	17c1                	addi	a5,a5,-16
 b9c:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ba0:	00000797          	auipc	a5,0x0
 ba4:	54878793          	addi	a5,a5,1352 # 10e8 <freep>
 ba8:	639c                	ld	a5,0(a5)
 baa:	fef43423          	sd	a5,-24(s0)
 bae:	a815                	j	be2 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb0:	fe843783          	ld	a5,-24(s0)
 bb4:	639c                	ld	a5,0(a5)
 bb6:	fe843703          	ld	a4,-24(s0)
 bba:	00f76f63          	bltu	a4,a5,bd8 <free+0x4c>
 bbe:	fe043703          	ld	a4,-32(s0)
 bc2:	fe843783          	ld	a5,-24(s0)
 bc6:	02e7eb63          	bltu	a5,a4,bfc <free+0x70>
 bca:	fe843783          	ld	a5,-24(s0)
 bce:	639c                	ld	a5,0(a5)
 bd0:	fe043703          	ld	a4,-32(s0)
 bd4:	02f76463          	bltu	a4,a5,bfc <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bd8:	fe843783          	ld	a5,-24(s0)
 bdc:	639c                	ld	a5,0(a5)
 bde:	fef43423          	sd	a5,-24(s0)
 be2:	fe043703          	ld	a4,-32(s0)
 be6:	fe843783          	ld	a5,-24(s0)
 bea:	fce7f3e3          	bgeu	a5,a4,bb0 <free+0x24>
 bee:	fe843783          	ld	a5,-24(s0)
 bf2:	639c                	ld	a5,0(a5)
 bf4:	fe043703          	ld	a4,-32(s0)
 bf8:	faf77ce3          	bgeu	a4,a5,bb0 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 bfc:	fe043783          	ld	a5,-32(s0)
 c00:	479c                	lw	a5,8(a5)
 c02:	1782                	slli	a5,a5,0x20
 c04:	9381                	srli	a5,a5,0x20
 c06:	0792                	slli	a5,a5,0x4
 c08:	fe043703          	ld	a4,-32(s0)
 c0c:	973e                	add	a4,a4,a5
 c0e:	fe843783          	ld	a5,-24(s0)
 c12:	639c                	ld	a5,0(a5)
 c14:	02f71763          	bne	a4,a5,c42 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 c18:	fe043783          	ld	a5,-32(s0)
 c1c:	4798                	lw	a4,8(a5)
 c1e:	fe843783          	ld	a5,-24(s0)
 c22:	639c                	ld	a5,0(a5)
 c24:	479c                	lw	a5,8(a5)
 c26:	9fb9                	addw	a5,a5,a4
 c28:	0007871b          	sext.w	a4,a5
 c2c:	fe043783          	ld	a5,-32(s0)
 c30:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 c32:	fe843783          	ld	a5,-24(s0)
 c36:	639c                	ld	a5,0(a5)
 c38:	6398                	ld	a4,0(a5)
 c3a:	fe043783          	ld	a5,-32(s0)
 c3e:	e398                	sd	a4,0(a5)
 c40:	a039                	j	c4e <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 c42:	fe843783          	ld	a5,-24(s0)
 c46:	6398                	ld	a4,0(a5)
 c48:	fe043783          	ld	a5,-32(s0)
 c4c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 c4e:	fe843783          	ld	a5,-24(s0)
 c52:	479c                	lw	a5,8(a5)
 c54:	1782                	slli	a5,a5,0x20
 c56:	9381                	srli	a5,a5,0x20
 c58:	0792                	slli	a5,a5,0x4
 c5a:	fe843703          	ld	a4,-24(s0)
 c5e:	97ba                	add	a5,a5,a4
 c60:	fe043703          	ld	a4,-32(s0)
 c64:	02f71563          	bne	a4,a5,c8e <free+0x102>
    p->s.size += bp->s.size;
 c68:	fe843783          	ld	a5,-24(s0)
 c6c:	4798                	lw	a4,8(a5)
 c6e:	fe043783          	ld	a5,-32(s0)
 c72:	479c                	lw	a5,8(a5)
 c74:	9fb9                	addw	a5,a5,a4
 c76:	0007871b          	sext.w	a4,a5
 c7a:	fe843783          	ld	a5,-24(s0)
 c7e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 c80:	fe043783          	ld	a5,-32(s0)
 c84:	6398                	ld	a4,0(a5)
 c86:	fe843783          	ld	a5,-24(s0)
 c8a:	e398                	sd	a4,0(a5)
 c8c:	a031                	j	c98 <free+0x10c>
  } else
    p->s.ptr = bp;
 c8e:	fe843783          	ld	a5,-24(s0)
 c92:	fe043703          	ld	a4,-32(s0)
 c96:	e398                	sd	a4,0(a5)
  freep = p;
 c98:	00000797          	auipc	a5,0x0
 c9c:	45078793          	addi	a5,a5,1104 # 10e8 <freep>
 ca0:	fe843703          	ld	a4,-24(s0)
 ca4:	e398                	sd	a4,0(a5)
}
 ca6:	0001                	nop
 ca8:	7422                	ld	s0,40(sp)
 caa:	6145                	addi	sp,sp,48
 cac:	8082                	ret

0000000000000cae <morecore>:

static Header*
morecore(uint nu)
{
 cae:	7179                	addi	sp,sp,-48
 cb0:	f406                	sd	ra,40(sp)
 cb2:	f022                	sd	s0,32(sp)
 cb4:	1800                	addi	s0,sp,48
 cb6:	87aa                	mv	a5,a0
 cb8:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 cbc:	fdc42783          	lw	a5,-36(s0)
 cc0:	0007871b          	sext.w	a4,a5
 cc4:	6785                	lui	a5,0x1
 cc6:	00f77563          	bgeu	a4,a5,cd0 <morecore+0x22>
    nu = 4096;
 cca:	6785                	lui	a5,0x1
 ccc:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 cd0:	fdc42783          	lw	a5,-36(s0)
 cd4:	0047979b          	slliw	a5,a5,0x4
 cd8:	2781                	sext.w	a5,a5
 cda:	2781                	sext.w	a5,a5
 cdc:	853e                	mv	a0,a5
 cde:	00000097          	auipc	ra,0x0
 ce2:	9b8080e7          	jalr	-1608(ra) # 696 <sbrk>
 ce6:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 cea:	fe843703          	ld	a4,-24(s0)
 cee:	57fd                	li	a5,-1
 cf0:	00f71463          	bne	a4,a5,cf8 <morecore+0x4a>
    return 0;
 cf4:	4781                	li	a5,0
 cf6:	a03d                	j	d24 <morecore+0x76>
  hp = (Header*)p;
 cf8:	fe843783          	ld	a5,-24(s0)
 cfc:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 d00:	fe043783          	ld	a5,-32(s0)
 d04:	fdc42703          	lw	a4,-36(s0)
 d08:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 d0a:	fe043783          	ld	a5,-32(s0)
 d0e:	07c1                	addi	a5,a5,16
 d10:	853e                	mv	a0,a5
 d12:	00000097          	auipc	ra,0x0
 d16:	e7a080e7          	jalr	-390(ra) # b8c <free>
  return freep;
 d1a:	00000797          	auipc	a5,0x0
 d1e:	3ce78793          	addi	a5,a5,974 # 10e8 <freep>
 d22:	639c                	ld	a5,0(a5)
}
 d24:	853e                	mv	a0,a5
 d26:	70a2                	ld	ra,40(sp)
 d28:	7402                	ld	s0,32(sp)
 d2a:	6145                	addi	sp,sp,48
 d2c:	8082                	ret

0000000000000d2e <malloc>:

void*
malloc(uint nbytes)
{
 d2e:	7139                	addi	sp,sp,-64
 d30:	fc06                	sd	ra,56(sp)
 d32:	f822                	sd	s0,48(sp)
 d34:	0080                	addi	s0,sp,64
 d36:	87aa                	mv	a5,a0
 d38:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d3c:	fcc46783          	lwu	a5,-52(s0)
 d40:	07bd                	addi	a5,a5,15
 d42:	8391                	srli	a5,a5,0x4
 d44:	2781                	sext.w	a5,a5
 d46:	2785                	addiw	a5,a5,1
 d48:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 d4c:	00000797          	auipc	a5,0x0
 d50:	39c78793          	addi	a5,a5,924 # 10e8 <freep>
 d54:	639c                	ld	a5,0(a5)
 d56:	fef43023          	sd	a5,-32(s0)
 d5a:	fe043783          	ld	a5,-32(s0)
 d5e:	ef95                	bnez	a5,d9a <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 d60:	00000797          	auipc	a5,0x0
 d64:	37878793          	addi	a5,a5,888 # 10d8 <base>
 d68:	fef43023          	sd	a5,-32(s0)
 d6c:	00000797          	auipc	a5,0x0
 d70:	37c78793          	addi	a5,a5,892 # 10e8 <freep>
 d74:	fe043703          	ld	a4,-32(s0)
 d78:	e398                	sd	a4,0(a5)
 d7a:	00000797          	auipc	a5,0x0
 d7e:	36e78793          	addi	a5,a5,878 # 10e8 <freep>
 d82:	6398                	ld	a4,0(a5)
 d84:	00000797          	auipc	a5,0x0
 d88:	35478793          	addi	a5,a5,852 # 10d8 <base>
 d8c:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 d8e:	00000797          	auipc	a5,0x0
 d92:	34a78793          	addi	a5,a5,842 # 10d8 <base>
 d96:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d9a:	fe043783          	ld	a5,-32(s0)
 d9e:	639c                	ld	a5,0(a5)
 da0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 da4:	fe843783          	ld	a5,-24(s0)
 da8:	4798                	lw	a4,8(a5)
 daa:	fdc42783          	lw	a5,-36(s0)
 dae:	2781                	sext.w	a5,a5
 db0:	06f76863          	bltu	a4,a5,e20 <malloc+0xf2>
      if(p->s.size == nunits)
 db4:	fe843783          	ld	a5,-24(s0)
 db8:	4798                	lw	a4,8(a5)
 dba:	fdc42783          	lw	a5,-36(s0)
 dbe:	2781                	sext.w	a5,a5
 dc0:	00e79963          	bne	a5,a4,dd2 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 dc4:	fe843783          	ld	a5,-24(s0)
 dc8:	6398                	ld	a4,0(a5)
 dca:	fe043783          	ld	a5,-32(s0)
 dce:	e398                	sd	a4,0(a5)
 dd0:	a82d                	j	e0a <malloc+0xdc>
      else {
        p->s.size -= nunits;
 dd2:	fe843783          	ld	a5,-24(s0)
 dd6:	4798                	lw	a4,8(a5)
 dd8:	fdc42783          	lw	a5,-36(s0)
 ddc:	40f707bb          	subw	a5,a4,a5
 de0:	0007871b          	sext.w	a4,a5
 de4:	fe843783          	ld	a5,-24(s0)
 de8:	c798                	sw	a4,8(a5)
        p += p->s.size;
 dea:	fe843783          	ld	a5,-24(s0)
 dee:	479c                	lw	a5,8(a5)
 df0:	1782                	slli	a5,a5,0x20
 df2:	9381                	srli	a5,a5,0x20
 df4:	0792                	slli	a5,a5,0x4
 df6:	fe843703          	ld	a4,-24(s0)
 dfa:	97ba                	add	a5,a5,a4
 dfc:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 e00:	fe843783          	ld	a5,-24(s0)
 e04:	fdc42703          	lw	a4,-36(s0)
 e08:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 e0a:	00000797          	auipc	a5,0x0
 e0e:	2de78793          	addi	a5,a5,734 # 10e8 <freep>
 e12:	fe043703          	ld	a4,-32(s0)
 e16:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 e18:	fe843783          	ld	a5,-24(s0)
 e1c:	07c1                	addi	a5,a5,16
 e1e:	a091                	j	e62 <malloc+0x134>
    }
    if(p == freep)
 e20:	00000797          	auipc	a5,0x0
 e24:	2c878793          	addi	a5,a5,712 # 10e8 <freep>
 e28:	639c                	ld	a5,0(a5)
 e2a:	fe843703          	ld	a4,-24(s0)
 e2e:	02f71063          	bne	a4,a5,e4e <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 e32:	fdc42783          	lw	a5,-36(s0)
 e36:	853e                	mv	a0,a5
 e38:	00000097          	auipc	ra,0x0
 e3c:	e76080e7          	jalr	-394(ra) # cae <morecore>
 e40:	fea43423          	sd	a0,-24(s0)
 e44:	fe843783          	ld	a5,-24(s0)
 e48:	e399                	bnez	a5,e4e <malloc+0x120>
        return 0;
 e4a:	4781                	li	a5,0
 e4c:	a819                	j	e62 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e4e:	fe843783          	ld	a5,-24(s0)
 e52:	fef43023          	sd	a5,-32(s0)
 e56:	fe843783          	ld	a5,-24(s0)
 e5a:	639c                	ld	a5,0(a5)
 e5c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e60:	b791                	j	da4 <malloc+0x76>
  }
}
 e62:	853e                	mv	a0,a5
 e64:	70e2                	ld	ra,56(sp)
 e66:	7442                	ld	s0,48(sp)
 e68:	6121                	addi	sp,sp,64
 e6a:	8082                	ret
