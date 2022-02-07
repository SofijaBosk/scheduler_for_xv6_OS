
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	0080                	addi	s0,sp,64
       8:	fca43423          	sd	a0,-56(s0)
       c:	87ae                	mv	a5,a1
       e:	fcf42223          	sw	a5,-60(s0)
  int n, m;
  char *p, *q;

  m = 0;
      12:	fe042623          	sw	zero,-20(s0)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      16:	a8f9                	j	f4 <grep+0xf4>
    m += n;
      18:	fec42703          	lw	a4,-20(s0)
      1c:	fdc42783          	lw	a5,-36(s0)
      20:	9fb9                	addw	a5,a5,a4
      22:	fef42623          	sw	a5,-20(s0)
    buf[m] = '\0';
      26:	00001717          	auipc	a4,0x1
      2a:	13a70713          	addi	a4,a4,314 # 1160 <buf>
      2e:	fec42783          	lw	a5,-20(s0)
      32:	97ba                	add	a5,a5,a4
      34:	00078023          	sb	zero,0(a5)
    p = buf;
      38:	00001797          	auipc	a5,0x1
      3c:	12878793          	addi	a5,a5,296 # 1160 <buf>
      40:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      44:	a891                	j	98 <grep+0x98>
      *q = 0;
      46:	fd043783          	ld	a5,-48(s0)
      4a:	00078023          	sb	zero,0(a5)
      if(match(pattern, p)){
      4e:	fe043583          	ld	a1,-32(s0)
      52:	fc843503          	ld	a0,-56(s0)
      56:	00000097          	auipc	ra,0x0
      5a:	1fa080e7          	jalr	506(ra) # 250 <match>
      5e:	87aa                	mv	a5,a0
      60:	c79d                	beqz	a5,8e <grep+0x8e>
        *q = '\n';
      62:	fd043783          	ld	a5,-48(s0)
      66:	4729                	li	a4,10
      68:	00e78023          	sb	a4,0(a5)
        write(1, p, q+1 - p);
      6c:	fd043783          	ld	a5,-48(s0)
      70:	00178713          	addi	a4,a5,1
      74:	fe043783          	ld	a5,-32(s0)
      78:	40f707b3          	sub	a5,a4,a5
      7c:	2781                	sext.w	a5,a5
      7e:	863e                	mv	a2,a5
      80:	fe043583          	ld	a1,-32(s0)
      84:	4505                	li	a0,1
      86:	00001097          	auipc	ra,0x1
      8a:	842080e7          	jalr	-1982(ra) # 8c8 <write>
      }
      p = q+1;
      8e:	fd043783          	ld	a5,-48(s0)
      92:	0785                	addi	a5,a5,1
      94:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      98:	45a9                	li	a1,10
      9a:	fe043503          	ld	a0,-32(s0)
      9e:	00000097          	auipc	ra,0x0
      a2:	4c0080e7          	jalr	1216(ra) # 55e <strchr>
      a6:	fca43823          	sd	a0,-48(s0)
      aa:	fd043783          	ld	a5,-48(s0)
      ae:	ffc1                	bnez	a5,46 <grep+0x46>
    }
    if(m > 0){
      b0:	fec42783          	lw	a5,-20(s0)
      b4:	2781                	sext.w	a5,a5
      b6:	02f05f63          	blez	a5,f4 <grep+0xf4>
      m -= p - buf;
      ba:	fec42703          	lw	a4,-20(s0)
      be:	fe043683          	ld	a3,-32(s0)
      c2:	00001797          	auipc	a5,0x1
      c6:	09e78793          	addi	a5,a5,158 # 1160 <buf>
      ca:	40f687b3          	sub	a5,a3,a5
      ce:	2781                	sext.w	a5,a5
      d0:	40f707bb          	subw	a5,a4,a5
      d4:	2781                	sext.w	a5,a5
      d6:	fef42623          	sw	a5,-20(s0)
      memmove(buf, p, m);
      da:	fec42783          	lw	a5,-20(s0)
      de:	863e                	mv	a2,a5
      e0:	fe043583          	ld	a1,-32(s0)
      e4:	00001517          	auipc	a0,0x1
      e8:	07c50513          	addi	a0,a0,124 # 1160 <buf>
      ec:	00000097          	auipc	ra,0x0
      f0:	636080e7          	jalr	1590(ra) # 722 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      f4:	fec42703          	lw	a4,-20(s0)
      f8:	00001797          	auipc	a5,0x1
      fc:	06878793          	addi	a5,a5,104 # 1160 <buf>
     100:	00f706b3          	add	a3,a4,a5
     104:	fec42783          	lw	a5,-20(s0)
     108:	3ff00713          	li	a4,1023
     10c:	40f707bb          	subw	a5,a4,a5
     110:	2781                	sext.w	a5,a5
     112:	0007871b          	sext.w	a4,a5
     116:	fc442783          	lw	a5,-60(s0)
     11a:	863a                	mv	a2,a4
     11c:	85b6                	mv	a1,a3
     11e:	853e                	mv	a0,a5
     120:	00000097          	auipc	ra,0x0
     124:	7a0080e7          	jalr	1952(ra) # 8c0 <read>
     128:	87aa                	mv	a5,a0
     12a:	fcf42e23          	sw	a5,-36(s0)
     12e:	fdc42783          	lw	a5,-36(s0)
     132:	2781                	sext.w	a5,a5
     134:	eef042e3          	bgtz	a5,18 <grep+0x18>
    }
  }
}
     138:	0001                	nop
     13a:	0001                	nop
     13c:	70e2                	ld	ra,56(sp)
     13e:	7442                	ld	s0,48(sp)
     140:	6121                	addi	sp,sp,64
     142:	8082                	ret

0000000000000144 <main>:

int
main(int argc, char *argv[])
{
     144:	7139                	addi	sp,sp,-64
     146:	fc06                	sd	ra,56(sp)
     148:	f822                	sd	s0,48(sp)
     14a:	0080                	addi	s0,sp,64
     14c:	87aa                	mv	a5,a0
     14e:	fcb43023          	sd	a1,-64(s0)
     152:	fcf42623          	sw	a5,-52(s0)
  int fd, i;
  char *pattern;

  if(argc <= 1){
     156:	fcc42783          	lw	a5,-52(s0)
     15a:	0007871b          	sext.w	a4,a5
     15e:	4785                	li	a5,1
     160:	02e7c063          	blt	a5,a4,180 <main+0x3c>
    fprintf(2, "usage: grep pattern [file ...]\n");
     164:	00001597          	auipc	a1,0x1
     168:	fa458593          	addi	a1,a1,-92 # 1108 <malloc+0x140>
     16c:	4509                	li	a0,2
     16e:	00001097          	auipc	ra,0x1
     172:	c10080e7          	jalr	-1008(ra) # d7e <fprintf>
    exit(1);
     176:	4505                	li	a0,1
     178:	00000097          	auipc	ra,0x0
     17c:	730080e7          	jalr	1840(ra) # 8a8 <exit>
  }
  pattern = argv[1];
     180:	fc043783          	ld	a5,-64(s0)
     184:	679c                	ld	a5,8(a5)
     186:	fef43023          	sd	a5,-32(s0)

  if(argc <= 2){
     18a:	fcc42783          	lw	a5,-52(s0)
     18e:	0007871b          	sext.w	a4,a5
     192:	4789                	li	a5,2
     194:	00e7ce63          	blt	a5,a4,1b0 <main+0x6c>
    grep(pattern, 0);
     198:	4581                	li	a1,0
     19a:	fe043503          	ld	a0,-32(s0)
     19e:	00000097          	auipc	ra,0x0
     1a2:	e62080e7          	jalr	-414(ra) # 0 <grep>
    exit(0);
     1a6:	4501                	li	a0,0
     1a8:	00000097          	auipc	ra,0x0
     1ac:	700080e7          	jalr	1792(ra) # 8a8 <exit>
  }

  for(i = 2; i < argc; i++){
     1b0:	4789                	li	a5,2
     1b2:	fef42623          	sw	a5,-20(s0)
     1b6:	a041                	j	236 <main+0xf2>
    if((fd = open(argv[i], 0)) < 0){
     1b8:	fec42783          	lw	a5,-20(s0)
     1bc:	078e                	slli	a5,a5,0x3
     1be:	fc043703          	ld	a4,-64(s0)
     1c2:	97ba                	add	a5,a5,a4
     1c4:	639c                	ld	a5,0(a5)
     1c6:	4581                	li	a1,0
     1c8:	853e                	mv	a0,a5
     1ca:	00000097          	auipc	ra,0x0
     1ce:	71e080e7          	jalr	1822(ra) # 8e8 <open>
     1d2:	87aa                	mv	a5,a0
     1d4:	fcf42e23          	sw	a5,-36(s0)
     1d8:	fdc42783          	lw	a5,-36(s0)
     1dc:	2781                	sext.w	a5,a5
     1de:	0207d763          	bgez	a5,20c <main+0xc8>
      printf("grep: cannot open %s\n", argv[i]);
     1e2:	fec42783          	lw	a5,-20(s0)
     1e6:	078e                	slli	a5,a5,0x3
     1e8:	fc043703          	ld	a4,-64(s0)
     1ec:	97ba                	add	a5,a5,a4
     1ee:	639c                	ld	a5,0(a5)
     1f0:	85be                	mv	a1,a5
     1f2:	00001517          	auipc	a0,0x1
     1f6:	f3650513          	addi	a0,a0,-202 # 1128 <malloc+0x160>
     1fa:	00001097          	auipc	ra,0x1
     1fe:	bdc080e7          	jalr	-1060(ra) # dd6 <printf>
      exit(1);
     202:	4505                	li	a0,1
     204:	00000097          	auipc	ra,0x0
     208:	6a4080e7          	jalr	1700(ra) # 8a8 <exit>
    }
    grep(pattern, fd);
     20c:	fdc42783          	lw	a5,-36(s0)
     210:	85be                	mv	a1,a5
     212:	fe043503          	ld	a0,-32(s0)
     216:	00000097          	auipc	ra,0x0
     21a:	dea080e7          	jalr	-534(ra) # 0 <grep>
    close(fd);
     21e:	fdc42783          	lw	a5,-36(s0)
     222:	853e                	mv	a0,a5
     224:	00000097          	auipc	ra,0x0
     228:	6ac080e7          	jalr	1708(ra) # 8d0 <close>
  for(i = 2; i < argc; i++){
     22c:	fec42783          	lw	a5,-20(s0)
     230:	2785                	addiw	a5,a5,1
     232:	fef42623          	sw	a5,-20(s0)
     236:	fec42703          	lw	a4,-20(s0)
     23a:	fcc42783          	lw	a5,-52(s0)
     23e:	2701                	sext.w	a4,a4
     240:	2781                	sext.w	a5,a5
     242:	f6f74be3          	blt	a4,a5,1b8 <main+0x74>
  }
  exit(0);
     246:	4501                	li	a0,0
     248:	00000097          	auipc	ra,0x0
     24c:	660080e7          	jalr	1632(ra) # 8a8 <exit>

0000000000000250 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     250:	1101                	addi	sp,sp,-32
     252:	ec06                	sd	ra,24(sp)
     254:	e822                	sd	s0,16(sp)
     256:	1000                	addi	s0,sp,32
     258:	fea43423          	sd	a0,-24(s0)
     25c:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '^')
     260:	fe843783          	ld	a5,-24(s0)
     264:	0007c783          	lbu	a5,0(a5)
     268:	873e                	mv	a4,a5
     26a:	05e00793          	li	a5,94
     26e:	00f71e63          	bne	a4,a5,28a <match+0x3a>
    return matchhere(re+1, text);
     272:	fe843783          	ld	a5,-24(s0)
     276:	0785                	addi	a5,a5,1
     278:	fe043583          	ld	a1,-32(s0)
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	042080e7          	jalr	66(ra) # 2c0 <matchhere>
     286:	87aa                	mv	a5,a0
     288:	a03d                	j	2b6 <match+0x66>
  do{  // must look at empty string
    if(matchhere(re, text))
     28a:	fe043583          	ld	a1,-32(s0)
     28e:	fe843503          	ld	a0,-24(s0)
     292:	00000097          	auipc	ra,0x0
     296:	02e080e7          	jalr	46(ra) # 2c0 <matchhere>
     29a:	87aa                	mv	a5,a0
     29c:	c399                	beqz	a5,2a2 <match+0x52>
      return 1;
     29e:	4785                	li	a5,1
     2a0:	a819                	j	2b6 <match+0x66>
  }while(*text++ != '\0');
     2a2:	fe043783          	ld	a5,-32(s0)
     2a6:	00178713          	addi	a4,a5,1
     2aa:	fee43023          	sd	a4,-32(s0)
     2ae:	0007c783          	lbu	a5,0(a5)
     2b2:	ffe1                	bnez	a5,28a <match+0x3a>
  return 0;
     2b4:	4781                	li	a5,0
}
     2b6:	853e                	mv	a0,a5
     2b8:	60e2                	ld	ra,24(sp)
     2ba:	6442                	ld	s0,16(sp)
     2bc:	6105                	addi	sp,sp,32
     2be:	8082                	ret

00000000000002c0 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2c0:	1101                	addi	sp,sp,-32
     2c2:	ec06                	sd	ra,24(sp)
     2c4:	e822                	sd	s0,16(sp)
     2c6:	1000                	addi	s0,sp,32
     2c8:	fea43423          	sd	a0,-24(s0)
     2cc:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '\0')
     2d0:	fe843783          	ld	a5,-24(s0)
     2d4:	0007c783          	lbu	a5,0(a5)
     2d8:	e399                	bnez	a5,2de <matchhere+0x1e>
    return 1;
     2da:	4785                	li	a5,1
     2dc:	a0c1                	j	39c <matchhere+0xdc>
  if(re[1] == '*')
     2de:	fe843783          	ld	a5,-24(s0)
     2e2:	0785                	addi	a5,a5,1
     2e4:	0007c783          	lbu	a5,0(a5)
     2e8:	873e                	mv	a4,a5
     2ea:	02a00793          	li	a5,42
     2ee:	02f71563          	bne	a4,a5,318 <matchhere+0x58>
    return matchstar(re[0], re+2, text);
     2f2:	fe843783          	ld	a5,-24(s0)
     2f6:	0007c783          	lbu	a5,0(a5)
     2fa:	0007871b          	sext.w	a4,a5
     2fe:	fe843783          	ld	a5,-24(s0)
     302:	0789                	addi	a5,a5,2
     304:	fe043603          	ld	a2,-32(s0)
     308:	85be                	mv	a1,a5
     30a:	853a                	mv	a0,a4
     30c:	00000097          	auipc	ra,0x0
     310:	09a080e7          	jalr	154(ra) # 3a6 <matchstar>
     314:	87aa                	mv	a5,a0
     316:	a059                	j	39c <matchhere+0xdc>
  if(re[0] == '$' && re[1] == '\0')
     318:	fe843783          	ld	a5,-24(s0)
     31c:	0007c783          	lbu	a5,0(a5)
     320:	873e                	mv	a4,a5
     322:	02400793          	li	a5,36
     326:	02f71363          	bne	a4,a5,34c <matchhere+0x8c>
     32a:	fe843783          	ld	a5,-24(s0)
     32e:	0785                	addi	a5,a5,1
     330:	0007c783          	lbu	a5,0(a5)
     334:	ef81                	bnez	a5,34c <matchhere+0x8c>
    return *text == '\0';
     336:	fe043783          	ld	a5,-32(s0)
     33a:	0007c783          	lbu	a5,0(a5)
     33e:	2781                	sext.w	a5,a5
     340:	0017b793          	seqz	a5,a5
     344:	0ff7f793          	andi	a5,a5,255
     348:	2781                	sext.w	a5,a5
     34a:	a889                	j	39c <matchhere+0xdc>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     34c:	fe043783          	ld	a5,-32(s0)
     350:	0007c783          	lbu	a5,0(a5)
     354:	c3b9                	beqz	a5,39a <matchhere+0xda>
     356:	fe843783          	ld	a5,-24(s0)
     35a:	0007c783          	lbu	a5,0(a5)
     35e:	873e                	mv	a4,a5
     360:	02e00793          	li	a5,46
     364:	00f70c63          	beq	a4,a5,37c <matchhere+0xbc>
     368:	fe843783          	ld	a5,-24(s0)
     36c:	0007c703          	lbu	a4,0(a5)
     370:	fe043783          	ld	a5,-32(s0)
     374:	0007c783          	lbu	a5,0(a5)
     378:	02f71163          	bne	a4,a5,39a <matchhere+0xda>
    return matchhere(re+1, text+1);
     37c:	fe843783          	ld	a5,-24(s0)
     380:	00178713          	addi	a4,a5,1
     384:	fe043783          	ld	a5,-32(s0)
     388:	0785                	addi	a5,a5,1
     38a:	85be                	mv	a1,a5
     38c:	853a                	mv	a0,a4
     38e:	00000097          	auipc	ra,0x0
     392:	f32080e7          	jalr	-206(ra) # 2c0 <matchhere>
     396:	87aa                	mv	a5,a0
     398:	a011                	j	39c <matchhere+0xdc>
  return 0;
     39a:	4781                	li	a5,0
}
     39c:	853e                	mv	a0,a5
     39e:	60e2                	ld	ra,24(sp)
     3a0:	6442                	ld	s0,16(sp)
     3a2:	6105                	addi	sp,sp,32
     3a4:	8082                	ret

00000000000003a6 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3a6:	7179                	addi	sp,sp,-48
     3a8:	f406                	sd	ra,40(sp)
     3aa:	f022                	sd	s0,32(sp)
     3ac:	1800                	addi	s0,sp,48
     3ae:	87aa                	mv	a5,a0
     3b0:	feb43023          	sd	a1,-32(s0)
     3b4:	fcc43c23          	sd	a2,-40(s0)
     3b8:	fef42623          	sw	a5,-20(s0)
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     3bc:	fd843583          	ld	a1,-40(s0)
     3c0:	fe043503          	ld	a0,-32(s0)
     3c4:	00000097          	auipc	ra,0x0
     3c8:	efc080e7          	jalr	-260(ra) # 2c0 <matchhere>
     3cc:	87aa                	mv	a5,a0
     3ce:	c399                	beqz	a5,3d4 <matchstar+0x2e>
      return 1;
     3d0:	4785                	li	a5,1
     3d2:	a835                	j	40e <matchstar+0x68>
  }while(*text!='\0' && (*text++==c || c=='.'));
     3d4:	fd843783          	ld	a5,-40(s0)
     3d8:	0007c783          	lbu	a5,0(a5)
     3dc:	cb85                	beqz	a5,40c <matchstar+0x66>
     3de:	fd843783          	ld	a5,-40(s0)
     3e2:	00178713          	addi	a4,a5,1
     3e6:	fce43c23          	sd	a4,-40(s0)
     3ea:	0007c783          	lbu	a5,0(a5)
     3ee:	0007871b          	sext.w	a4,a5
     3f2:	fec42783          	lw	a5,-20(s0)
     3f6:	2781                	sext.w	a5,a5
     3f8:	fce782e3          	beq	a5,a4,3bc <matchstar+0x16>
     3fc:	fec42783          	lw	a5,-20(s0)
     400:	0007871b          	sext.w	a4,a5
     404:	02e00793          	li	a5,46
     408:	faf70ae3          	beq	a4,a5,3bc <matchstar+0x16>
  return 0;
     40c:	4781                	li	a5,0
}
     40e:	853e                	mv	a0,a5
     410:	70a2                	ld	ra,40(sp)
     412:	7402                	ld	s0,32(sp)
     414:	6145                	addi	sp,sp,48
     416:	8082                	ret

0000000000000418 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     418:	7179                	addi	sp,sp,-48
     41a:	f422                	sd	s0,40(sp)
     41c:	1800                	addi	s0,sp,48
     41e:	fca43c23          	sd	a0,-40(s0)
     422:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     426:	fd843783          	ld	a5,-40(s0)
     42a:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     42e:	0001                	nop
     430:	fd043703          	ld	a4,-48(s0)
     434:	00170793          	addi	a5,a4,1
     438:	fcf43823          	sd	a5,-48(s0)
     43c:	fd843783          	ld	a5,-40(s0)
     440:	00178693          	addi	a3,a5,1
     444:	fcd43c23          	sd	a3,-40(s0)
     448:	00074703          	lbu	a4,0(a4)
     44c:	00e78023          	sb	a4,0(a5)
     450:	0007c783          	lbu	a5,0(a5)
     454:	fff1                	bnez	a5,430 <strcpy+0x18>
    ;
  return os;
     456:	fe843783          	ld	a5,-24(s0)
}
     45a:	853e                	mv	a0,a5
     45c:	7422                	ld	s0,40(sp)
     45e:	6145                	addi	sp,sp,48
     460:	8082                	ret

0000000000000462 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     462:	1101                	addi	sp,sp,-32
     464:	ec22                	sd	s0,24(sp)
     466:	1000                	addi	s0,sp,32
     468:	fea43423          	sd	a0,-24(s0)
     46c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     470:	a819                	j	486 <strcmp+0x24>
    p++, q++;
     472:	fe843783          	ld	a5,-24(s0)
     476:	0785                	addi	a5,a5,1
     478:	fef43423          	sd	a5,-24(s0)
     47c:	fe043783          	ld	a5,-32(s0)
     480:	0785                	addi	a5,a5,1
     482:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     486:	fe843783          	ld	a5,-24(s0)
     48a:	0007c783          	lbu	a5,0(a5)
     48e:	cb99                	beqz	a5,4a4 <strcmp+0x42>
     490:	fe843783          	ld	a5,-24(s0)
     494:	0007c703          	lbu	a4,0(a5)
     498:	fe043783          	ld	a5,-32(s0)
     49c:	0007c783          	lbu	a5,0(a5)
     4a0:	fcf709e3          	beq	a4,a5,472 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     4a4:	fe843783          	ld	a5,-24(s0)
     4a8:	0007c783          	lbu	a5,0(a5)
     4ac:	0007871b          	sext.w	a4,a5
     4b0:	fe043783          	ld	a5,-32(s0)
     4b4:	0007c783          	lbu	a5,0(a5)
     4b8:	2781                	sext.w	a5,a5
     4ba:	40f707bb          	subw	a5,a4,a5
     4be:	2781                	sext.w	a5,a5
}
     4c0:	853e                	mv	a0,a5
     4c2:	6462                	ld	s0,24(sp)
     4c4:	6105                	addi	sp,sp,32
     4c6:	8082                	ret

00000000000004c8 <strlen>:

uint
strlen(const char *s)
{
     4c8:	7179                	addi	sp,sp,-48
     4ca:	f422                	sd	s0,40(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     4d2:	fe042623          	sw	zero,-20(s0)
     4d6:	a031                	j	4e2 <strlen+0x1a>
     4d8:	fec42783          	lw	a5,-20(s0)
     4dc:	2785                	addiw	a5,a5,1
     4de:	fef42623          	sw	a5,-20(s0)
     4e2:	fec42783          	lw	a5,-20(s0)
     4e6:	fd843703          	ld	a4,-40(s0)
     4ea:	97ba                	add	a5,a5,a4
     4ec:	0007c783          	lbu	a5,0(a5)
     4f0:	f7e5                	bnez	a5,4d8 <strlen+0x10>
    ;
  return n;
     4f2:	fec42783          	lw	a5,-20(s0)
}
     4f6:	853e                	mv	a0,a5
     4f8:	7422                	ld	s0,40(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <memset>:

void*
memset(void *dst, int c, uint n)
{
     4fe:	7179                	addi	sp,sp,-48
     500:	f422                	sd	s0,40(sp)
     502:	1800                	addi	s0,sp,48
     504:	fca43c23          	sd	a0,-40(s0)
     508:	87ae                	mv	a5,a1
     50a:	8732                	mv	a4,a2
     50c:	fcf42a23          	sw	a5,-44(s0)
     510:	87ba                	mv	a5,a4
     512:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     516:	fd843783          	ld	a5,-40(s0)
     51a:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     51e:	fe042623          	sw	zero,-20(s0)
     522:	a00d                	j	544 <memset+0x46>
    cdst[i] = c;
     524:	fec42783          	lw	a5,-20(s0)
     528:	fe043703          	ld	a4,-32(s0)
     52c:	97ba                	add	a5,a5,a4
     52e:	fd442703          	lw	a4,-44(s0)
     532:	0ff77713          	andi	a4,a4,255
     536:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     53a:	fec42783          	lw	a5,-20(s0)
     53e:	2785                	addiw	a5,a5,1
     540:	fef42623          	sw	a5,-20(s0)
     544:	fec42703          	lw	a4,-20(s0)
     548:	fd042783          	lw	a5,-48(s0)
     54c:	2781                	sext.w	a5,a5
     54e:	fcf76be3          	bltu	a4,a5,524 <memset+0x26>
  }
  return dst;
     552:	fd843783          	ld	a5,-40(s0)
}
     556:	853e                	mv	a0,a5
     558:	7422                	ld	s0,40(sp)
     55a:	6145                	addi	sp,sp,48
     55c:	8082                	ret

000000000000055e <strchr>:

char*
strchr(const char *s, char c)
{
     55e:	1101                	addi	sp,sp,-32
     560:	ec22                	sd	s0,24(sp)
     562:	1000                	addi	s0,sp,32
     564:	fea43423          	sd	a0,-24(s0)
     568:	87ae                	mv	a5,a1
     56a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     56e:	a01d                	j	594 <strchr+0x36>
    if(*s == c)
     570:	fe843783          	ld	a5,-24(s0)
     574:	0007c703          	lbu	a4,0(a5)
     578:	fe744783          	lbu	a5,-25(s0)
     57c:	0ff7f793          	andi	a5,a5,255
     580:	00e79563          	bne	a5,a4,58a <strchr+0x2c>
      return (char*)s;
     584:	fe843783          	ld	a5,-24(s0)
     588:	a821                	j	5a0 <strchr+0x42>
  for(; *s; s++)
     58a:	fe843783          	ld	a5,-24(s0)
     58e:	0785                	addi	a5,a5,1
     590:	fef43423          	sd	a5,-24(s0)
     594:	fe843783          	ld	a5,-24(s0)
     598:	0007c783          	lbu	a5,0(a5)
     59c:	fbf1                	bnez	a5,570 <strchr+0x12>
  return 0;
     59e:	4781                	li	a5,0
}
     5a0:	853e                	mv	a0,a5
     5a2:	6462                	ld	s0,24(sp)
     5a4:	6105                	addi	sp,sp,32
     5a6:	8082                	ret

00000000000005a8 <gets>:

char*
gets(char *buf, int max)
{
     5a8:	7179                	addi	sp,sp,-48
     5aa:	f406                	sd	ra,40(sp)
     5ac:	f022                	sd	s0,32(sp)
     5ae:	1800                	addi	s0,sp,48
     5b0:	fca43c23          	sd	a0,-40(s0)
     5b4:	87ae                	mv	a5,a1
     5b6:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5ba:	fe042623          	sw	zero,-20(s0)
     5be:	a8a1                	j	616 <gets+0x6e>
    cc = read(0, &c, 1);
     5c0:	fe740793          	addi	a5,s0,-25
     5c4:	4605                	li	a2,1
     5c6:	85be                	mv	a1,a5
     5c8:	4501                	li	a0,0
     5ca:	00000097          	auipc	ra,0x0
     5ce:	2f6080e7          	jalr	758(ra) # 8c0 <read>
     5d2:	87aa                	mv	a5,a0
     5d4:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     5d8:	fe842783          	lw	a5,-24(s0)
     5dc:	2781                	sext.w	a5,a5
     5de:	04f05763          	blez	a5,62c <gets+0x84>
      break;
    buf[i++] = c;
     5e2:	fec42783          	lw	a5,-20(s0)
     5e6:	0017871b          	addiw	a4,a5,1
     5ea:	fee42623          	sw	a4,-20(s0)
     5ee:	873e                	mv	a4,a5
     5f0:	fd843783          	ld	a5,-40(s0)
     5f4:	97ba                	add	a5,a5,a4
     5f6:	fe744703          	lbu	a4,-25(s0)
     5fa:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     5fe:	fe744783          	lbu	a5,-25(s0)
     602:	873e                	mv	a4,a5
     604:	47a9                	li	a5,10
     606:	02f70463          	beq	a4,a5,62e <gets+0x86>
     60a:	fe744783          	lbu	a5,-25(s0)
     60e:	873e                	mv	a4,a5
     610:	47b5                	li	a5,13
     612:	00f70e63          	beq	a4,a5,62e <gets+0x86>
  for(i=0; i+1 < max; ){
     616:	fec42783          	lw	a5,-20(s0)
     61a:	2785                	addiw	a5,a5,1
     61c:	0007871b          	sext.w	a4,a5
     620:	fd442783          	lw	a5,-44(s0)
     624:	2781                	sext.w	a5,a5
     626:	f8f74de3          	blt	a4,a5,5c0 <gets+0x18>
     62a:	a011                	j	62e <gets+0x86>
      break;
     62c:	0001                	nop
      break;
  }
  buf[i] = '\0';
     62e:	fec42783          	lw	a5,-20(s0)
     632:	fd843703          	ld	a4,-40(s0)
     636:	97ba                	add	a5,a5,a4
     638:	00078023          	sb	zero,0(a5)
  return buf;
     63c:	fd843783          	ld	a5,-40(s0)
}
     640:	853e                	mv	a0,a5
     642:	70a2                	ld	ra,40(sp)
     644:	7402                	ld	s0,32(sp)
     646:	6145                	addi	sp,sp,48
     648:	8082                	ret

000000000000064a <stat>:

int
stat(const char *n, struct stat *st)
{
     64a:	7179                	addi	sp,sp,-48
     64c:	f406                	sd	ra,40(sp)
     64e:	f022                	sd	s0,32(sp)
     650:	1800                	addi	s0,sp,48
     652:	fca43c23          	sd	a0,-40(s0)
     656:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     65a:	4581                	li	a1,0
     65c:	fd843503          	ld	a0,-40(s0)
     660:	00000097          	auipc	ra,0x0
     664:	288080e7          	jalr	648(ra) # 8e8 <open>
     668:	87aa                	mv	a5,a0
     66a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     66e:	fec42783          	lw	a5,-20(s0)
     672:	2781                	sext.w	a5,a5
     674:	0007d463          	bgez	a5,67c <stat+0x32>
    return -1;
     678:	57fd                	li	a5,-1
     67a:	a035                	j	6a6 <stat+0x5c>
  r = fstat(fd, st);
     67c:	fec42783          	lw	a5,-20(s0)
     680:	fd043583          	ld	a1,-48(s0)
     684:	853e                	mv	a0,a5
     686:	00000097          	auipc	ra,0x0
     68a:	27a080e7          	jalr	634(ra) # 900 <fstat>
     68e:	87aa                	mv	a5,a0
     690:	fef42423          	sw	a5,-24(s0)
  close(fd);
     694:	fec42783          	lw	a5,-20(s0)
     698:	853e                	mv	a0,a5
     69a:	00000097          	auipc	ra,0x0
     69e:	236080e7          	jalr	566(ra) # 8d0 <close>
  return r;
     6a2:	fe842783          	lw	a5,-24(s0)
}
     6a6:	853e                	mv	a0,a5
     6a8:	70a2                	ld	ra,40(sp)
     6aa:	7402                	ld	s0,32(sp)
     6ac:	6145                	addi	sp,sp,48
     6ae:	8082                	ret

00000000000006b0 <atoi>:

int
atoi(const char *s)
{
     6b0:	7179                	addi	sp,sp,-48
     6b2:	f422                	sd	s0,40(sp)
     6b4:	1800                	addi	s0,sp,48
     6b6:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     6ba:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     6be:	a815                	j	6f2 <atoi+0x42>
    n = n*10 + *s++ - '0';
     6c0:	fec42703          	lw	a4,-20(s0)
     6c4:	87ba                	mv	a5,a4
     6c6:	0027979b          	slliw	a5,a5,0x2
     6ca:	9fb9                	addw	a5,a5,a4
     6cc:	0017979b          	slliw	a5,a5,0x1
     6d0:	0007871b          	sext.w	a4,a5
     6d4:	fd843783          	ld	a5,-40(s0)
     6d8:	00178693          	addi	a3,a5,1
     6dc:	fcd43c23          	sd	a3,-40(s0)
     6e0:	0007c783          	lbu	a5,0(a5)
     6e4:	2781                	sext.w	a5,a5
     6e6:	9fb9                	addw	a5,a5,a4
     6e8:	2781                	sext.w	a5,a5
     6ea:	fd07879b          	addiw	a5,a5,-48
     6ee:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     6f2:	fd843783          	ld	a5,-40(s0)
     6f6:	0007c783          	lbu	a5,0(a5)
     6fa:	873e                	mv	a4,a5
     6fc:	02f00793          	li	a5,47
     700:	00e7fb63          	bgeu	a5,a4,716 <atoi+0x66>
     704:	fd843783          	ld	a5,-40(s0)
     708:	0007c783          	lbu	a5,0(a5)
     70c:	873e                	mv	a4,a5
     70e:	03900793          	li	a5,57
     712:	fae7f7e3          	bgeu	a5,a4,6c0 <atoi+0x10>
  return n;
     716:	fec42783          	lw	a5,-20(s0)
}
     71a:	853e                	mv	a0,a5
     71c:	7422                	ld	s0,40(sp)
     71e:	6145                	addi	sp,sp,48
     720:	8082                	ret

0000000000000722 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     722:	7139                	addi	sp,sp,-64
     724:	fc22                	sd	s0,56(sp)
     726:	0080                	addi	s0,sp,64
     728:	fca43c23          	sd	a0,-40(s0)
     72c:	fcb43823          	sd	a1,-48(s0)
     730:	87b2                	mv	a5,a2
     732:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     736:	fd843783          	ld	a5,-40(s0)
     73a:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     73e:	fd043783          	ld	a5,-48(s0)
     742:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     746:	fe043703          	ld	a4,-32(s0)
     74a:	fe843783          	ld	a5,-24(s0)
     74e:	02e7fc63          	bgeu	a5,a4,786 <memmove+0x64>
    while(n-- > 0)
     752:	a00d                	j	774 <memmove+0x52>
      *dst++ = *src++;
     754:	fe043703          	ld	a4,-32(s0)
     758:	00170793          	addi	a5,a4,1
     75c:	fef43023          	sd	a5,-32(s0)
     760:	fe843783          	ld	a5,-24(s0)
     764:	00178693          	addi	a3,a5,1
     768:	fed43423          	sd	a3,-24(s0)
     76c:	00074703          	lbu	a4,0(a4)
     770:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     774:	fcc42783          	lw	a5,-52(s0)
     778:	fff7871b          	addiw	a4,a5,-1
     77c:	fce42623          	sw	a4,-52(s0)
     780:	fcf04ae3          	bgtz	a5,754 <memmove+0x32>
     784:	a891                	j	7d8 <memmove+0xb6>
  } else {
    dst += n;
     786:	fcc42783          	lw	a5,-52(s0)
     78a:	fe843703          	ld	a4,-24(s0)
     78e:	97ba                	add	a5,a5,a4
     790:	fef43423          	sd	a5,-24(s0)
    src += n;
     794:	fcc42783          	lw	a5,-52(s0)
     798:	fe043703          	ld	a4,-32(s0)
     79c:	97ba                	add	a5,a5,a4
     79e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     7a2:	a01d                	j	7c8 <memmove+0xa6>
      *--dst = *--src;
     7a4:	fe043783          	ld	a5,-32(s0)
     7a8:	17fd                	addi	a5,a5,-1
     7aa:	fef43023          	sd	a5,-32(s0)
     7ae:	fe843783          	ld	a5,-24(s0)
     7b2:	17fd                	addi	a5,a5,-1
     7b4:	fef43423          	sd	a5,-24(s0)
     7b8:	fe043783          	ld	a5,-32(s0)
     7bc:	0007c703          	lbu	a4,0(a5)
     7c0:	fe843783          	ld	a5,-24(s0)
     7c4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	fcf048e3          	bgtz	a5,7a4 <memmove+0x82>
  }
  return vdst;
     7d8:	fd843783          	ld	a5,-40(s0)
}
     7dc:	853e                	mv	a0,a5
     7de:	7462                	ld	s0,56(sp)
     7e0:	6121                	addi	sp,sp,64
     7e2:	8082                	ret

00000000000007e4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     7e4:	7139                	addi	sp,sp,-64
     7e6:	fc22                	sd	s0,56(sp)
     7e8:	0080                	addi	s0,sp,64
     7ea:	fca43c23          	sd	a0,-40(s0)
     7ee:	fcb43823          	sd	a1,-48(s0)
     7f2:	87b2                	mv	a5,a2
     7f4:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     7f8:	fd843783          	ld	a5,-40(s0)
     7fc:	fef43423          	sd	a5,-24(s0)
     800:	fd043783          	ld	a5,-48(s0)
     804:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     808:	a0a1                	j	850 <memcmp+0x6c>
    if (*p1 != *p2) {
     80a:	fe843783          	ld	a5,-24(s0)
     80e:	0007c703          	lbu	a4,0(a5)
     812:	fe043783          	ld	a5,-32(s0)
     816:	0007c783          	lbu	a5,0(a5)
     81a:	02f70163          	beq	a4,a5,83c <memcmp+0x58>
      return *p1 - *p2;
     81e:	fe843783          	ld	a5,-24(s0)
     822:	0007c783          	lbu	a5,0(a5)
     826:	0007871b          	sext.w	a4,a5
     82a:	fe043783          	ld	a5,-32(s0)
     82e:	0007c783          	lbu	a5,0(a5)
     832:	2781                	sext.w	a5,a5
     834:	40f707bb          	subw	a5,a4,a5
     838:	2781                	sext.w	a5,a5
     83a:	a01d                	j	860 <memcmp+0x7c>
    }
    p1++;
     83c:	fe843783          	ld	a5,-24(s0)
     840:	0785                	addi	a5,a5,1
     842:	fef43423          	sd	a5,-24(s0)
    p2++;
     846:	fe043783          	ld	a5,-32(s0)
     84a:	0785                	addi	a5,a5,1
     84c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     850:	fcc42783          	lw	a5,-52(s0)
     854:	fff7871b          	addiw	a4,a5,-1
     858:	fce42623          	sw	a4,-52(s0)
     85c:	f7dd                	bnez	a5,80a <memcmp+0x26>
  }
  return 0;
     85e:	4781                	li	a5,0
}
     860:	853e                	mv	a0,a5
     862:	7462                	ld	s0,56(sp)
     864:	6121                	addi	sp,sp,64
     866:	8082                	ret

0000000000000868 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     868:	7179                	addi	sp,sp,-48
     86a:	f406                	sd	ra,40(sp)
     86c:	f022                	sd	s0,32(sp)
     86e:	1800                	addi	s0,sp,48
     870:	fea43423          	sd	a0,-24(s0)
     874:	feb43023          	sd	a1,-32(s0)
     878:	87b2                	mv	a5,a2
     87a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     87e:	fdc42783          	lw	a5,-36(s0)
     882:	863e                	mv	a2,a5
     884:	fe043583          	ld	a1,-32(s0)
     888:	fe843503          	ld	a0,-24(s0)
     88c:	00000097          	auipc	ra,0x0
     890:	e96080e7          	jalr	-362(ra) # 722 <memmove>
     894:	87aa                	mv	a5,a0
}
     896:	853e                	mv	a0,a5
     898:	70a2                	ld	ra,40(sp)
     89a:	7402                	ld	s0,32(sp)
     89c:	6145                	addi	sp,sp,48
     89e:	8082                	ret

00000000000008a0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     8a0:	4885                	li	a7,1
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <exit>:
.global exit
exit:
 li a7, SYS_exit
     8a8:	4889                	li	a7,2
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <wait>:
.global wait
wait:
 li a7, SYS_wait
     8b0:	488d                	li	a7,3
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     8b8:	4891                	li	a7,4
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <read>:
.global read
read:
 li a7, SYS_read
     8c0:	4895                	li	a7,5
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <write>:
.global write
write:
 li a7, SYS_write
     8c8:	48c1                	li	a7,16
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <close>:
.global close
close:
 li a7, SYS_close
     8d0:	48d5                	li	a7,21
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <kill>:
.global kill
kill:
 li a7, SYS_kill
     8d8:	4899                	li	a7,6
 ecall
     8da:	00000073          	ecall
 ret
     8de:	8082                	ret

00000000000008e0 <exec>:
.global exec
exec:
 li a7, SYS_exec
     8e0:	489d                	li	a7,7
 ecall
     8e2:	00000073          	ecall
 ret
     8e6:	8082                	ret

00000000000008e8 <open>:
.global open
open:
 li a7, SYS_open
     8e8:	48bd                	li	a7,15
 ecall
     8ea:	00000073          	ecall
 ret
     8ee:	8082                	ret

00000000000008f0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     8f0:	48c5                	li	a7,17
 ecall
     8f2:	00000073          	ecall
 ret
     8f6:	8082                	ret

00000000000008f8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     8f8:	48c9                	li	a7,18
 ecall
     8fa:	00000073          	ecall
 ret
     8fe:	8082                	ret

0000000000000900 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     900:	48a1                	li	a7,8
 ecall
     902:	00000073          	ecall
 ret
     906:	8082                	ret

0000000000000908 <link>:
.global link
link:
 li a7, SYS_link
     908:	48cd                	li	a7,19
 ecall
     90a:	00000073          	ecall
 ret
     90e:	8082                	ret

0000000000000910 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     910:	48d1                	li	a7,20
 ecall
     912:	00000073          	ecall
 ret
     916:	8082                	ret

0000000000000918 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     918:	48a5                	li	a7,9
 ecall
     91a:	00000073          	ecall
 ret
     91e:	8082                	ret

0000000000000920 <dup>:
.global dup
dup:
 li a7, SYS_dup
     920:	48a9                	li	a7,10
 ecall
     922:	00000073          	ecall
 ret
     926:	8082                	ret

0000000000000928 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     928:	48ad                	li	a7,11
 ecall
     92a:	00000073          	ecall
 ret
     92e:	8082                	ret

0000000000000930 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     930:	48b1                	li	a7,12
 ecall
     932:	00000073          	ecall
 ret
     936:	8082                	ret

0000000000000938 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     938:	48b5                	li	a7,13
 ecall
     93a:	00000073          	ecall
 ret
     93e:	8082                	ret

0000000000000940 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     940:	48b9                	li	a7,14
 ecall
     942:	00000073          	ecall
 ret
     946:	8082                	ret

0000000000000948 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     948:	1101                	addi	sp,sp,-32
     94a:	ec06                	sd	ra,24(sp)
     94c:	e822                	sd	s0,16(sp)
     94e:	1000                	addi	s0,sp,32
     950:	87aa                	mv	a5,a0
     952:	872e                	mv	a4,a1
     954:	fef42623          	sw	a5,-20(s0)
     958:	87ba                	mv	a5,a4
     95a:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     95e:	feb40713          	addi	a4,s0,-21
     962:	fec42783          	lw	a5,-20(s0)
     966:	4605                	li	a2,1
     968:	85ba                	mv	a1,a4
     96a:	853e                	mv	a0,a5
     96c:	00000097          	auipc	ra,0x0
     970:	f5c080e7          	jalr	-164(ra) # 8c8 <write>
}
     974:	0001                	nop
     976:	60e2                	ld	ra,24(sp)
     978:	6442                	ld	s0,16(sp)
     97a:	6105                	addi	sp,sp,32
     97c:	8082                	ret

000000000000097e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     97e:	7139                	addi	sp,sp,-64
     980:	fc06                	sd	ra,56(sp)
     982:	f822                	sd	s0,48(sp)
     984:	0080                	addi	s0,sp,64
     986:	87aa                	mv	a5,a0
     988:	8736                	mv	a4,a3
     98a:	fcf42623          	sw	a5,-52(s0)
     98e:	87ae                	mv	a5,a1
     990:	fcf42423          	sw	a5,-56(s0)
     994:	87b2                	mv	a5,a2
     996:	fcf42223          	sw	a5,-60(s0)
     99a:	87ba                	mv	a5,a4
     99c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9a0:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     9a4:	fc042783          	lw	a5,-64(s0)
     9a8:	2781                	sext.w	a5,a5
     9aa:	c38d                	beqz	a5,9cc <printint+0x4e>
     9ac:	fc842783          	lw	a5,-56(s0)
     9b0:	2781                	sext.w	a5,a5
     9b2:	0007dd63          	bgez	a5,9cc <printint+0x4e>
    neg = 1;
     9b6:	4785                	li	a5,1
     9b8:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     9bc:	fc842783          	lw	a5,-56(s0)
     9c0:	40f007bb          	negw	a5,a5
     9c4:	2781                	sext.w	a5,a5
     9c6:	fef42223          	sw	a5,-28(s0)
     9ca:	a029                	j	9d4 <printint+0x56>
  } else {
    x = xx;
     9cc:	fc842783          	lw	a5,-56(s0)
     9d0:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     9d4:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     9d8:	fc442783          	lw	a5,-60(s0)
     9dc:	fe442703          	lw	a4,-28(s0)
     9e0:	02f777bb          	remuw	a5,a4,a5
     9e4:	0007861b          	sext.w	a2,a5
     9e8:	fec42783          	lw	a5,-20(s0)
     9ec:	0017871b          	addiw	a4,a5,1
     9f0:	fee42623          	sw	a4,-20(s0)
     9f4:	00000697          	auipc	a3,0x0
     9f8:	75468693          	addi	a3,a3,1876 # 1148 <digits>
     9fc:	02061713          	slli	a4,a2,0x20
     a00:	9301                	srli	a4,a4,0x20
     a02:	9736                	add	a4,a4,a3
     a04:	00074703          	lbu	a4,0(a4)
     a08:	ff040693          	addi	a3,s0,-16
     a0c:	97b6                	add	a5,a5,a3
     a0e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     a12:	fc442783          	lw	a5,-60(s0)
     a16:	fe442703          	lw	a4,-28(s0)
     a1a:	02f757bb          	divuw	a5,a4,a5
     a1e:	fef42223          	sw	a5,-28(s0)
     a22:	fe442783          	lw	a5,-28(s0)
     a26:	2781                	sext.w	a5,a5
     a28:	fbc5                	bnez	a5,9d8 <printint+0x5a>
  if(neg)
     a2a:	fe842783          	lw	a5,-24(s0)
     a2e:	2781                	sext.w	a5,a5
     a30:	cf95                	beqz	a5,a6c <printint+0xee>
    buf[i++] = '-';
     a32:	fec42783          	lw	a5,-20(s0)
     a36:	0017871b          	addiw	a4,a5,1
     a3a:	fee42623          	sw	a4,-20(s0)
     a3e:	ff040713          	addi	a4,s0,-16
     a42:	97ba                	add	a5,a5,a4
     a44:	02d00713          	li	a4,45
     a48:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     a4c:	a005                	j	a6c <printint+0xee>
    putc(fd, buf[i]);
     a4e:	fec42783          	lw	a5,-20(s0)
     a52:	ff040713          	addi	a4,s0,-16
     a56:	97ba                	add	a5,a5,a4
     a58:	fe07c703          	lbu	a4,-32(a5)
     a5c:	fcc42783          	lw	a5,-52(s0)
     a60:	85ba                	mv	a1,a4
     a62:	853e                	mv	a0,a5
     a64:	00000097          	auipc	ra,0x0
     a68:	ee4080e7          	jalr	-284(ra) # 948 <putc>
  while(--i >= 0)
     a6c:	fec42783          	lw	a5,-20(s0)
     a70:	37fd                	addiw	a5,a5,-1
     a72:	fef42623          	sw	a5,-20(s0)
     a76:	fec42783          	lw	a5,-20(s0)
     a7a:	2781                	sext.w	a5,a5
     a7c:	fc07d9e3          	bgez	a5,a4e <printint+0xd0>
}
     a80:	0001                	nop
     a82:	0001                	nop
     a84:	70e2                	ld	ra,56(sp)
     a86:	7442                	ld	s0,48(sp)
     a88:	6121                	addi	sp,sp,64
     a8a:	8082                	ret

0000000000000a8c <printptr>:

static void
printptr(int fd, uint64 x) {
     a8c:	7179                	addi	sp,sp,-48
     a8e:	f406                	sd	ra,40(sp)
     a90:	f022                	sd	s0,32(sp)
     a92:	1800                	addi	s0,sp,48
     a94:	87aa                	mv	a5,a0
     a96:	fcb43823          	sd	a1,-48(s0)
     a9a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a9e:	fdc42783          	lw	a5,-36(s0)
     aa2:	03000593          	li	a1,48
     aa6:	853e                	mv	a0,a5
     aa8:	00000097          	auipc	ra,0x0
     aac:	ea0080e7          	jalr	-352(ra) # 948 <putc>
  putc(fd, 'x');
     ab0:	fdc42783          	lw	a5,-36(s0)
     ab4:	07800593          	li	a1,120
     ab8:	853e                	mv	a0,a5
     aba:	00000097          	auipc	ra,0x0
     abe:	e8e080e7          	jalr	-370(ra) # 948 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     ac2:	fe042623          	sw	zero,-20(s0)
     ac6:	a82d                	j	b00 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     ac8:	fd043783          	ld	a5,-48(s0)
     acc:	93f1                	srli	a5,a5,0x3c
     ace:	00000717          	auipc	a4,0x0
     ad2:	67a70713          	addi	a4,a4,1658 # 1148 <digits>
     ad6:	97ba                	add	a5,a5,a4
     ad8:	0007c703          	lbu	a4,0(a5)
     adc:	fdc42783          	lw	a5,-36(s0)
     ae0:	85ba                	mv	a1,a4
     ae2:	853e                	mv	a0,a5
     ae4:	00000097          	auipc	ra,0x0
     ae8:	e64080e7          	jalr	-412(ra) # 948 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     aec:	fec42783          	lw	a5,-20(s0)
     af0:	2785                	addiw	a5,a5,1
     af2:	fef42623          	sw	a5,-20(s0)
     af6:	fd043783          	ld	a5,-48(s0)
     afa:	0792                	slli	a5,a5,0x4
     afc:	fcf43823          	sd	a5,-48(s0)
     b00:	fec42783          	lw	a5,-20(s0)
     b04:	873e                	mv	a4,a5
     b06:	47bd                	li	a5,15
     b08:	fce7f0e3          	bgeu	a5,a4,ac8 <printptr+0x3c>
}
     b0c:	0001                	nop
     b0e:	0001                	nop
     b10:	70a2                	ld	ra,40(sp)
     b12:	7402                	ld	s0,32(sp)
     b14:	6145                	addi	sp,sp,48
     b16:	8082                	ret

0000000000000b18 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     b18:	715d                	addi	sp,sp,-80
     b1a:	e486                	sd	ra,72(sp)
     b1c:	e0a2                	sd	s0,64(sp)
     b1e:	0880                	addi	s0,sp,80
     b20:	87aa                	mv	a5,a0
     b22:	fcb43023          	sd	a1,-64(s0)
     b26:	fac43c23          	sd	a2,-72(s0)
     b2a:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     b2e:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b32:	fe042223          	sw	zero,-28(s0)
     b36:	a42d                	j	d60 <vprintf+0x248>
    c = fmt[i] & 0xff;
     b38:	fe442783          	lw	a5,-28(s0)
     b3c:	fc043703          	ld	a4,-64(s0)
     b40:	97ba                	add	a5,a5,a4
     b42:	0007c783          	lbu	a5,0(a5)
     b46:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     b4a:	fe042783          	lw	a5,-32(s0)
     b4e:	2781                	sext.w	a5,a5
     b50:	eb9d                	bnez	a5,b86 <vprintf+0x6e>
      if(c == '%'){
     b52:	fdc42783          	lw	a5,-36(s0)
     b56:	0007871b          	sext.w	a4,a5
     b5a:	02500793          	li	a5,37
     b5e:	00f71763          	bne	a4,a5,b6c <vprintf+0x54>
        state = '%';
     b62:	02500793          	li	a5,37
     b66:	fef42023          	sw	a5,-32(s0)
     b6a:	a2f5                	j	d56 <vprintf+0x23e>
      } else {
        putc(fd, c);
     b6c:	fdc42783          	lw	a5,-36(s0)
     b70:	0ff7f713          	andi	a4,a5,255
     b74:	fcc42783          	lw	a5,-52(s0)
     b78:	85ba                	mv	a1,a4
     b7a:	853e                	mv	a0,a5
     b7c:	00000097          	auipc	ra,0x0
     b80:	dcc080e7          	jalr	-564(ra) # 948 <putc>
     b84:	aac9                	j	d56 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b86:	fe042783          	lw	a5,-32(s0)
     b8a:	0007871b          	sext.w	a4,a5
     b8e:	02500793          	li	a5,37
     b92:	1cf71263          	bne	a4,a5,d56 <vprintf+0x23e>
      if(c == 'd'){
     b96:	fdc42783          	lw	a5,-36(s0)
     b9a:	0007871b          	sext.w	a4,a5
     b9e:	06400793          	li	a5,100
     ba2:	02f71463          	bne	a4,a5,bca <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     ba6:	fb843783          	ld	a5,-72(s0)
     baa:	00878713          	addi	a4,a5,8
     bae:	fae43c23          	sd	a4,-72(s0)
     bb2:	4398                	lw	a4,0(a5)
     bb4:	fcc42783          	lw	a5,-52(s0)
     bb8:	4685                	li	a3,1
     bba:	4629                	li	a2,10
     bbc:	85ba                	mv	a1,a4
     bbe:	853e                	mv	a0,a5
     bc0:	00000097          	auipc	ra,0x0
     bc4:	dbe080e7          	jalr	-578(ra) # 97e <printint>
     bc8:	a269                	j	d52 <vprintf+0x23a>
      } else if(c == 'l') {
     bca:	fdc42783          	lw	a5,-36(s0)
     bce:	0007871b          	sext.w	a4,a5
     bd2:	06c00793          	li	a5,108
     bd6:	02f71663          	bne	a4,a5,c02 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     bda:	fb843783          	ld	a5,-72(s0)
     bde:	00878713          	addi	a4,a5,8
     be2:	fae43c23          	sd	a4,-72(s0)
     be6:	639c                	ld	a5,0(a5)
     be8:	0007871b          	sext.w	a4,a5
     bec:	fcc42783          	lw	a5,-52(s0)
     bf0:	4681                	li	a3,0
     bf2:	4629                	li	a2,10
     bf4:	85ba                	mv	a1,a4
     bf6:	853e                	mv	a0,a5
     bf8:	00000097          	auipc	ra,0x0
     bfc:	d86080e7          	jalr	-634(ra) # 97e <printint>
     c00:	aa89                	j	d52 <vprintf+0x23a>
      } else if(c == 'x') {
     c02:	fdc42783          	lw	a5,-36(s0)
     c06:	0007871b          	sext.w	a4,a5
     c0a:	07800793          	li	a5,120
     c0e:	02f71463          	bne	a4,a5,c36 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     c12:	fb843783          	ld	a5,-72(s0)
     c16:	00878713          	addi	a4,a5,8
     c1a:	fae43c23          	sd	a4,-72(s0)
     c1e:	4398                	lw	a4,0(a5)
     c20:	fcc42783          	lw	a5,-52(s0)
     c24:	4681                	li	a3,0
     c26:	4641                	li	a2,16
     c28:	85ba                	mv	a1,a4
     c2a:	853e                	mv	a0,a5
     c2c:	00000097          	auipc	ra,0x0
     c30:	d52080e7          	jalr	-686(ra) # 97e <printint>
     c34:	aa39                	j	d52 <vprintf+0x23a>
      } else if(c == 'p') {
     c36:	fdc42783          	lw	a5,-36(s0)
     c3a:	0007871b          	sext.w	a4,a5
     c3e:	07000793          	li	a5,112
     c42:	02f71263          	bne	a4,a5,c66 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     c46:	fb843783          	ld	a5,-72(s0)
     c4a:	00878713          	addi	a4,a5,8
     c4e:	fae43c23          	sd	a4,-72(s0)
     c52:	6398                	ld	a4,0(a5)
     c54:	fcc42783          	lw	a5,-52(s0)
     c58:	85ba                	mv	a1,a4
     c5a:	853e                	mv	a0,a5
     c5c:	00000097          	auipc	ra,0x0
     c60:	e30080e7          	jalr	-464(ra) # a8c <printptr>
     c64:	a0fd                	j	d52 <vprintf+0x23a>
      } else if(c == 's'){
     c66:	fdc42783          	lw	a5,-36(s0)
     c6a:	0007871b          	sext.w	a4,a5
     c6e:	07300793          	li	a5,115
     c72:	04f71c63          	bne	a4,a5,cca <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c76:	fb843783          	ld	a5,-72(s0)
     c7a:	00878713          	addi	a4,a5,8
     c7e:	fae43c23          	sd	a4,-72(s0)
     c82:	639c                	ld	a5,0(a5)
     c84:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c88:	fe843783          	ld	a5,-24(s0)
     c8c:	eb8d                	bnez	a5,cbe <vprintf+0x1a6>
          s = "(null)";
     c8e:	00000797          	auipc	a5,0x0
     c92:	4b278793          	addi	a5,a5,1202 # 1140 <malloc+0x178>
     c96:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c9a:	a015                	j	cbe <vprintf+0x1a6>
          putc(fd, *s);
     c9c:	fe843783          	ld	a5,-24(s0)
     ca0:	0007c703          	lbu	a4,0(a5)
     ca4:	fcc42783          	lw	a5,-52(s0)
     ca8:	85ba                	mv	a1,a4
     caa:	853e                	mv	a0,a5
     cac:	00000097          	auipc	ra,0x0
     cb0:	c9c080e7          	jalr	-868(ra) # 948 <putc>
          s++;
     cb4:	fe843783          	ld	a5,-24(s0)
     cb8:	0785                	addi	a5,a5,1
     cba:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     cbe:	fe843783          	ld	a5,-24(s0)
     cc2:	0007c783          	lbu	a5,0(a5)
     cc6:	fbf9                	bnez	a5,c9c <vprintf+0x184>
     cc8:	a069                	j	d52 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	0007871b          	sext.w	a4,a5
     cd2:	06300793          	li	a5,99
     cd6:	02f71463          	bne	a4,a5,cfe <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     cda:	fb843783          	ld	a5,-72(s0)
     cde:	00878713          	addi	a4,a5,8
     ce2:	fae43c23          	sd	a4,-72(s0)
     ce6:	439c                	lw	a5,0(a5)
     ce8:	0ff7f713          	andi	a4,a5,255
     cec:	fcc42783          	lw	a5,-52(s0)
     cf0:	85ba                	mv	a1,a4
     cf2:	853e                	mv	a0,a5
     cf4:	00000097          	auipc	ra,0x0
     cf8:	c54080e7          	jalr	-940(ra) # 948 <putc>
     cfc:	a899                	j	d52 <vprintf+0x23a>
      } else if(c == '%'){
     cfe:	fdc42783          	lw	a5,-36(s0)
     d02:	0007871b          	sext.w	a4,a5
     d06:	02500793          	li	a5,37
     d0a:	00f71f63          	bne	a4,a5,d28 <vprintf+0x210>
        putc(fd, c);
     d0e:	fdc42783          	lw	a5,-36(s0)
     d12:	0ff7f713          	andi	a4,a5,255
     d16:	fcc42783          	lw	a5,-52(s0)
     d1a:	85ba                	mv	a1,a4
     d1c:	853e                	mv	a0,a5
     d1e:	00000097          	auipc	ra,0x0
     d22:	c2a080e7          	jalr	-982(ra) # 948 <putc>
     d26:	a035                	j	d52 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d28:	fcc42783          	lw	a5,-52(s0)
     d2c:	02500593          	li	a1,37
     d30:	853e                	mv	a0,a5
     d32:	00000097          	auipc	ra,0x0
     d36:	c16080e7          	jalr	-1002(ra) # 948 <putc>
        putc(fd, c);
     d3a:	fdc42783          	lw	a5,-36(s0)
     d3e:	0ff7f713          	andi	a4,a5,255
     d42:	fcc42783          	lw	a5,-52(s0)
     d46:	85ba                	mv	a1,a4
     d48:	853e                	mv	a0,a5
     d4a:	00000097          	auipc	ra,0x0
     d4e:	bfe080e7          	jalr	-1026(ra) # 948 <putc>
      }
      state = 0;
     d52:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     d56:	fe442783          	lw	a5,-28(s0)
     d5a:	2785                	addiw	a5,a5,1
     d5c:	fef42223          	sw	a5,-28(s0)
     d60:	fe442783          	lw	a5,-28(s0)
     d64:	fc043703          	ld	a4,-64(s0)
     d68:	97ba                	add	a5,a5,a4
     d6a:	0007c783          	lbu	a5,0(a5)
     d6e:	dc0795e3          	bnez	a5,b38 <vprintf+0x20>
    }
  }
}
     d72:	0001                	nop
     d74:	0001                	nop
     d76:	60a6                	ld	ra,72(sp)
     d78:	6406                	ld	s0,64(sp)
     d7a:	6161                	addi	sp,sp,80
     d7c:	8082                	ret

0000000000000d7e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d7e:	7159                	addi	sp,sp,-112
     d80:	fc06                	sd	ra,56(sp)
     d82:	f822                	sd	s0,48(sp)
     d84:	0080                	addi	s0,sp,64
     d86:	fcb43823          	sd	a1,-48(s0)
     d8a:	e010                	sd	a2,0(s0)
     d8c:	e414                	sd	a3,8(s0)
     d8e:	e818                	sd	a4,16(s0)
     d90:	ec1c                	sd	a5,24(s0)
     d92:	03043023          	sd	a6,32(s0)
     d96:	03143423          	sd	a7,40(s0)
     d9a:	87aa                	mv	a5,a0
     d9c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     da0:	03040793          	addi	a5,s0,48
     da4:	fcf43423          	sd	a5,-56(s0)
     da8:	fc843783          	ld	a5,-56(s0)
     dac:	fd078793          	addi	a5,a5,-48
     db0:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     db4:	fe843703          	ld	a4,-24(s0)
     db8:	fdc42783          	lw	a5,-36(s0)
     dbc:	863a                	mv	a2,a4
     dbe:	fd043583          	ld	a1,-48(s0)
     dc2:	853e                	mv	a0,a5
     dc4:	00000097          	auipc	ra,0x0
     dc8:	d54080e7          	jalr	-684(ra) # b18 <vprintf>
}
     dcc:	0001                	nop
     dce:	70e2                	ld	ra,56(sp)
     dd0:	7442                	ld	s0,48(sp)
     dd2:	6165                	addi	sp,sp,112
     dd4:	8082                	ret

0000000000000dd6 <printf>:

void
printf(const char *fmt, ...)
{
     dd6:	7159                	addi	sp,sp,-112
     dd8:	f406                	sd	ra,40(sp)
     dda:	f022                	sd	s0,32(sp)
     ddc:	1800                	addi	s0,sp,48
     dde:	fca43c23          	sd	a0,-40(s0)
     de2:	e40c                	sd	a1,8(s0)
     de4:	e810                	sd	a2,16(s0)
     de6:	ec14                	sd	a3,24(s0)
     de8:	f018                	sd	a4,32(s0)
     dea:	f41c                	sd	a5,40(s0)
     dec:	03043823          	sd	a6,48(s0)
     df0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     df4:	04040793          	addi	a5,s0,64
     df8:	fcf43823          	sd	a5,-48(s0)
     dfc:	fd043783          	ld	a5,-48(s0)
     e00:	fc878793          	addi	a5,a5,-56
     e04:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     e08:	fe843783          	ld	a5,-24(s0)
     e0c:	863e                	mv	a2,a5
     e0e:	fd843583          	ld	a1,-40(s0)
     e12:	4505                	li	a0,1
     e14:	00000097          	auipc	ra,0x0
     e18:	d04080e7          	jalr	-764(ra) # b18 <vprintf>
}
     e1c:	0001                	nop
     e1e:	70a2                	ld	ra,40(sp)
     e20:	7402                	ld	s0,32(sp)
     e22:	6165                	addi	sp,sp,112
     e24:	8082                	ret

0000000000000e26 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e26:	7179                	addi	sp,sp,-48
     e28:	f422                	sd	s0,40(sp)
     e2a:	1800                	addi	s0,sp,48
     e2c:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e30:	fd843783          	ld	a5,-40(s0)
     e34:	17c1                	addi	a5,a5,-16
     e36:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e3a:	00000797          	auipc	a5,0x0
     e3e:	73678793          	addi	a5,a5,1846 # 1570 <freep>
     e42:	639c                	ld	a5,0(a5)
     e44:	fef43423          	sd	a5,-24(s0)
     e48:	a815                	j	e7c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e4a:	fe843783          	ld	a5,-24(s0)
     e4e:	639c                	ld	a5,0(a5)
     e50:	fe843703          	ld	a4,-24(s0)
     e54:	00f76f63          	bltu	a4,a5,e72 <free+0x4c>
     e58:	fe043703          	ld	a4,-32(s0)
     e5c:	fe843783          	ld	a5,-24(s0)
     e60:	02e7eb63          	bltu	a5,a4,e96 <free+0x70>
     e64:	fe843783          	ld	a5,-24(s0)
     e68:	639c                	ld	a5,0(a5)
     e6a:	fe043703          	ld	a4,-32(s0)
     e6e:	02f76463          	bltu	a4,a5,e96 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e72:	fe843783          	ld	a5,-24(s0)
     e76:	639c                	ld	a5,0(a5)
     e78:	fef43423          	sd	a5,-24(s0)
     e7c:	fe043703          	ld	a4,-32(s0)
     e80:	fe843783          	ld	a5,-24(s0)
     e84:	fce7f3e3          	bgeu	a5,a4,e4a <free+0x24>
     e88:	fe843783          	ld	a5,-24(s0)
     e8c:	639c                	ld	a5,0(a5)
     e8e:	fe043703          	ld	a4,-32(s0)
     e92:	faf77ce3          	bgeu	a4,a5,e4a <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e96:	fe043783          	ld	a5,-32(s0)
     e9a:	479c                	lw	a5,8(a5)
     e9c:	1782                	slli	a5,a5,0x20
     e9e:	9381                	srli	a5,a5,0x20
     ea0:	0792                	slli	a5,a5,0x4
     ea2:	fe043703          	ld	a4,-32(s0)
     ea6:	973e                	add	a4,a4,a5
     ea8:	fe843783          	ld	a5,-24(s0)
     eac:	639c                	ld	a5,0(a5)
     eae:	02f71763          	bne	a4,a5,edc <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     eb2:	fe043783          	ld	a5,-32(s0)
     eb6:	4798                	lw	a4,8(a5)
     eb8:	fe843783          	ld	a5,-24(s0)
     ebc:	639c                	ld	a5,0(a5)
     ebe:	479c                	lw	a5,8(a5)
     ec0:	9fb9                	addw	a5,a5,a4
     ec2:	0007871b          	sext.w	a4,a5
     ec6:	fe043783          	ld	a5,-32(s0)
     eca:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     ecc:	fe843783          	ld	a5,-24(s0)
     ed0:	639c                	ld	a5,0(a5)
     ed2:	6398                	ld	a4,0(a5)
     ed4:	fe043783          	ld	a5,-32(s0)
     ed8:	e398                	sd	a4,0(a5)
     eda:	a039                	j	ee8 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     edc:	fe843783          	ld	a5,-24(s0)
     ee0:	6398                	ld	a4,0(a5)
     ee2:	fe043783          	ld	a5,-32(s0)
     ee6:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     ee8:	fe843783          	ld	a5,-24(s0)
     eec:	479c                	lw	a5,8(a5)
     eee:	1782                	slli	a5,a5,0x20
     ef0:	9381                	srli	a5,a5,0x20
     ef2:	0792                	slli	a5,a5,0x4
     ef4:	fe843703          	ld	a4,-24(s0)
     ef8:	97ba                	add	a5,a5,a4
     efa:	fe043703          	ld	a4,-32(s0)
     efe:	02f71563          	bne	a4,a5,f28 <free+0x102>
    p->s.size += bp->s.size;
     f02:	fe843783          	ld	a5,-24(s0)
     f06:	4798                	lw	a4,8(a5)
     f08:	fe043783          	ld	a5,-32(s0)
     f0c:	479c                	lw	a5,8(a5)
     f0e:	9fb9                	addw	a5,a5,a4
     f10:	0007871b          	sext.w	a4,a5
     f14:	fe843783          	ld	a5,-24(s0)
     f18:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     f1a:	fe043783          	ld	a5,-32(s0)
     f1e:	6398                	ld	a4,0(a5)
     f20:	fe843783          	ld	a5,-24(s0)
     f24:	e398                	sd	a4,0(a5)
     f26:	a031                	j	f32 <free+0x10c>
  } else
    p->s.ptr = bp;
     f28:	fe843783          	ld	a5,-24(s0)
     f2c:	fe043703          	ld	a4,-32(s0)
     f30:	e398                	sd	a4,0(a5)
  freep = p;
     f32:	00000797          	auipc	a5,0x0
     f36:	63e78793          	addi	a5,a5,1598 # 1570 <freep>
     f3a:	fe843703          	ld	a4,-24(s0)
     f3e:	e398                	sd	a4,0(a5)
}
     f40:	0001                	nop
     f42:	7422                	ld	s0,40(sp)
     f44:	6145                	addi	sp,sp,48
     f46:	8082                	ret

0000000000000f48 <morecore>:

static Header*
morecore(uint nu)
{
     f48:	7179                	addi	sp,sp,-48
     f4a:	f406                	sd	ra,40(sp)
     f4c:	f022                	sd	s0,32(sp)
     f4e:	1800                	addi	s0,sp,48
     f50:	87aa                	mv	a5,a0
     f52:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     f56:	fdc42783          	lw	a5,-36(s0)
     f5a:	0007871b          	sext.w	a4,a5
     f5e:	6785                	lui	a5,0x1
     f60:	00f77563          	bgeu	a4,a5,f6a <morecore+0x22>
    nu = 4096;
     f64:	6785                	lui	a5,0x1
     f66:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f6a:	fdc42783          	lw	a5,-36(s0)
     f6e:	0047979b          	slliw	a5,a5,0x4
     f72:	2781                	sext.w	a5,a5
     f74:	2781                	sext.w	a5,a5
     f76:	853e                	mv	a0,a5
     f78:	00000097          	auipc	ra,0x0
     f7c:	9b8080e7          	jalr	-1608(ra) # 930 <sbrk>
     f80:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f84:	fe843703          	ld	a4,-24(s0)
     f88:	57fd                	li	a5,-1
     f8a:	00f71463          	bne	a4,a5,f92 <morecore+0x4a>
    return 0;
     f8e:	4781                	li	a5,0
     f90:	a03d                	j	fbe <morecore+0x76>
  hp = (Header*)p;
     f92:	fe843783          	ld	a5,-24(s0)
     f96:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f9a:	fe043783          	ld	a5,-32(s0)
     f9e:	fdc42703          	lw	a4,-36(s0)
     fa2:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     fa4:	fe043783          	ld	a5,-32(s0)
     fa8:	07c1                	addi	a5,a5,16
     faa:	853e                	mv	a0,a5
     fac:	00000097          	auipc	ra,0x0
     fb0:	e7a080e7          	jalr	-390(ra) # e26 <free>
  return freep;
     fb4:	00000797          	auipc	a5,0x0
     fb8:	5bc78793          	addi	a5,a5,1468 # 1570 <freep>
     fbc:	639c                	ld	a5,0(a5)
}
     fbe:	853e                	mv	a0,a5
     fc0:	70a2                	ld	ra,40(sp)
     fc2:	7402                	ld	s0,32(sp)
     fc4:	6145                	addi	sp,sp,48
     fc6:	8082                	ret

0000000000000fc8 <malloc>:

void*
malloc(uint nbytes)
{
     fc8:	7139                	addi	sp,sp,-64
     fca:	fc06                	sd	ra,56(sp)
     fcc:	f822                	sd	s0,48(sp)
     fce:	0080                	addi	s0,sp,64
     fd0:	87aa                	mv	a5,a0
     fd2:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd6:	fcc46783          	lwu	a5,-52(s0)
     fda:	07bd                	addi	a5,a5,15
     fdc:	8391                	srli	a5,a5,0x4
     fde:	2781                	sext.w	a5,a5
     fe0:	2785                	addiw	a5,a5,1
     fe2:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     fe6:	00000797          	auipc	a5,0x0
     fea:	58a78793          	addi	a5,a5,1418 # 1570 <freep>
     fee:	639c                	ld	a5,0(a5)
     ff0:	fef43023          	sd	a5,-32(s0)
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	ef95                	bnez	a5,1034 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ffa:	00000797          	auipc	a5,0x0
     ffe:	56678793          	addi	a5,a5,1382 # 1560 <base>
    1002:	fef43023          	sd	a5,-32(s0)
    1006:	00000797          	auipc	a5,0x0
    100a:	56a78793          	addi	a5,a5,1386 # 1570 <freep>
    100e:	fe043703          	ld	a4,-32(s0)
    1012:	e398                	sd	a4,0(a5)
    1014:	00000797          	auipc	a5,0x0
    1018:	55c78793          	addi	a5,a5,1372 # 1570 <freep>
    101c:	6398                	ld	a4,0(a5)
    101e:	00000797          	auipc	a5,0x0
    1022:	54278793          	addi	a5,a5,1346 # 1560 <base>
    1026:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1028:	00000797          	auipc	a5,0x0
    102c:	53878793          	addi	a5,a5,1336 # 1560 <base>
    1030:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1034:	fe043783          	ld	a5,-32(s0)
    1038:	639c                	ld	a5,0(a5)
    103a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    103e:	fe843783          	ld	a5,-24(s0)
    1042:	4798                	lw	a4,8(a5)
    1044:	fdc42783          	lw	a5,-36(s0)
    1048:	2781                	sext.w	a5,a5
    104a:	06f76863          	bltu	a4,a5,10ba <malloc+0xf2>
      if(p->s.size == nunits)
    104e:	fe843783          	ld	a5,-24(s0)
    1052:	4798                	lw	a4,8(a5)
    1054:	fdc42783          	lw	a5,-36(s0)
    1058:	2781                	sext.w	a5,a5
    105a:	00e79963          	bne	a5,a4,106c <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    105e:	fe843783          	ld	a5,-24(s0)
    1062:	6398                	ld	a4,0(a5)
    1064:	fe043783          	ld	a5,-32(s0)
    1068:	e398                	sd	a4,0(a5)
    106a:	a82d                	j	10a4 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    106c:	fe843783          	ld	a5,-24(s0)
    1070:	4798                	lw	a4,8(a5)
    1072:	fdc42783          	lw	a5,-36(s0)
    1076:	40f707bb          	subw	a5,a4,a5
    107a:	0007871b          	sext.w	a4,a5
    107e:	fe843783          	ld	a5,-24(s0)
    1082:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1084:	fe843783          	ld	a5,-24(s0)
    1088:	479c                	lw	a5,8(a5)
    108a:	1782                	slli	a5,a5,0x20
    108c:	9381                	srli	a5,a5,0x20
    108e:	0792                	slli	a5,a5,0x4
    1090:	fe843703          	ld	a4,-24(s0)
    1094:	97ba                	add	a5,a5,a4
    1096:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    109a:	fe843783          	ld	a5,-24(s0)
    109e:	fdc42703          	lw	a4,-36(s0)
    10a2:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    10a4:	00000797          	auipc	a5,0x0
    10a8:	4cc78793          	addi	a5,a5,1228 # 1570 <freep>
    10ac:	fe043703          	ld	a4,-32(s0)
    10b0:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    10b2:	fe843783          	ld	a5,-24(s0)
    10b6:	07c1                	addi	a5,a5,16
    10b8:	a091                	j	10fc <malloc+0x134>
    }
    if(p == freep)
    10ba:	00000797          	auipc	a5,0x0
    10be:	4b678793          	addi	a5,a5,1206 # 1570 <freep>
    10c2:	639c                	ld	a5,0(a5)
    10c4:	fe843703          	ld	a4,-24(s0)
    10c8:	02f71063          	bne	a4,a5,10e8 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    10cc:	fdc42783          	lw	a5,-36(s0)
    10d0:	853e                	mv	a0,a5
    10d2:	00000097          	auipc	ra,0x0
    10d6:	e76080e7          	jalr	-394(ra) # f48 <morecore>
    10da:	fea43423          	sd	a0,-24(s0)
    10de:	fe843783          	ld	a5,-24(s0)
    10e2:	e399                	bnez	a5,10e8 <malloc+0x120>
        return 0;
    10e4:	4781                	li	a5,0
    10e6:	a819                	j	10fc <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10e8:	fe843783          	ld	a5,-24(s0)
    10ec:	fef43023          	sd	a5,-32(s0)
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	639c                	ld	a5,0(a5)
    10f6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    10fa:	b791                	j	103e <malloc+0x76>
  }
}
    10fc:	853e                	mv	a0,a5
    10fe:	70e2                	ld	ra,56(sp)
    1100:	7442                	ld	s0,48(sp)
    1102:	6121                	addi	sp,sp,64
    1104:	8082                	ret
