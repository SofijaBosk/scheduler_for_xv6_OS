
user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	0080                	addi	s0,sp,64
   8:	87aa                	mv	a5,a0
   a:	fcb43023          	sd	a1,-64(s0)
   e:	fcf42623          	sw	a5,-52(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  12:	fe042023          	sw	zero,-32(s0)
  16:	fe042783          	lw	a5,-32(s0)
  1a:	fef42223          	sw	a5,-28(s0)
  1e:	fe442783          	lw	a5,-28(s0)
  22:	fef42423          	sw	a5,-24(s0)
  inword = 0;
  26:	fc042e23          	sw	zero,-36(s0)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  2a:	a859                	j	c0 <wc+0xc0>
    for(i=0; i<n; i++){
  2c:	fe042623          	sw	zero,-20(s0)
  30:	a041                	j	b0 <wc+0xb0>
      c++;
  32:	fe042783          	lw	a5,-32(s0)
  36:	2785                	addiw	a5,a5,1
  38:	fef42023          	sw	a5,-32(s0)
      if(buf[i] == '\n')
  3c:	00001717          	auipc	a4,0x1
  40:	f3c70713          	addi	a4,a4,-196 # f78 <buf>
  44:	fec42783          	lw	a5,-20(s0)
  48:	97ba                	add	a5,a5,a4
  4a:	0007c783          	lbu	a5,0(a5)
  4e:	873e                	mv	a4,a5
  50:	47a9                	li	a5,10
  52:	00f71763          	bne	a4,a5,60 <wc+0x60>
        l++;
  56:	fe842783          	lw	a5,-24(s0)
  5a:	2785                	addiw	a5,a5,1
  5c:	fef42423          	sw	a5,-24(s0)
      if(strchr(" \r\t\n\v", buf[i]))
  60:	00001717          	auipc	a4,0x1
  64:	f1870713          	addi	a4,a4,-232 # f78 <buf>
  68:	fec42783          	lw	a5,-20(s0)
  6c:	97ba                	add	a5,a5,a4
  6e:	0007c783          	lbu	a5,0(a5)
  72:	85be                	mv	a1,a5
  74:	00001517          	auipc	a0,0x1
  78:	e9c50513          	addi	a0,a0,-356 # f10 <malloc+0x13e>
  7c:	00000097          	auipc	ra,0x0
  80:	2ec080e7          	jalr	748(ra) # 368 <strchr>
  84:	87aa                	mv	a5,a0
  86:	c781                	beqz	a5,8e <wc+0x8e>
        inword = 0;
  88:	fc042e23          	sw	zero,-36(s0)
  8c:	a829                	j	a6 <wc+0xa6>
      else if(!inword){
  8e:	fdc42783          	lw	a5,-36(s0)
  92:	2781                	sext.w	a5,a5
  94:	eb89                	bnez	a5,a6 <wc+0xa6>
        w++;
  96:	fe442783          	lw	a5,-28(s0)
  9a:	2785                	addiw	a5,a5,1
  9c:	fef42223          	sw	a5,-28(s0)
        inword = 1;
  a0:	4785                	li	a5,1
  a2:	fcf42e23          	sw	a5,-36(s0)
    for(i=0; i<n; i++){
  a6:	fec42783          	lw	a5,-20(s0)
  aa:	2785                	addiw	a5,a5,1
  ac:	fef42623          	sw	a5,-20(s0)
  b0:	fec42703          	lw	a4,-20(s0)
  b4:	fd842783          	lw	a5,-40(s0)
  b8:	2701                	sext.w	a4,a4
  ba:	2781                	sext.w	a5,a5
  bc:	f6f74be3          	blt	a4,a5,32 <wc+0x32>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	fcc42783          	lw	a5,-52(s0)
  c4:	20000613          	li	a2,512
  c8:	00001597          	auipc	a1,0x1
  cc:	eb058593          	addi	a1,a1,-336 # f78 <buf>
  d0:	853e                	mv	a0,a5
  d2:	00000097          	auipc	ra,0x0
  d6:	5f8080e7          	jalr	1528(ra) # 6ca <read>
  da:	87aa                	mv	a5,a0
  dc:	fcf42c23          	sw	a5,-40(s0)
  e0:	fd842783          	lw	a5,-40(s0)
  e4:	2781                	sext.w	a5,a5
  e6:	f4f043e3          	bgtz	a5,2c <wc+0x2c>
      }
    }
  }
  if(n < 0){
  ea:	fd842783          	lw	a5,-40(s0)
  ee:	2781                	sext.w	a5,a5
  f0:	0007df63          	bgez	a5,10e <wc+0x10e>
    printf("wc: read error\n");
  f4:	00001517          	auipc	a0,0x1
  f8:	e2450513          	addi	a0,a0,-476 # f18 <malloc+0x146>
  fc:	00001097          	auipc	ra,0x1
 100:	ae4080e7          	jalr	-1308(ra) # be0 <printf>
    exit(1);
 104:	4505                	li	a0,1
 106:	00000097          	auipc	ra,0x0
 10a:	5ac080e7          	jalr	1452(ra) # 6b2 <exit>
  }
  printf("%d %d %d %s\n", l, w, c, name);
 10e:	fe042683          	lw	a3,-32(s0)
 112:	fe442603          	lw	a2,-28(s0)
 116:	fe842783          	lw	a5,-24(s0)
 11a:	fc043703          	ld	a4,-64(s0)
 11e:	85be                	mv	a1,a5
 120:	00001517          	auipc	a0,0x1
 124:	e0850513          	addi	a0,a0,-504 # f28 <malloc+0x156>
 128:	00001097          	auipc	ra,0x1
 12c:	ab8080e7          	jalr	-1352(ra) # be0 <printf>
}
 130:	0001                	nop
 132:	70e2                	ld	ra,56(sp)
 134:	7442                	ld	s0,48(sp)
 136:	6121                	addi	sp,sp,64
 138:	8082                	ret

000000000000013a <main>:

int
main(int argc, char *argv[])
{
 13a:	7179                	addi	sp,sp,-48
 13c:	f406                	sd	ra,40(sp)
 13e:	f022                	sd	s0,32(sp)
 140:	1800                	addi	s0,sp,48
 142:	87aa                	mv	a5,a0
 144:	fcb43823          	sd	a1,-48(s0)
 148:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
 14c:	fdc42783          	lw	a5,-36(s0)
 150:	0007871b          	sext.w	a4,a5
 154:	4785                	li	a5,1
 156:	02e7c063          	blt	a5,a4,176 <main+0x3c>
    wc(0, "");
 15a:	00001597          	auipc	a1,0x1
 15e:	dde58593          	addi	a1,a1,-546 # f38 <malloc+0x166>
 162:	4501                	li	a0,0
 164:	00000097          	auipc	ra,0x0
 168:	e9c080e7          	jalr	-356(ra) # 0 <wc>
    exit(0);
 16c:	4501                	li	a0,0
 16e:	00000097          	auipc	ra,0x0
 172:	544080e7          	jalr	1348(ra) # 6b2 <exit>
  }

  for(i = 1; i < argc; i++){
 176:	4785                	li	a5,1
 178:	fef42623          	sw	a5,-20(s0)
 17c:	a071                	j	208 <main+0xce>
    if((fd = open(argv[i], 0)) < 0){
 17e:	fec42783          	lw	a5,-20(s0)
 182:	078e                	slli	a5,a5,0x3
 184:	fd043703          	ld	a4,-48(s0)
 188:	97ba                	add	a5,a5,a4
 18a:	639c                	ld	a5,0(a5)
 18c:	4581                	li	a1,0
 18e:	853e                	mv	a0,a5
 190:	00000097          	auipc	ra,0x0
 194:	562080e7          	jalr	1378(ra) # 6f2 <open>
 198:	87aa                	mv	a5,a0
 19a:	fef42423          	sw	a5,-24(s0)
 19e:	fe842783          	lw	a5,-24(s0)
 1a2:	2781                	sext.w	a5,a5
 1a4:	0207d763          	bgez	a5,1d2 <main+0x98>
      printf("wc: cannot open %s\n", argv[i]);
 1a8:	fec42783          	lw	a5,-20(s0)
 1ac:	078e                	slli	a5,a5,0x3
 1ae:	fd043703          	ld	a4,-48(s0)
 1b2:	97ba                	add	a5,a5,a4
 1b4:	639c                	ld	a5,0(a5)
 1b6:	85be                	mv	a1,a5
 1b8:	00001517          	auipc	a0,0x1
 1bc:	d8850513          	addi	a0,a0,-632 # f40 <malloc+0x16e>
 1c0:	00001097          	auipc	ra,0x1
 1c4:	a20080e7          	jalr	-1504(ra) # be0 <printf>
      exit(1);
 1c8:	4505                	li	a0,1
 1ca:	00000097          	auipc	ra,0x0
 1ce:	4e8080e7          	jalr	1256(ra) # 6b2 <exit>
    }
    wc(fd, argv[i]);
 1d2:	fec42783          	lw	a5,-20(s0)
 1d6:	078e                	slli	a5,a5,0x3
 1d8:	fd043703          	ld	a4,-48(s0)
 1dc:	97ba                	add	a5,a5,a4
 1de:	6398                	ld	a4,0(a5)
 1e0:	fe842783          	lw	a5,-24(s0)
 1e4:	85ba                	mv	a1,a4
 1e6:	853e                	mv	a0,a5
 1e8:	00000097          	auipc	ra,0x0
 1ec:	e18080e7          	jalr	-488(ra) # 0 <wc>
    close(fd);
 1f0:	fe842783          	lw	a5,-24(s0)
 1f4:	853e                	mv	a0,a5
 1f6:	00000097          	auipc	ra,0x0
 1fa:	4e4080e7          	jalr	1252(ra) # 6da <close>
  for(i = 1; i < argc; i++){
 1fe:	fec42783          	lw	a5,-20(s0)
 202:	2785                	addiw	a5,a5,1
 204:	fef42623          	sw	a5,-20(s0)
 208:	fec42703          	lw	a4,-20(s0)
 20c:	fdc42783          	lw	a5,-36(s0)
 210:	2701                	sext.w	a4,a4
 212:	2781                	sext.w	a5,a5
 214:	f6f745e3          	blt	a4,a5,17e <main+0x44>
  }
  exit(0);
 218:	4501                	li	a0,0
 21a:	00000097          	auipc	ra,0x0
 21e:	498080e7          	jalr	1176(ra) # 6b2 <exit>

0000000000000222 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 222:	7179                	addi	sp,sp,-48
 224:	f422                	sd	s0,40(sp)
 226:	1800                	addi	s0,sp,48
 228:	fca43c23          	sd	a0,-40(s0)
 22c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 230:	fd843783          	ld	a5,-40(s0)
 234:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 238:	0001                	nop
 23a:	fd043703          	ld	a4,-48(s0)
 23e:	00170793          	addi	a5,a4,1
 242:	fcf43823          	sd	a5,-48(s0)
 246:	fd843783          	ld	a5,-40(s0)
 24a:	00178693          	addi	a3,a5,1
 24e:	fcd43c23          	sd	a3,-40(s0)
 252:	00074703          	lbu	a4,0(a4)
 256:	00e78023          	sb	a4,0(a5)
 25a:	0007c783          	lbu	a5,0(a5)
 25e:	fff1                	bnez	a5,23a <strcpy+0x18>
    ;
  return os;
 260:	fe843783          	ld	a5,-24(s0)
}
 264:	853e                	mv	a0,a5
 266:	7422                	ld	s0,40(sp)
 268:	6145                	addi	sp,sp,48
 26a:	8082                	ret

000000000000026c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 26c:	1101                	addi	sp,sp,-32
 26e:	ec22                	sd	s0,24(sp)
 270:	1000                	addi	s0,sp,32
 272:	fea43423          	sd	a0,-24(s0)
 276:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 27a:	a819                	j	290 <strcmp+0x24>
    p++, q++;
 27c:	fe843783          	ld	a5,-24(s0)
 280:	0785                	addi	a5,a5,1
 282:	fef43423          	sd	a5,-24(s0)
 286:	fe043783          	ld	a5,-32(s0)
 28a:	0785                	addi	a5,a5,1
 28c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 290:	fe843783          	ld	a5,-24(s0)
 294:	0007c783          	lbu	a5,0(a5)
 298:	cb99                	beqz	a5,2ae <strcmp+0x42>
 29a:	fe843783          	ld	a5,-24(s0)
 29e:	0007c703          	lbu	a4,0(a5)
 2a2:	fe043783          	ld	a5,-32(s0)
 2a6:	0007c783          	lbu	a5,0(a5)
 2aa:	fcf709e3          	beq	a4,a5,27c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 2ae:	fe843783          	ld	a5,-24(s0)
 2b2:	0007c783          	lbu	a5,0(a5)
 2b6:	0007871b          	sext.w	a4,a5
 2ba:	fe043783          	ld	a5,-32(s0)
 2be:	0007c783          	lbu	a5,0(a5)
 2c2:	2781                	sext.w	a5,a5
 2c4:	40f707bb          	subw	a5,a4,a5
 2c8:	2781                	sext.w	a5,a5
}
 2ca:	853e                	mv	a0,a5
 2cc:	6462                	ld	s0,24(sp)
 2ce:	6105                	addi	sp,sp,32
 2d0:	8082                	ret

00000000000002d2 <strlen>:

uint
strlen(const char *s)
{
 2d2:	7179                	addi	sp,sp,-48
 2d4:	f422                	sd	s0,40(sp)
 2d6:	1800                	addi	s0,sp,48
 2d8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 2dc:	fe042623          	sw	zero,-20(s0)
 2e0:	a031                	j	2ec <strlen+0x1a>
 2e2:	fec42783          	lw	a5,-20(s0)
 2e6:	2785                	addiw	a5,a5,1
 2e8:	fef42623          	sw	a5,-20(s0)
 2ec:	fec42783          	lw	a5,-20(s0)
 2f0:	fd843703          	ld	a4,-40(s0)
 2f4:	97ba                	add	a5,a5,a4
 2f6:	0007c783          	lbu	a5,0(a5)
 2fa:	f7e5                	bnez	a5,2e2 <strlen+0x10>
    ;
  return n;
 2fc:	fec42783          	lw	a5,-20(s0)
}
 300:	853e                	mv	a0,a5
 302:	7422                	ld	s0,40(sp)
 304:	6145                	addi	sp,sp,48
 306:	8082                	ret

0000000000000308 <memset>:

void*
memset(void *dst, int c, uint n)
{
 308:	7179                	addi	sp,sp,-48
 30a:	f422                	sd	s0,40(sp)
 30c:	1800                	addi	s0,sp,48
 30e:	fca43c23          	sd	a0,-40(s0)
 312:	87ae                	mv	a5,a1
 314:	8732                	mv	a4,a2
 316:	fcf42a23          	sw	a5,-44(s0)
 31a:	87ba                	mv	a5,a4
 31c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 320:	fd843783          	ld	a5,-40(s0)
 324:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 328:	fe042623          	sw	zero,-20(s0)
 32c:	a00d                	j	34e <memset+0x46>
    cdst[i] = c;
 32e:	fec42783          	lw	a5,-20(s0)
 332:	fe043703          	ld	a4,-32(s0)
 336:	97ba                	add	a5,a5,a4
 338:	fd442703          	lw	a4,-44(s0)
 33c:	0ff77713          	andi	a4,a4,255
 340:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 344:	fec42783          	lw	a5,-20(s0)
 348:	2785                	addiw	a5,a5,1
 34a:	fef42623          	sw	a5,-20(s0)
 34e:	fec42703          	lw	a4,-20(s0)
 352:	fd042783          	lw	a5,-48(s0)
 356:	2781                	sext.w	a5,a5
 358:	fcf76be3          	bltu	a4,a5,32e <memset+0x26>
  }
  return dst;
 35c:	fd843783          	ld	a5,-40(s0)
}
 360:	853e                	mv	a0,a5
 362:	7422                	ld	s0,40(sp)
 364:	6145                	addi	sp,sp,48
 366:	8082                	ret

0000000000000368 <strchr>:

char*
strchr(const char *s, char c)
{
 368:	1101                	addi	sp,sp,-32
 36a:	ec22                	sd	s0,24(sp)
 36c:	1000                	addi	s0,sp,32
 36e:	fea43423          	sd	a0,-24(s0)
 372:	87ae                	mv	a5,a1
 374:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 378:	a01d                	j	39e <strchr+0x36>
    if(*s == c)
 37a:	fe843783          	ld	a5,-24(s0)
 37e:	0007c703          	lbu	a4,0(a5)
 382:	fe744783          	lbu	a5,-25(s0)
 386:	0ff7f793          	andi	a5,a5,255
 38a:	00e79563          	bne	a5,a4,394 <strchr+0x2c>
      return (char*)s;
 38e:	fe843783          	ld	a5,-24(s0)
 392:	a821                	j	3aa <strchr+0x42>
  for(; *s; s++)
 394:	fe843783          	ld	a5,-24(s0)
 398:	0785                	addi	a5,a5,1
 39a:	fef43423          	sd	a5,-24(s0)
 39e:	fe843783          	ld	a5,-24(s0)
 3a2:	0007c783          	lbu	a5,0(a5)
 3a6:	fbf1                	bnez	a5,37a <strchr+0x12>
  return 0;
 3a8:	4781                	li	a5,0
}
 3aa:	853e                	mv	a0,a5
 3ac:	6462                	ld	s0,24(sp)
 3ae:	6105                	addi	sp,sp,32
 3b0:	8082                	ret

00000000000003b2 <gets>:

char*
gets(char *buf, int max)
{
 3b2:	7179                	addi	sp,sp,-48
 3b4:	f406                	sd	ra,40(sp)
 3b6:	f022                	sd	s0,32(sp)
 3b8:	1800                	addi	s0,sp,48
 3ba:	fca43c23          	sd	a0,-40(s0)
 3be:	87ae                	mv	a5,a1
 3c0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c4:	fe042623          	sw	zero,-20(s0)
 3c8:	a8a1                	j	420 <gets+0x6e>
    cc = read(0, &c, 1);
 3ca:	fe740793          	addi	a5,s0,-25
 3ce:	4605                	li	a2,1
 3d0:	85be                	mv	a1,a5
 3d2:	4501                	li	a0,0
 3d4:	00000097          	auipc	ra,0x0
 3d8:	2f6080e7          	jalr	758(ra) # 6ca <read>
 3dc:	87aa                	mv	a5,a0
 3de:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 3e2:	fe842783          	lw	a5,-24(s0)
 3e6:	2781                	sext.w	a5,a5
 3e8:	04f05763          	blez	a5,436 <gets+0x84>
      break;
    buf[i++] = c;
 3ec:	fec42783          	lw	a5,-20(s0)
 3f0:	0017871b          	addiw	a4,a5,1
 3f4:	fee42623          	sw	a4,-20(s0)
 3f8:	873e                	mv	a4,a5
 3fa:	fd843783          	ld	a5,-40(s0)
 3fe:	97ba                	add	a5,a5,a4
 400:	fe744703          	lbu	a4,-25(s0)
 404:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 408:	fe744783          	lbu	a5,-25(s0)
 40c:	873e                	mv	a4,a5
 40e:	47a9                	li	a5,10
 410:	02f70463          	beq	a4,a5,438 <gets+0x86>
 414:	fe744783          	lbu	a5,-25(s0)
 418:	873e                	mv	a4,a5
 41a:	47b5                	li	a5,13
 41c:	00f70e63          	beq	a4,a5,438 <gets+0x86>
  for(i=0; i+1 < max; ){
 420:	fec42783          	lw	a5,-20(s0)
 424:	2785                	addiw	a5,a5,1
 426:	0007871b          	sext.w	a4,a5
 42a:	fd442783          	lw	a5,-44(s0)
 42e:	2781                	sext.w	a5,a5
 430:	f8f74de3          	blt	a4,a5,3ca <gets+0x18>
 434:	a011                	j	438 <gets+0x86>
      break;
 436:	0001                	nop
      break;
  }
  buf[i] = '\0';
 438:	fec42783          	lw	a5,-20(s0)
 43c:	fd843703          	ld	a4,-40(s0)
 440:	97ba                	add	a5,a5,a4
 442:	00078023          	sb	zero,0(a5)
  return buf;
 446:	fd843783          	ld	a5,-40(s0)
}
 44a:	853e                	mv	a0,a5
 44c:	70a2                	ld	ra,40(sp)
 44e:	7402                	ld	s0,32(sp)
 450:	6145                	addi	sp,sp,48
 452:	8082                	ret

0000000000000454 <stat>:

int
stat(const char *n, struct stat *st)
{
 454:	7179                	addi	sp,sp,-48
 456:	f406                	sd	ra,40(sp)
 458:	f022                	sd	s0,32(sp)
 45a:	1800                	addi	s0,sp,48
 45c:	fca43c23          	sd	a0,-40(s0)
 460:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 464:	4581                	li	a1,0
 466:	fd843503          	ld	a0,-40(s0)
 46a:	00000097          	auipc	ra,0x0
 46e:	288080e7          	jalr	648(ra) # 6f2 <open>
 472:	87aa                	mv	a5,a0
 474:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 478:	fec42783          	lw	a5,-20(s0)
 47c:	2781                	sext.w	a5,a5
 47e:	0007d463          	bgez	a5,486 <stat+0x32>
    return -1;
 482:	57fd                	li	a5,-1
 484:	a035                	j	4b0 <stat+0x5c>
  r = fstat(fd, st);
 486:	fec42783          	lw	a5,-20(s0)
 48a:	fd043583          	ld	a1,-48(s0)
 48e:	853e                	mv	a0,a5
 490:	00000097          	auipc	ra,0x0
 494:	27a080e7          	jalr	634(ra) # 70a <fstat>
 498:	87aa                	mv	a5,a0
 49a:	fef42423          	sw	a5,-24(s0)
  close(fd);
 49e:	fec42783          	lw	a5,-20(s0)
 4a2:	853e                	mv	a0,a5
 4a4:	00000097          	auipc	ra,0x0
 4a8:	236080e7          	jalr	566(ra) # 6da <close>
  return r;
 4ac:	fe842783          	lw	a5,-24(s0)
}
 4b0:	853e                	mv	a0,a5
 4b2:	70a2                	ld	ra,40(sp)
 4b4:	7402                	ld	s0,32(sp)
 4b6:	6145                	addi	sp,sp,48
 4b8:	8082                	ret

00000000000004ba <atoi>:

int
atoi(const char *s)
{
 4ba:	7179                	addi	sp,sp,-48
 4bc:	f422                	sd	s0,40(sp)
 4be:	1800                	addi	s0,sp,48
 4c0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 4c4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 4c8:	a815                	j	4fc <atoi+0x42>
    n = n*10 + *s++ - '0';
 4ca:	fec42703          	lw	a4,-20(s0)
 4ce:	87ba                	mv	a5,a4
 4d0:	0027979b          	slliw	a5,a5,0x2
 4d4:	9fb9                	addw	a5,a5,a4
 4d6:	0017979b          	slliw	a5,a5,0x1
 4da:	0007871b          	sext.w	a4,a5
 4de:	fd843783          	ld	a5,-40(s0)
 4e2:	00178693          	addi	a3,a5,1
 4e6:	fcd43c23          	sd	a3,-40(s0)
 4ea:	0007c783          	lbu	a5,0(a5)
 4ee:	2781                	sext.w	a5,a5
 4f0:	9fb9                	addw	a5,a5,a4
 4f2:	2781                	sext.w	a5,a5
 4f4:	fd07879b          	addiw	a5,a5,-48
 4f8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 4fc:	fd843783          	ld	a5,-40(s0)
 500:	0007c783          	lbu	a5,0(a5)
 504:	873e                	mv	a4,a5
 506:	02f00793          	li	a5,47
 50a:	00e7fb63          	bgeu	a5,a4,520 <atoi+0x66>
 50e:	fd843783          	ld	a5,-40(s0)
 512:	0007c783          	lbu	a5,0(a5)
 516:	873e                	mv	a4,a5
 518:	03900793          	li	a5,57
 51c:	fae7f7e3          	bgeu	a5,a4,4ca <atoi+0x10>
  return n;
 520:	fec42783          	lw	a5,-20(s0)
}
 524:	853e                	mv	a0,a5
 526:	7422                	ld	s0,40(sp)
 528:	6145                	addi	sp,sp,48
 52a:	8082                	ret

000000000000052c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 52c:	7139                	addi	sp,sp,-64
 52e:	fc22                	sd	s0,56(sp)
 530:	0080                	addi	s0,sp,64
 532:	fca43c23          	sd	a0,-40(s0)
 536:	fcb43823          	sd	a1,-48(s0)
 53a:	87b2                	mv	a5,a2
 53c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 540:	fd843783          	ld	a5,-40(s0)
 544:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 548:	fd043783          	ld	a5,-48(s0)
 54c:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 550:	fe043703          	ld	a4,-32(s0)
 554:	fe843783          	ld	a5,-24(s0)
 558:	02e7fc63          	bgeu	a5,a4,590 <memmove+0x64>
    while(n-- > 0)
 55c:	a00d                	j	57e <memmove+0x52>
      *dst++ = *src++;
 55e:	fe043703          	ld	a4,-32(s0)
 562:	00170793          	addi	a5,a4,1
 566:	fef43023          	sd	a5,-32(s0)
 56a:	fe843783          	ld	a5,-24(s0)
 56e:	00178693          	addi	a3,a5,1
 572:	fed43423          	sd	a3,-24(s0)
 576:	00074703          	lbu	a4,0(a4)
 57a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 57e:	fcc42783          	lw	a5,-52(s0)
 582:	fff7871b          	addiw	a4,a5,-1
 586:	fce42623          	sw	a4,-52(s0)
 58a:	fcf04ae3          	bgtz	a5,55e <memmove+0x32>
 58e:	a891                	j	5e2 <memmove+0xb6>
  } else {
    dst += n;
 590:	fcc42783          	lw	a5,-52(s0)
 594:	fe843703          	ld	a4,-24(s0)
 598:	97ba                	add	a5,a5,a4
 59a:	fef43423          	sd	a5,-24(s0)
    src += n;
 59e:	fcc42783          	lw	a5,-52(s0)
 5a2:	fe043703          	ld	a4,-32(s0)
 5a6:	97ba                	add	a5,a5,a4
 5a8:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 5ac:	a01d                	j	5d2 <memmove+0xa6>
      *--dst = *--src;
 5ae:	fe043783          	ld	a5,-32(s0)
 5b2:	17fd                	addi	a5,a5,-1
 5b4:	fef43023          	sd	a5,-32(s0)
 5b8:	fe843783          	ld	a5,-24(s0)
 5bc:	17fd                	addi	a5,a5,-1
 5be:	fef43423          	sd	a5,-24(s0)
 5c2:	fe043783          	ld	a5,-32(s0)
 5c6:	0007c703          	lbu	a4,0(a5)
 5ca:	fe843783          	ld	a5,-24(s0)
 5ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 5d2:	fcc42783          	lw	a5,-52(s0)
 5d6:	fff7871b          	addiw	a4,a5,-1
 5da:	fce42623          	sw	a4,-52(s0)
 5de:	fcf048e3          	bgtz	a5,5ae <memmove+0x82>
  }
  return vdst;
 5e2:	fd843783          	ld	a5,-40(s0)
}
 5e6:	853e                	mv	a0,a5
 5e8:	7462                	ld	s0,56(sp)
 5ea:	6121                	addi	sp,sp,64
 5ec:	8082                	ret

00000000000005ee <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 5ee:	7139                	addi	sp,sp,-64
 5f0:	fc22                	sd	s0,56(sp)
 5f2:	0080                	addi	s0,sp,64
 5f4:	fca43c23          	sd	a0,-40(s0)
 5f8:	fcb43823          	sd	a1,-48(s0)
 5fc:	87b2                	mv	a5,a2
 5fe:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 602:	fd843783          	ld	a5,-40(s0)
 606:	fef43423          	sd	a5,-24(s0)
 60a:	fd043783          	ld	a5,-48(s0)
 60e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 612:	a0a1                	j	65a <memcmp+0x6c>
    if (*p1 != *p2) {
 614:	fe843783          	ld	a5,-24(s0)
 618:	0007c703          	lbu	a4,0(a5)
 61c:	fe043783          	ld	a5,-32(s0)
 620:	0007c783          	lbu	a5,0(a5)
 624:	02f70163          	beq	a4,a5,646 <memcmp+0x58>
      return *p1 - *p2;
 628:	fe843783          	ld	a5,-24(s0)
 62c:	0007c783          	lbu	a5,0(a5)
 630:	0007871b          	sext.w	a4,a5
 634:	fe043783          	ld	a5,-32(s0)
 638:	0007c783          	lbu	a5,0(a5)
 63c:	2781                	sext.w	a5,a5
 63e:	40f707bb          	subw	a5,a4,a5
 642:	2781                	sext.w	a5,a5
 644:	a01d                	j	66a <memcmp+0x7c>
    }
    p1++;
 646:	fe843783          	ld	a5,-24(s0)
 64a:	0785                	addi	a5,a5,1
 64c:	fef43423          	sd	a5,-24(s0)
    p2++;
 650:	fe043783          	ld	a5,-32(s0)
 654:	0785                	addi	a5,a5,1
 656:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 65a:	fcc42783          	lw	a5,-52(s0)
 65e:	fff7871b          	addiw	a4,a5,-1
 662:	fce42623          	sw	a4,-52(s0)
 666:	f7dd                	bnez	a5,614 <memcmp+0x26>
  }
  return 0;
 668:	4781                	li	a5,0
}
 66a:	853e                	mv	a0,a5
 66c:	7462                	ld	s0,56(sp)
 66e:	6121                	addi	sp,sp,64
 670:	8082                	ret

0000000000000672 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 672:	7179                	addi	sp,sp,-48
 674:	f406                	sd	ra,40(sp)
 676:	f022                	sd	s0,32(sp)
 678:	1800                	addi	s0,sp,48
 67a:	fea43423          	sd	a0,-24(s0)
 67e:	feb43023          	sd	a1,-32(s0)
 682:	87b2                	mv	a5,a2
 684:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 688:	fdc42783          	lw	a5,-36(s0)
 68c:	863e                	mv	a2,a5
 68e:	fe043583          	ld	a1,-32(s0)
 692:	fe843503          	ld	a0,-24(s0)
 696:	00000097          	auipc	ra,0x0
 69a:	e96080e7          	jalr	-362(ra) # 52c <memmove>
 69e:	87aa                	mv	a5,a0
}
 6a0:	853e                	mv	a0,a5
 6a2:	70a2                	ld	ra,40(sp)
 6a4:	7402                	ld	s0,32(sp)
 6a6:	6145                	addi	sp,sp,48
 6a8:	8082                	ret

00000000000006aa <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 6aa:	4885                	li	a7,1
 ecall
 6ac:	00000073          	ecall
 ret
 6b0:	8082                	ret

00000000000006b2 <exit>:
.global exit
exit:
 li a7, SYS_exit
 6b2:	4889                	li	a7,2
 ecall
 6b4:	00000073          	ecall
 ret
 6b8:	8082                	ret

00000000000006ba <wait>:
.global wait
wait:
 li a7, SYS_wait
 6ba:	488d                	li	a7,3
 ecall
 6bc:	00000073          	ecall
 ret
 6c0:	8082                	ret

00000000000006c2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 6c2:	4891                	li	a7,4
 ecall
 6c4:	00000073          	ecall
 ret
 6c8:	8082                	ret

00000000000006ca <read>:
.global read
read:
 li a7, SYS_read
 6ca:	4895                	li	a7,5
 ecall
 6cc:	00000073          	ecall
 ret
 6d0:	8082                	ret

00000000000006d2 <write>:
.global write
write:
 li a7, SYS_write
 6d2:	48c1                	li	a7,16
 ecall
 6d4:	00000073          	ecall
 ret
 6d8:	8082                	ret

00000000000006da <close>:
.global close
close:
 li a7, SYS_close
 6da:	48d5                	li	a7,21
 ecall
 6dc:	00000073          	ecall
 ret
 6e0:	8082                	ret

00000000000006e2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 6e2:	4899                	li	a7,6
 ecall
 6e4:	00000073          	ecall
 ret
 6e8:	8082                	ret

00000000000006ea <exec>:
.global exec
exec:
 li a7, SYS_exec
 6ea:	489d                	li	a7,7
 ecall
 6ec:	00000073          	ecall
 ret
 6f0:	8082                	ret

00000000000006f2 <open>:
.global open
open:
 li a7, SYS_open
 6f2:	48bd                	li	a7,15
 ecall
 6f4:	00000073          	ecall
 ret
 6f8:	8082                	ret

00000000000006fa <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 6fa:	48c5                	li	a7,17
 ecall
 6fc:	00000073          	ecall
 ret
 700:	8082                	ret

0000000000000702 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 702:	48c9                	li	a7,18
 ecall
 704:	00000073          	ecall
 ret
 708:	8082                	ret

000000000000070a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 70a:	48a1                	li	a7,8
 ecall
 70c:	00000073          	ecall
 ret
 710:	8082                	ret

0000000000000712 <link>:
.global link
link:
 li a7, SYS_link
 712:	48cd                	li	a7,19
 ecall
 714:	00000073          	ecall
 ret
 718:	8082                	ret

000000000000071a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 71a:	48d1                	li	a7,20
 ecall
 71c:	00000073          	ecall
 ret
 720:	8082                	ret

0000000000000722 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 722:	48a5                	li	a7,9
 ecall
 724:	00000073          	ecall
 ret
 728:	8082                	ret

000000000000072a <dup>:
.global dup
dup:
 li a7, SYS_dup
 72a:	48a9                	li	a7,10
 ecall
 72c:	00000073          	ecall
 ret
 730:	8082                	ret

0000000000000732 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 732:	48ad                	li	a7,11
 ecall
 734:	00000073          	ecall
 ret
 738:	8082                	ret

000000000000073a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 73a:	48b1                	li	a7,12
 ecall
 73c:	00000073          	ecall
 ret
 740:	8082                	ret

0000000000000742 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 742:	48b5                	li	a7,13
 ecall
 744:	00000073          	ecall
 ret
 748:	8082                	ret

000000000000074a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 74a:	48b9                	li	a7,14
 ecall
 74c:	00000073          	ecall
 ret
 750:	8082                	ret

0000000000000752 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 752:	1101                	addi	sp,sp,-32
 754:	ec06                	sd	ra,24(sp)
 756:	e822                	sd	s0,16(sp)
 758:	1000                	addi	s0,sp,32
 75a:	87aa                	mv	a5,a0
 75c:	872e                	mv	a4,a1
 75e:	fef42623          	sw	a5,-20(s0)
 762:	87ba                	mv	a5,a4
 764:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 768:	feb40713          	addi	a4,s0,-21
 76c:	fec42783          	lw	a5,-20(s0)
 770:	4605                	li	a2,1
 772:	85ba                	mv	a1,a4
 774:	853e                	mv	a0,a5
 776:	00000097          	auipc	ra,0x0
 77a:	f5c080e7          	jalr	-164(ra) # 6d2 <write>
}
 77e:	0001                	nop
 780:	60e2                	ld	ra,24(sp)
 782:	6442                	ld	s0,16(sp)
 784:	6105                	addi	sp,sp,32
 786:	8082                	ret

0000000000000788 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 788:	7139                	addi	sp,sp,-64
 78a:	fc06                	sd	ra,56(sp)
 78c:	f822                	sd	s0,48(sp)
 78e:	0080                	addi	s0,sp,64
 790:	87aa                	mv	a5,a0
 792:	8736                	mv	a4,a3
 794:	fcf42623          	sw	a5,-52(s0)
 798:	87ae                	mv	a5,a1
 79a:	fcf42423          	sw	a5,-56(s0)
 79e:	87b2                	mv	a5,a2
 7a0:	fcf42223          	sw	a5,-60(s0)
 7a4:	87ba                	mv	a5,a4
 7a6:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7aa:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 7ae:	fc042783          	lw	a5,-64(s0)
 7b2:	2781                	sext.w	a5,a5
 7b4:	c38d                	beqz	a5,7d6 <printint+0x4e>
 7b6:	fc842783          	lw	a5,-56(s0)
 7ba:	2781                	sext.w	a5,a5
 7bc:	0007dd63          	bgez	a5,7d6 <printint+0x4e>
    neg = 1;
 7c0:	4785                	li	a5,1
 7c2:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 7c6:	fc842783          	lw	a5,-56(s0)
 7ca:	40f007bb          	negw	a5,a5
 7ce:	2781                	sext.w	a5,a5
 7d0:	fef42223          	sw	a5,-28(s0)
 7d4:	a029                	j	7de <printint+0x56>
  } else {
    x = xx;
 7d6:	fc842783          	lw	a5,-56(s0)
 7da:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 7de:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 7e2:	fc442783          	lw	a5,-60(s0)
 7e6:	fe442703          	lw	a4,-28(s0)
 7ea:	02f777bb          	remuw	a5,a4,a5
 7ee:	0007861b          	sext.w	a2,a5
 7f2:	fec42783          	lw	a5,-20(s0)
 7f6:	0017871b          	addiw	a4,a5,1
 7fa:	fee42623          	sw	a4,-20(s0)
 7fe:	00000697          	auipc	a3,0x0
 802:	76268693          	addi	a3,a3,1890 # f60 <digits>
 806:	02061713          	slli	a4,a2,0x20
 80a:	9301                	srli	a4,a4,0x20
 80c:	9736                	add	a4,a4,a3
 80e:	00074703          	lbu	a4,0(a4)
 812:	ff040693          	addi	a3,s0,-16
 816:	97b6                	add	a5,a5,a3
 818:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 81c:	fc442783          	lw	a5,-60(s0)
 820:	fe442703          	lw	a4,-28(s0)
 824:	02f757bb          	divuw	a5,a4,a5
 828:	fef42223          	sw	a5,-28(s0)
 82c:	fe442783          	lw	a5,-28(s0)
 830:	2781                	sext.w	a5,a5
 832:	fbc5                	bnez	a5,7e2 <printint+0x5a>
  if(neg)
 834:	fe842783          	lw	a5,-24(s0)
 838:	2781                	sext.w	a5,a5
 83a:	cf95                	beqz	a5,876 <printint+0xee>
    buf[i++] = '-';
 83c:	fec42783          	lw	a5,-20(s0)
 840:	0017871b          	addiw	a4,a5,1
 844:	fee42623          	sw	a4,-20(s0)
 848:	ff040713          	addi	a4,s0,-16
 84c:	97ba                	add	a5,a5,a4
 84e:	02d00713          	li	a4,45
 852:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 856:	a005                	j	876 <printint+0xee>
    putc(fd, buf[i]);
 858:	fec42783          	lw	a5,-20(s0)
 85c:	ff040713          	addi	a4,s0,-16
 860:	97ba                	add	a5,a5,a4
 862:	fe07c703          	lbu	a4,-32(a5)
 866:	fcc42783          	lw	a5,-52(s0)
 86a:	85ba                	mv	a1,a4
 86c:	853e                	mv	a0,a5
 86e:	00000097          	auipc	ra,0x0
 872:	ee4080e7          	jalr	-284(ra) # 752 <putc>
  while(--i >= 0)
 876:	fec42783          	lw	a5,-20(s0)
 87a:	37fd                	addiw	a5,a5,-1
 87c:	fef42623          	sw	a5,-20(s0)
 880:	fec42783          	lw	a5,-20(s0)
 884:	2781                	sext.w	a5,a5
 886:	fc07d9e3          	bgez	a5,858 <printint+0xd0>
}
 88a:	0001                	nop
 88c:	0001                	nop
 88e:	70e2                	ld	ra,56(sp)
 890:	7442                	ld	s0,48(sp)
 892:	6121                	addi	sp,sp,64
 894:	8082                	ret

0000000000000896 <printptr>:

static void
printptr(int fd, uint64 x) {
 896:	7179                	addi	sp,sp,-48
 898:	f406                	sd	ra,40(sp)
 89a:	f022                	sd	s0,32(sp)
 89c:	1800                	addi	s0,sp,48
 89e:	87aa                	mv	a5,a0
 8a0:	fcb43823          	sd	a1,-48(s0)
 8a4:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 8a8:	fdc42783          	lw	a5,-36(s0)
 8ac:	03000593          	li	a1,48
 8b0:	853e                	mv	a0,a5
 8b2:	00000097          	auipc	ra,0x0
 8b6:	ea0080e7          	jalr	-352(ra) # 752 <putc>
  putc(fd, 'x');
 8ba:	fdc42783          	lw	a5,-36(s0)
 8be:	07800593          	li	a1,120
 8c2:	853e                	mv	a0,a5
 8c4:	00000097          	auipc	ra,0x0
 8c8:	e8e080e7          	jalr	-370(ra) # 752 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8cc:	fe042623          	sw	zero,-20(s0)
 8d0:	a82d                	j	90a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 8d2:	fd043783          	ld	a5,-48(s0)
 8d6:	93f1                	srli	a5,a5,0x3c
 8d8:	00000717          	auipc	a4,0x0
 8dc:	68870713          	addi	a4,a4,1672 # f60 <digits>
 8e0:	97ba                	add	a5,a5,a4
 8e2:	0007c703          	lbu	a4,0(a5)
 8e6:	fdc42783          	lw	a5,-36(s0)
 8ea:	85ba                	mv	a1,a4
 8ec:	853e                	mv	a0,a5
 8ee:	00000097          	auipc	ra,0x0
 8f2:	e64080e7          	jalr	-412(ra) # 752 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8f6:	fec42783          	lw	a5,-20(s0)
 8fa:	2785                	addiw	a5,a5,1
 8fc:	fef42623          	sw	a5,-20(s0)
 900:	fd043783          	ld	a5,-48(s0)
 904:	0792                	slli	a5,a5,0x4
 906:	fcf43823          	sd	a5,-48(s0)
 90a:	fec42783          	lw	a5,-20(s0)
 90e:	873e                	mv	a4,a5
 910:	47bd                	li	a5,15
 912:	fce7f0e3          	bgeu	a5,a4,8d2 <printptr+0x3c>
}
 916:	0001                	nop
 918:	0001                	nop
 91a:	70a2                	ld	ra,40(sp)
 91c:	7402                	ld	s0,32(sp)
 91e:	6145                	addi	sp,sp,48
 920:	8082                	ret

0000000000000922 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 922:	715d                	addi	sp,sp,-80
 924:	e486                	sd	ra,72(sp)
 926:	e0a2                	sd	s0,64(sp)
 928:	0880                	addi	s0,sp,80
 92a:	87aa                	mv	a5,a0
 92c:	fcb43023          	sd	a1,-64(s0)
 930:	fac43c23          	sd	a2,-72(s0)
 934:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 938:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 93c:	fe042223          	sw	zero,-28(s0)
 940:	a42d                	j	b6a <vprintf+0x248>
    c = fmt[i] & 0xff;
 942:	fe442783          	lw	a5,-28(s0)
 946:	fc043703          	ld	a4,-64(s0)
 94a:	97ba                	add	a5,a5,a4
 94c:	0007c783          	lbu	a5,0(a5)
 950:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 954:	fe042783          	lw	a5,-32(s0)
 958:	2781                	sext.w	a5,a5
 95a:	eb9d                	bnez	a5,990 <vprintf+0x6e>
      if(c == '%'){
 95c:	fdc42783          	lw	a5,-36(s0)
 960:	0007871b          	sext.w	a4,a5
 964:	02500793          	li	a5,37
 968:	00f71763          	bne	a4,a5,976 <vprintf+0x54>
        state = '%';
 96c:	02500793          	li	a5,37
 970:	fef42023          	sw	a5,-32(s0)
 974:	a2f5                	j	b60 <vprintf+0x23e>
      } else {
        putc(fd, c);
 976:	fdc42783          	lw	a5,-36(s0)
 97a:	0ff7f713          	andi	a4,a5,255
 97e:	fcc42783          	lw	a5,-52(s0)
 982:	85ba                	mv	a1,a4
 984:	853e                	mv	a0,a5
 986:	00000097          	auipc	ra,0x0
 98a:	dcc080e7          	jalr	-564(ra) # 752 <putc>
 98e:	aac9                	j	b60 <vprintf+0x23e>
      }
    } else if(state == '%'){
 990:	fe042783          	lw	a5,-32(s0)
 994:	0007871b          	sext.w	a4,a5
 998:	02500793          	li	a5,37
 99c:	1cf71263          	bne	a4,a5,b60 <vprintf+0x23e>
      if(c == 'd'){
 9a0:	fdc42783          	lw	a5,-36(s0)
 9a4:	0007871b          	sext.w	a4,a5
 9a8:	06400793          	li	a5,100
 9ac:	02f71463          	bne	a4,a5,9d4 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 9b0:	fb843783          	ld	a5,-72(s0)
 9b4:	00878713          	addi	a4,a5,8
 9b8:	fae43c23          	sd	a4,-72(s0)
 9bc:	4398                	lw	a4,0(a5)
 9be:	fcc42783          	lw	a5,-52(s0)
 9c2:	4685                	li	a3,1
 9c4:	4629                	li	a2,10
 9c6:	85ba                	mv	a1,a4
 9c8:	853e                	mv	a0,a5
 9ca:	00000097          	auipc	ra,0x0
 9ce:	dbe080e7          	jalr	-578(ra) # 788 <printint>
 9d2:	a269                	j	b5c <vprintf+0x23a>
      } else if(c == 'l') {
 9d4:	fdc42783          	lw	a5,-36(s0)
 9d8:	0007871b          	sext.w	a4,a5
 9dc:	06c00793          	li	a5,108
 9e0:	02f71663          	bne	a4,a5,a0c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 9e4:	fb843783          	ld	a5,-72(s0)
 9e8:	00878713          	addi	a4,a5,8
 9ec:	fae43c23          	sd	a4,-72(s0)
 9f0:	639c                	ld	a5,0(a5)
 9f2:	0007871b          	sext.w	a4,a5
 9f6:	fcc42783          	lw	a5,-52(s0)
 9fa:	4681                	li	a3,0
 9fc:	4629                	li	a2,10
 9fe:	85ba                	mv	a1,a4
 a00:	853e                	mv	a0,a5
 a02:	00000097          	auipc	ra,0x0
 a06:	d86080e7          	jalr	-634(ra) # 788 <printint>
 a0a:	aa89                	j	b5c <vprintf+0x23a>
      } else if(c == 'x') {
 a0c:	fdc42783          	lw	a5,-36(s0)
 a10:	0007871b          	sext.w	a4,a5
 a14:	07800793          	li	a5,120
 a18:	02f71463          	bne	a4,a5,a40 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 a1c:	fb843783          	ld	a5,-72(s0)
 a20:	00878713          	addi	a4,a5,8
 a24:	fae43c23          	sd	a4,-72(s0)
 a28:	4398                	lw	a4,0(a5)
 a2a:	fcc42783          	lw	a5,-52(s0)
 a2e:	4681                	li	a3,0
 a30:	4641                	li	a2,16
 a32:	85ba                	mv	a1,a4
 a34:	853e                	mv	a0,a5
 a36:	00000097          	auipc	ra,0x0
 a3a:	d52080e7          	jalr	-686(ra) # 788 <printint>
 a3e:	aa39                	j	b5c <vprintf+0x23a>
      } else if(c == 'p') {
 a40:	fdc42783          	lw	a5,-36(s0)
 a44:	0007871b          	sext.w	a4,a5
 a48:	07000793          	li	a5,112
 a4c:	02f71263          	bne	a4,a5,a70 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 a50:	fb843783          	ld	a5,-72(s0)
 a54:	00878713          	addi	a4,a5,8
 a58:	fae43c23          	sd	a4,-72(s0)
 a5c:	6398                	ld	a4,0(a5)
 a5e:	fcc42783          	lw	a5,-52(s0)
 a62:	85ba                	mv	a1,a4
 a64:	853e                	mv	a0,a5
 a66:	00000097          	auipc	ra,0x0
 a6a:	e30080e7          	jalr	-464(ra) # 896 <printptr>
 a6e:	a0fd                	j	b5c <vprintf+0x23a>
      } else if(c == 's'){
 a70:	fdc42783          	lw	a5,-36(s0)
 a74:	0007871b          	sext.w	a4,a5
 a78:	07300793          	li	a5,115
 a7c:	04f71c63          	bne	a4,a5,ad4 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 a80:	fb843783          	ld	a5,-72(s0)
 a84:	00878713          	addi	a4,a5,8
 a88:	fae43c23          	sd	a4,-72(s0)
 a8c:	639c                	ld	a5,0(a5)
 a8e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 a92:	fe843783          	ld	a5,-24(s0)
 a96:	eb8d                	bnez	a5,ac8 <vprintf+0x1a6>
          s = "(null)";
 a98:	00000797          	auipc	a5,0x0
 a9c:	4c078793          	addi	a5,a5,1216 # f58 <malloc+0x186>
 aa0:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 aa4:	a015                	j	ac8 <vprintf+0x1a6>
          putc(fd, *s);
 aa6:	fe843783          	ld	a5,-24(s0)
 aaa:	0007c703          	lbu	a4,0(a5)
 aae:	fcc42783          	lw	a5,-52(s0)
 ab2:	85ba                	mv	a1,a4
 ab4:	853e                	mv	a0,a5
 ab6:	00000097          	auipc	ra,0x0
 aba:	c9c080e7          	jalr	-868(ra) # 752 <putc>
          s++;
 abe:	fe843783          	ld	a5,-24(s0)
 ac2:	0785                	addi	a5,a5,1
 ac4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 ac8:	fe843783          	ld	a5,-24(s0)
 acc:	0007c783          	lbu	a5,0(a5)
 ad0:	fbf9                	bnez	a5,aa6 <vprintf+0x184>
 ad2:	a069                	j	b5c <vprintf+0x23a>
        }
      } else if(c == 'c'){
 ad4:	fdc42783          	lw	a5,-36(s0)
 ad8:	0007871b          	sext.w	a4,a5
 adc:	06300793          	li	a5,99
 ae0:	02f71463          	bne	a4,a5,b08 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 ae4:	fb843783          	ld	a5,-72(s0)
 ae8:	00878713          	addi	a4,a5,8
 aec:	fae43c23          	sd	a4,-72(s0)
 af0:	439c                	lw	a5,0(a5)
 af2:	0ff7f713          	andi	a4,a5,255
 af6:	fcc42783          	lw	a5,-52(s0)
 afa:	85ba                	mv	a1,a4
 afc:	853e                	mv	a0,a5
 afe:	00000097          	auipc	ra,0x0
 b02:	c54080e7          	jalr	-940(ra) # 752 <putc>
 b06:	a899                	j	b5c <vprintf+0x23a>
      } else if(c == '%'){
 b08:	fdc42783          	lw	a5,-36(s0)
 b0c:	0007871b          	sext.w	a4,a5
 b10:	02500793          	li	a5,37
 b14:	00f71f63          	bne	a4,a5,b32 <vprintf+0x210>
        putc(fd, c);
 b18:	fdc42783          	lw	a5,-36(s0)
 b1c:	0ff7f713          	andi	a4,a5,255
 b20:	fcc42783          	lw	a5,-52(s0)
 b24:	85ba                	mv	a1,a4
 b26:	853e                	mv	a0,a5
 b28:	00000097          	auipc	ra,0x0
 b2c:	c2a080e7          	jalr	-982(ra) # 752 <putc>
 b30:	a035                	j	b5c <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 b32:	fcc42783          	lw	a5,-52(s0)
 b36:	02500593          	li	a1,37
 b3a:	853e                	mv	a0,a5
 b3c:	00000097          	auipc	ra,0x0
 b40:	c16080e7          	jalr	-1002(ra) # 752 <putc>
        putc(fd, c);
 b44:	fdc42783          	lw	a5,-36(s0)
 b48:	0ff7f713          	andi	a4,a5,255
 b4c:	fcc42783          	lw	a5,-52(s0)
 b50:	85ba                	mv	a1,a4
 b52:	853e                	mv	a0,a5
 b54:	00000097          	auipc	ra,0x0
 b58:	bfe080e7          	jalr	-1026(ra) # 752 <putc>
      }
      state = 0;
 b5c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 b60:	fe442783          	lw	a5,-28(s0)
 b64:	2785                	addiw	a5,a5,1
 b66:	fef42223          	sw	a5,-28(s0)
 b6a:	fe442783          	lw	a5,-28(s0)
 b6e:	fc043703          	ld	a4,-64(s0)
 b72:	97ba                	add	a5,a5,a4
 b74:	0007c783          	lbu	a5,0(a5)
 b78:	dc0795e3          	bnez	a5,942 <vprintf+0x20>
    }
  }
}
 b7c:	0001                	nop
 b7e:	0001                	nop
 b80:	60a6                	ld	ra,72(sp)
 b82:	6406                	ld	s0,64(sp)
 b84:	6161                	addi	sp,sp,80
 b86:	8082                	ret

0000000000000b88 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 b88:	7159                	addi	sp,sp,-112
 b8a:	fc06                	sd	ra,56(sp)
 b8c:	f822                	sd	s0,48(sp)
 b8e:	0080                	addi	s0,sp,64
 b90:	fcb43823          	sd	a1,-48(s0)
 b94:	e010                	sd	a2,0(s0)
 b96:	e414                	sd	a3,8(s0)
 b98:	e818                	sd	a4,16(s0)
 b9a:	ec1c                	sd	a5,24(s0)
 b9c:	03043023          	sd	a6,32(s0)
 ba0:	03143423          	sd	a7,40(s0)
 ba4:	87aa                	mv	a5,a0
 ba6:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 baa:	03040793          	addi	a5,s0,48
 bae:	fcf43423          	sd	a5,-56(s0)
 bb2:	fc843783          	ld	a5,-56(s0)
 bb6:	fd078793          	addi	a5,a5,-48
 bba:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 bbe:	fe843703          	ld	a4,-24(s0)
 bc2:	fdc42783          	lw	a5,-36(s0)
 bc6:	863a                	mv	a2,a4
 bc8:	fd043583          	ld	a1,-48(s0)
 bcc:	853e                	mv	a0,a5
 bce:	00000097          	auipc	ra,0x0
 bd2:	d54080e7          	jalr	-684(ra) # 922 <vprintf>
}
 bd6:	0001                	nop
 bd8:	70e2                	ld	ra,56(sp)
 bda:	7442                	ld	s0,48(sp)
 bdc:	6165                	addi	sp,sp,112
 bde:	8082                	ret

0000000000000be0 <printf>:

void
printf(const char *fmt, ...)
{
 be0:	7159                	addi	sp,sp,-112
 be2:	f406                	sd	ra,40(sp)
 be4:	f022                	sd	s0,32(sp)
 be6:	1800                	addi	s0,sp,48
 be8:	fca43c23          	sd	a0,-40(s0)
 bec:	e40c                	sd	a1,8(s0)
 bee:	e810                	sd	a2,16(s0)
 bf0:	ec14                	sd	a3,24(s0)
 bf2:	f018                	sd	a4,32(s0)
 bf4:	f41c                	sd	a5,40(s0)
 bf6:	03043823          	sd	a6,48(s0)
 bfa:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 bfe:	04040793          	addi	a5,s0,64
 c02:	fcf43823          	sd	a5,-48(s0)
 c06:	fd043783          	ld	a5,-48(s0)
 c0a:	fc878793          	addi	a5,a5,-56
 c0e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 c12:	fe843783          	ld	a5,-24(s0)
 c16:	863e                	mv	a2,a5
 c18:	fd843583          	ld	a1,-40(s0)
 c1c:	4505                	li	a0,1
 c1e:	00000097          	auipc	ra,0x0
 c22:	d04080e7          	jalr	-764(ra) # 922 <vprintf>
}
 c26:	0001                	nop
 c28:	70a2                	ld	ra,40(sp)
 c2a:	7402                	ld	s0,32(sp)
 c2c:	6165                	addi	sp,sp,112
 c2e:	8082                	ret

0000000000000c30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c30:	7179                	addi	sp,sp,-48
 c32:	f422                	sd	s0,40(sp)
 c34:	1800                	addi	s0,sp,48
 c36:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c3a:	fd843783          	ld	a5,-40(s0)
 c3e:	17c1                	addi	a5,a5,-16
 c40:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c44:	00000797          	auipc	a5,0x0
 c48:	54478793          	addi	a5,a5,1348 # 1188 <freep>
 c4c:	639c                	ld	a5,0(a5)
 c4e:	fef43423          	sd	a5,-24(s0)
 c52:	a815                	j	c86 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c54:	fe843783          	ld	a5,-24(s0)
 c58:	639c                	ld	a5,0(a5)
 c5a:	fe843703          	ld	a4,-24(s0)
 c5e:	00f76f63          	bltu	a4,a5,c7c <free+0x4c>
 c62:	fe043703          	ld	a4,-32(s0)
 c66:	fe843783          	ld	a5,-24(s0)
 c6a:	02e7eb63          	bltu	a5,a4,ca0 <free+0x70>
 c6e:	fe843783          	ld	a5,-24(s0)
 c72:	639c                	ld	a5,0(a5)
 c74:	fe043703          	ld	a4,-32(s0)
 c78:	02f76463          	bltu	a4,a5,ca0 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c7c:	fe843783          	ld	a5,-24(s0)
 c80:	639c                	ld	a5,0(a5)
 c82:	fef43423          	sd	a5,-24(s0)
 c86:	fe043703          	ld	a4,-32(s0)
 c8a:	fe843783          	ld	a5,-24(s0)
 c8e:	fce7f3e3          	bgeu	a5,a4,c54 <free+0x24>
 c92:	fe843783          	ld	a5,-24(s0)
 c96:	639c                	ld	a5,0(a5)
 c98:	fe043703          	ld	a4,-32(s0)
 c9c:	faf77ce3          	bgeu	a4,a5,c54 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ca0:	fe043783          	ld	a5,-32(s0)
 ca4:	479c                	lw	a5,8(a5)
 ca6:	1782                	slli	a5,a5,0x20
 ca8:	9381                	srli	a5,a5,0x20
 caa:	0792                	slli	a5,a5,0x4
 cac:	fe043703          	ld	a4,-32(s0)
 cb0:	973e                	add	a4,a4,a5
 cb2:	fe843783          	ld	a5,-24(s0)
 cb6:	639c                	ld	a5,0(a5)
 cb8:	02f71763          	bne	a4,a5,ce6 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 cbc:	fe043783          	ld	a5,-32(s0)
 cc0:	4798                	lw	a4,8(a5)
 cc2:	fe843783          	ld	a5,-24(s0)
 cc6:	639c                	ld	a5,0(a5)
 cc8:	479c                	lw	a5,8(a5)
 cca:	9fb9                	addw	a5,a5,a4
 ccc:	0007871b          	sext.w	a4,a5
 cd0:	fe043783          	ld	a5,-32(s0)
 cd4:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 cd6:	fe843783          	ld	a5,-24(s0)
 cda:	639c                	ld	a5,0(a5)
 cdc:	6398                	ld	a4,0(a5)
 cde:	fe043783          	ld	a5,-32(s0)
 ce2:	e398                	sd	a4,0(a5)
 ce4:	a039                	j	cf2 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 ce6:	fe843783          	ld	a5,-24(s0)
 cea:	6398                	ld	a4,0(a5)
 cec:	fe043783          	ld	a5,-32(s0)
 cf0:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 cf2:	fe843783          	ld	a5,-24(s0)
 cf6:	479c                	lw	a5,8(a5)
 cf8:	1782                	slli	a5,a5,0x20
 cfa:	9381                	srli	a5,a5,0x20
 cfc:	0792                	slli	a5,a5,0x4
 cfe:	fe843703          	ld	a4,-24(s0)
 d02:	97ba                	add	a5,a5,a4
 d04:	fe043703          	ld	a4,-32(s0)
 d08:	02f71563          	bne	a4,a5,d32 <free+0x102>
    p->s.size += bp->s.size;
 d0c:	fe843783          	ld	a5,-24(s0)
 d10:	4798                	lw	a4,8(a5)
 d12:	fe043783          	ld	a5,-32(s0)
 d16:	479c                	lw	a5,8(a5)
 d18:	9fb9                	addw	a5,a5,a4
 d1a:	0007871b          	sext.w	a4,a5
 d1e:	fe843783          	ld	a5,-24(s0)
 d22:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 d24:	fe043783          	ld	a5,-32(s0)
 d28:	6398                	ld	a4,0(a5)
 d2a:	fe843783          	ld	a5,-24(s0)
 d2e:	e398                	sd	a4,0(a5)
 d30:	a031                	j	d3c <free+0x10c>
  } else
    p->s.ptr = bp;
 d32:	fe843783          	ld	a5,-24(s0)
 d36:	fe043703          	ld	a4,-32(s0)
 d3a:	e398                	sd	a4,0(a5)
  freep = p;
 d3c:	00000797          	auipc	a5,0x0
 d40:	44c78793          	addi	a5,a5,1100 # 1188 <freep>
 d44:	fe843703          	ld	a4,-24(s0)
 d48:	e398                	sd	a4,0(a5)
}
 d4a:	0001                	nop
 d4c:	7422                	ld	s0,40(sp)
 d4e:	6145                	addi	sp,sp,48
 d50:	8082                	ret

0000000000000d52 <morecore>:

static Header*
morecore(uint nu)
{
 d52:	7179                	addi	sp,sp,-48
 d54:	f406                	sd	ra,40(sp)
 d56:	f022                	sd	s0,32(sp)
 d58:	1800                	addi	s0,sp,48
 d5a:	87aa                	mv	a5,a0
 d5c:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 d60:	fdc42783          	lw	a5,-36(s0)
 d64:	0007871b          	sext.w	a4,a5
 d68:	6785                	lui	a5,0x1
 d6a:	00f77563          	bgeu	a4,a5,d74 <morecore+0x22>
    nu = 4096;
 d6e:	6785                	lui	a5,0x1
 d70:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 d74:	fdc42783          	lw	a5,-36(s0)
 d78:	0047979b          	slliw	a5,a5,0x4
 d7c:	2781                	sext.w	a5,a5
 d7e:	2781                	sext.w	a5,a5
 d80:	853e                	mv	a0,a5
 d82:	00000097          	auipc	ra,0x0
 d86:	9b8080e7          	jalr	-1608(ra) # 73a <sbrk>
 d8a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 d8e:	fe843703          	ld	a4,-24(s0)
 d92:	57fd                	li	a5,-1
 d94:	00f71463          	bne	a4,a5,d9c <morecore+0x4a>
    return 0;
 d98:	4781                	li	a5,0
 d9a:	a03d                	j	dc8 <morecore+0x76>
  hp = (Header*)p;
 d9c:	fe843783          	ld	a5,-24(s0)
 da0:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 da4:	fe043783          	ld	a5,-32(s0)
 da8:	fdc42703          	lw	a4,-36(s0)
 dac:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 dae:	fe043783          	ld	a5,-32(s0)
 db2:	07c1                	addi	a5,a5,16
 db4:	853e                	mv	a0,a5
 db6:	00000097          	auipc	ra,0x0
 dba:	e7a080e7          	jalr	-390(ra) # c30 <free>
  return freep;
 dbe:	00000797          	auipc	a5,0x0
 dc2:	3ca78793          	addi	a5,a5,970 # 1188 <freep>
 dc6:	639c                	ld	a5,0(a5)
}
 dc8:	853e                	mv	a0,a5
 dca:	70a2                	ld	ra,40(sp)
 dcc:	7402                	ld	s0,32(sp)
 dce:	6145                	addi	sp,sp,48
 dd0:	8082                	ret

0000000000000dd2 <malloc>:

void*
malloc(uint nbytes)
{
 dd2:	7139                	addi	sp,sp,-64
 dd4:	fc06                	sd	ra,56(sp)
 dd6:	f822                	sd	s0,48(sp)
 dd8:	0080                	addi	s0,sp,64
 dda:	87aa                	mv	a5,a0
 ddc:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 de0:	fcc46783          	lwu	a5,-52(s0)
 de4:	07bd                	addi	a5,a5,15
 de6:	8391                	srli	a5,a5,0x4
 de8:	2781                	sext.w	a5,a5
 dea:	2785                	addiw	a5,a5,1
 dec:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 df0:	00000797          	auipc	a5,0x0
 df4:	39878793          	addi	a5,a5,920 # 1188 <freep>
 df8:	639c                	ld	a5,0(a5)
 dfa:	fef43023          	sd	a5,-32(s0)
 dfe:	fe043783          	ld	a5,-32(s0)
 e02:	ef95                	bnez	a5,e3e <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 e04:	00000797          	auipc	a5,0x0
 e08:	37478793          	addi	a5,a5,884 # 1178 <base>
 e0c:	fef43023          	sd	a5,-32(s0)
 e10:	00000797          	auipc	a5,0x0
 e14:	37878793          	addi	a5,a5,888 # 1188 <freep>
 e18:	fe043703          	ld	a4,-32(s0)
 e1c:	e398                	sd	a4,0(a5)
 e1e:	00000797          	auipc	a5,0x0
 e22:	36a78793          	addi	a5,a5,874 # 1188 <freep>
 e26:	6398                	ld	a4,0(a5)
 e28:	00000797          	auipc	a5,0x0
 e2c:	35078793          	addi	a5,a5,848 # 1178 <base>
 e30:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 e32:	00000797          	auipc	a5,0x0
 e36:	34678793          	addi	a5,a5,838 # 1178 <base>
 e3a:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e3e:	fe043783          	ld	a5,-32(s0)
 e42:	639c                	ld	a5,0(a5)
 e44:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e48:	fe843783          	ld	a5,-24(s0)
 e4c:	4798                	lw	a4,8(a5)
 e4e:	fdc42783          	lw	a5,-36(s0)
 e52:	2781                	sext.w	a5,a5
 e54:	06f76863          	bltu	a4,a5,ec4 <malloc+0xf2>
      if(p->s.size == nunits)
 e58:	fe843783          	ld	a5,-24(s0)
 e5c:	4798                	lw	a4,8(a5)
 e5e:	fdc42783          	lw	a5,-36(s0)
 e62:	2781                	sext.w	a5,a5
 e64:	00e79963          	bne	a5,a4,e76 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 e68:	fe843783          	ld	a5,-24(s0)
 e6c:	6398                	ld	a4,0(a5)
 e6e:	fe043783          	ld	a5,-32(s0)
 e72:	e398                	sd	a4,0(a5)
 e74:	a82d                	j	eae <malloc+0xdc>
      else {
        p->s.size -= nunits;
 e76:	fe843783          	ld	a5,-24(s0)
 e7a:	4798                	lw	a4,8(a5)
 e7c:	fdc42783          	lw	a5,-36(s0)
 e80:	40f707bb          	subw	a5,a4,a5
 e84:	0007871b          	sext.w	a4,a5
 e88:	fe843783          	ld	a5,-24(s0)
 e8c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 e8e:	fe843783          	ld	a5,-24(s0)
 e92:	479c                	lw	a5,8(a5)
 e94:	1782                	slli	a5,a5,0x20
 e96:	9381                	srli	a5,a5,0x20
 e98:	0792                	slli	a5,a5,0x4
 e9a:	fe843703          	ld	a4,-24(s0)
 e9e:	97ba                	add	a5,a5,a4
 ea0:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 ea4:	fe843783          	ld	a5,-24(s0)
 ea8:	fdc42703          	lw	a4,-36(s0)
 eac:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 eae:	00000797          	auipc	a5,0x0
 eb2:	2da78793          	addi	a5,a5,730 # 1188 <freep>
 eb6:	fe043703          	ld	a4,-32(s0)
 eba:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 ebc:	fe843783          	ld	a5,-24(s0)
 ec0:	07c1                	addi	a5,a5,16
 ec2:	a091                	j	f06 <malloc+0x134>
    }
    if(p == freep)
 ec4:	00000797          	auipc	a5,0x0
 ec8:	2c478793          	addi	a5,a5,708 # 1188 <freep>
 ecc:	639c                	ld	a5,0(a5)
 ece:	fe843703          	ld	a4,-24(s0)
 ed2:	02f71063          	bne	a4,a5,ef2 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 ed6:	fdc42783          	lw	a5,-36(s0)
 eda:	853e                	mv	a0,a5
 edc:	00000097          	auipc	ra,0x0
 ee0:	e76080e7          	jalr	-394(ra) # d52 <morecore>
 ee4:	fea43423          	sd	a0,-24(s0)
 ee8:	fe843783          	ld	a5,-24(s0)
 eec:	e399                	bnez	a5,ef2 <malloc+0x120>
        return 0;
 eee:	4781                	li	a5,0
 ef0:	a819                	j	f06 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ef2:	fe843783          	ld	a5,-24(s0)
 ef6:	fef43023          	sd	a5,-32(s0)
 efa:	fe843783          	ld	a5,-24(s0)
 efe:	639c                	ld	a5,0(a5)
 f00:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 f04:	b791                	j	e48 <malloc+0x76>
  }
}
 f06:	853e                	mv	a0,a5
 f08:	70e2                	ld	ra,56(sp)
 f0a:	7442                	ld	s0,48(sp)
 f0c:	6121                	addi	sp,sp,64
 f0e:	8082                	ret
