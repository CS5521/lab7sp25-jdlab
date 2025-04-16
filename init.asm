
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 eb 09 00 00 	movl   $0x9eb,(%esp)
  18:	e8 b7 04 00 00       	call   4d4 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 eb 09 00 00 	movl   $0x9eb,(%esp)
  38:	e8 9f 04 00 00       	call   4dc <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 eb 09 00 00 	movl   $0x9eb,(%esp)
  4c:	e8 83 04 00 00       	call   4d4 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 af 04 00 00       	call   50c <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 a3 04 00 00       	call   50c <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 f3 09 00 	movl   $0x9f3,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 9f 05 00 00       	call   61c <printf>
    pid = fork();
  7d:	e8 0a 04 00 00       	call   48c <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 06 0a 00 	movl   $0xa06,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 7b 05 00 00       	call   61c <printf>
      exit();
  a1:	e8 ee 03 00 00       	call   494 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 dc 0c 00 	movl   $0xcdc,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 e8 09 00 00 	movl   $0x9e8,(%esp)
  bc:	e8 0b 04 00 00       	call   4cc <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 19 0a 00 	movl   $0xa19,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 47 05 00 00       	call   61c <printf>
      exit();
  d5:	e8 ba 03 00 00       	call   494 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 2f 0a 00 	movl   $0xa2f,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 2c 05 00 00       	call   61c <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 a7 03 00 00       	call   49c <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 61 02 00 00       	call   4ac <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 24 02 00 00       	call   4d4 <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 1a 02 00 00       	call   4ec <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 dc 01 00 00       	call   4bc <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:

void
ps(void)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 37b:	c7 44 24 04 38 0a 00 	movl   $0xa38,0x4(%esp)
 382:	00 
 383:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 38a:	e8 8d 02 00 00       	call   61c <printf>
  getpinfo(&pinfo);
 38f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 395:	89 04 24             	mov    %eax,(%esp)
 398:	e8 97 01 00 00       	call   534 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 39d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3a4:	e9 ce 00 00 00       	jmp    477 <ps+0x108>
      if (pinfo[i].inuse) {
 3a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ac:	89 d0                	mov    %edx,%eax
 3ae:	c1 e0 03             	shl    $0x3,%eax
 3b1:	01 d0                	add    %edx,%eax
 3b3:	c1 e0 02             	shl    $0x2,%eax
 3b6:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3b9:	01 d8                	add    %ebx,%eax
 3bb:	2d 04 09 00 00       	sub    $0x904,%eax
 3c0:	8b 00                	mov    (%eax),%eax
 3c2:	85 c0                	test   %eax,%eax
 3c4:	0f 84 a9 00 00 00    	je     473 <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 3ca:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3d0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3d3:	89 d0                	mov    %edx,%eax
 3d5:	c1 e0 03             	shl    $0x3,%eax
 3d8:	01 d0                	add    %edx,%eax
 3da:	c1 e0 02             	shl    $0x2,%eax
 3dd:	83 c0 10             	add    $0x10,%eax
 3e0:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 3e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	c1 e0 03             	shl    $0x3,%eax
 3eb:	01 d0                	add    %edx,%eax
 3ed:	c1 e0 02             	shl    $0x2,%eax
 3f0:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3f3:	01 f0                	add    %esi,%eax
 3f5:	2d e4 08 00 00       	sub    $0x8e4,%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 3fd:	0f be f0             	movsbl %al,%esi
 400:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 403:	89 d0                	mov    %edx,%eax
 405:	c1 e0 03             	shl    $0x3,%eax
 408:	01 d0                	add    %edx,%eax
 40a:	c1 e0 02             	shl    $0x2,%eax
 40d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 410:	01 c8                	add    %ecx,%eax
 412:	2d f8 08 00 00       	sub    $0x8f8,%eax
 417:	8b 18                	mov    (%eax),%ebx
 419:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 41c:	89 d0                	mov    %edx,%eax
 41e:	c1 e0 03             	shl    $0x3,%eax
 421:	01 d0                	add    %edx,%eax
 423:	c1 e0 02             	shl    $0x2,%eax
 426:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 429:	01 c8                	add    %ecx,%eax
 42b:	2d 00 09 00 00       	sub    $0x900,%eax
 430:	8b 08                	mov    (%eax),%ecx
 432:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 435:	89 d0                	mov    %edx,%eax
 437:	c1 e0 03             	shl    $0x3,%eax
 43a:	01 d0                	add    %edx,%eax
 43c:	c1 e0 02             	shl    $0x2,%eax
 43f:	8d 55 e8             	lea    -0x18(%ebp),%edx
 442:	01 d0                	add    %edx,%eax
 444:	2d fc 08 00 00       	sub    $0x8fc,%eax
 449:	8b 00                	mov    (%eax),%eax
 44b:	89 7c 24 18          	mov    %edi,0x18(%esp)
 44f:	89 74 24 14          	mov    %esi,0x14(%esp)
 453:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 457:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 45b:	89 44 24 08          	mov    %eax,0x8(%esp)
 45f:	c7 44 24 04 51 0a 00 	movl   $0xa51,0x4(%esp)
 466:	00 
 467:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 46e:	e8 a9 01 00 00       	call   61c <printf>
  for (i = 0; i < NPROC; i++) {
 473:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 477:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 47b:	0f 8e 28 ff ff ff    	jle    3a9 <ps+0x3a>
      }
  }

}
 481:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48c:	b8 01 00 00 00       	mov    $0x1,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <exit>:
SYSCALL(exit)
 494:	b8 02 00 00 00       	mov    $0x2,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <wait>:
SYSCALL(wait)
 49c:	b8 03 00 00 00       	mov    $0x3,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <pipe>:
SYSCALL(pipe)
 4a4:	b8 04 00 00 00       	mov    $0x4,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <read>:
SYSCALL(read)
 4ac:	b8 05 00 00 00       	mov    $0x5,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <write>:
SYSCALL(write)
 4b4:	b8 10 00 00 00       	mov    $0x10,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <close>:
SYSCALL(close)
 4bc:	b8 15 00 00 00       	mov    $0x15,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <kill>:
SYSCALL(kill)
 4c4:	b8 06 00 00 00       	mov    $0x6,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <exec>:
SYSCALL(exec)
 4cc:	b8 07 00 00 00       	mov    $0x7,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <open>:
SYSCALL(open)
 4d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <mknod>:
SYSCALL(mknod)
 4dc:	b8 11 00 00 00       	mov    $0x11,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <unlink>:
SYSCALL(unlink)
 4e4:	b8 12 00 00 00       	mov    $0x12,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <fstat>:
SYSCALL(fstat)
 4ec:	b8 08 00 00 00       	mov    $0x8,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <link>:
SYSCALL(link)
 4f4:	b8 13 00 00 00       	mov    $0x13,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <mkdir>:
SYSCALL(mkdir)
 4fc:	b8 14 00 00 00       	mov    $0x14,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <chdir>:
SYSCALL(chdir)
 504:	b8 09 00 00 00       	mov    $0x9,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <dup>:
SYSCALL(dup)
 50c:	b8 0a 00 00 00       	mov    $0xa,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <getpid>:
SYSCALL(getpid)
 514:	b8 0b 00 00 00       	mov    $0xb,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <sbrk>:
SYSCALL(sbrk)
 51c:	b8 0c 00 00 00       	mov    $0xc,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <sleep>:
SYSCALL(sleep)
 524:	b8 0d 00 00 00       	mov    $0xd,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <uptime>:
SYSCALL(uptime)
 52c:	b8 0e 00 00 00       	mov    $0xe,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <getpinfo>:
SYSCALL(getpinfo)
 534:	b8 16 00 00 00       	mov    $0x16,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	83 ec 18             	sub    $0x18,%esp
 542:	8b 45 0c             	mov    0xc(%ebp),%eax
 545:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 548:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54f:	00 
 550:	8d 45 f4             	lea    -0xc(%ebp),%eax
 553:	89 44 24 04          	mov    %eax,0x4(%esp)
 557:	8b 45 08             	mov    0x8(%ebp),%eax
 55a:	89 04 24             	mov    %eax,(%esp)
 55d:	e8 52 ff ff ff       	call   4b4 <write>
}
 562:	c9                   	leave  
 563:	c3                   	ret    

00000564 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	56                   	push   %esi
 568:	53                   	push   %ebx
 569:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 56c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 573:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 577:	74 17                	je     590 <printint+0x2c>
 579:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 57d:	79 11                	jns    590 <printint+0x2c>
    neg = 1;
 57f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 586:	8b 45 0c             	mov    0xc(%ebp),%eax
 589:	f7 d8                	neg    %eax
 58b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 58e:	eb 06                	jmp    596 <printint+0x32>
  } else {
    x = xx;
 590:	8b 45 0c             	mov    0xc(%ebp),%eax
 593:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 596:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 59d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5a0:	8d 41 01             	lea    0x1(%ecx),%eax
 5a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5a6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ac:	ba 00 00 00 00       	mov    $0x0,%edx
 5b1:	f7 f3                	div    %ebx
 5b3:	89 d0                	mov    %edx,%eax
 5b5:	0f b6 80 e4 0c 00 00 	movzbl 0xce4(%eax),%eax
 5bc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5c0:	8b 75 10             	mov    0x10(%ebp),%esi
 5c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c6:	ba 00 00 00 00       	mov    $0x0,%edx
 5cb:	f7 f6                	div    %esi
 5cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d4:	75 c7                	jne    59d <printint+0x39>
  if(neg)
 5d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5da:	74 10                	je     5ec <printint+0x88>
    buf[i++] = '-';
 5dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5df:	8d 50 01             	lea    0x1(%eax),%edx
 5e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5e5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5ea:	eb 1f                	jmp    60b <printint+0xa7>
 5ec:	eb 1d                	jmp    60b <printint+0xa7>
    putc(fd, buf[i]);
 5ee:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f4:	01 d0                	add    %edx,%eax
 5f6:	0f b6 00             	movzbl (%eax),%eax
 5f9:	0f be c0             	movsbl %al,%eax
 5fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	89 04 24             	mov    %eax,(%esp)
 606:	e8 31 ff ff ff       	call   53c <putc>
  while(--i >= 0)
 60b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 60f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 613:	79 d9                	jns    5ee <printint+0x8a>
}
 615:	83 c4 30             	add    $0x30,%esp
 618:	5b                   	pop    %ebx
 619:	5e                   	pop    %esi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    

0000061c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 622:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 629:	8d 45 0c             	lea    0xc(%ebp),%eax
 62c:	83 c0 04             	add    $0x4,%eax
 62f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 632:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 639:	e9 7c 01 00 00       	jmp    7ba <printf+0x19e>
    c = fmt[i] & 0xff;
 63e:	8b 55 0c             	mov    0xc(%ebp),%edx
 641:	8b 45 f0             	mov    -0x10(%ebp),%eax
 644:	01 d0                	add    %edx,%eax
 646:	0f b6 00             	movzbl (%eax),%eax
 649:	0f be c0             	movsbl %al,%eax
 64c:	25 ff 00 00 00       	and    $0xff,%eax
 651:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 654:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 658:	75 2c                	jne    686 <printf+0x6a>
      if(c == '%'){
 65a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 65e:	75 0c                	jne    66c <printf+0x50>
        state = '%';
 660:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 667:	e9 4a 01 00 00       	jmp    7b6 <printf+0x19a>
      } else {
        putc(fd, c);
 66c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66f:	0f be c0             	movsbl %al,%eax
 672:	89 44 24 04          	mov    %eax,0x4(%esp)
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	89 04 24             	mov    %eax,(%esp)
 67c:	e8 bb fe ff ff       	call   53c <putc>
 681:	e9 30 01 00 00       	jmp    7b6 <printf+0x19a>
      }
    } else if(state == '%'){
 686:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 68a:	0f 85 26 01 00 00    	jne    7b6 <printf+0x19a>
      if(c == 'd'){
 690:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 694:	75 2d                	jne    6c3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 696:	8b 45 e8             	mov    -0x18(%ebp),%eax
 699:	8b 00                	mov    (%eax),%eax
 69b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6a2:	00 
 6a3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6aa:	00 
 6ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 6af:	8b 45 08             	mov    0x8(%ebp),%eax
 6b2:	89 04 24             	mov    %eax,(%esp)
 6b5:	e8 aa fe ff ff       	call   564 <printint>
        ap++;
 6ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6be:	e9 ec 00 00 00       	jmp    7af <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6c3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6c7:	74 06                	je     6cf <printf+0xb3>
 6c9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6cd:	75 2d                	jne    6fc <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d2:	8b 00                	mov    (%eax),%eax
 6d4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6db:	00 
 6dc:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6e3:	00 
 6e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	89 04 24             	mov    %eax,(%esp)
 6ee:	e8 71 fe ff ff       	call   564 <printint>
        ap++;
 6f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f7:	e9 b3 00 00 00       	jmp    7af <printf+0x193>
      } else if(c == 's'){
 6fc:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 700:	75 45                	jne    747 <printf+0x12b>
        s = (char*)*ap;
 702:	8b 45 e8             	mov    -0x18(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 70a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 70e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 712:	75 09                	jne    71d <printf+0x101>
          s = "(null)";
 714:	c7 45 f4 61 0a 00 00 	movl   $0xa61,-0xc(%ebp)
        while(*s != 0){
 71b:	eb 1e                	jmp    73b <printf+0x11f>
 71d:	eb 1c                	jmp    73b <printf+0x11f>
          putc(fd, *s);
 71f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 722:	0f b6 00             	movzbl (%eax),%eax
 725:	0f be c0             	movsbl %al,%eax
 728:	89 44 24 04          	mov    %eax,0x4(%esp)
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 05 fe ff ff       	call   53c <putc>
          s++;
 737:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 73b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73e:	0f b6 00             	movzbl (%eax),%eax
 741:	84 c0                	test   %al,%al
 743:	75 da                	jne    71f <printf+0x103>
 745:	eb 68                	jmp    7af <printf+0x193>
        }
      } else if(c == 'c'){
 747:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 74b:	75 1d                	jne    76a <printf+0x14e>
        putc(fd, *ap);
 74d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 750:	8b 00                	mov    (%eax),%eax
 752:	0f be c0             	movsbl %al,%eax
 755:	89 44 24 04          	mov    %eax,0x4(%esp)
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	89 04 24             	mov    %eax,(%esp)
 75f:	e8 d8 fd ff ff       	call   53c <putc>
        ap++;
 764:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 768:	eb 45                	jmp    7af <printf+0x193>
      } else if(c == '%'){
 76a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 76e:	75 17                	jne    787 <printf+0x16b>
        putc(fd, c);
 770:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 773:	0f be c0             	movsbl %al,%eax
 776:	89 44 24 04          	mov    %eax,0x4(%esp)
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	89 04 24             	mov    %eax,(%esp)
 780:	e8 b7 fd ff ff       	call   53c <putc>
 785:	eb 28                	jmp    7af <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 787:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 78e:	00 
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	89 04 24             	mov    %eax,(%esp)
 795:	e8 a2 fd ff ff       	call   53c <putc>
        putc(fd, c);
 79a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79d:	0f be c0             	movsbl %al,%eax
 7a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	89 04 24             	mov    %eax,(%esp)
 7aa:	e8 8d fd ff ff       	call   53c <putc>
      }
      state = 0;
 7af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7ba:	8b 55 0c             	mov    0xc(%ebp),%edx
 7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c0:	01 d0                	add    %edx,%eax
 7c2:	0f b6 00             	movzbl (%eax),%eax
 7c5:	84 c0                	test   %al,%al
 7c7:	0f 85 71 fe ff ff    	jne    63e <printf+0x22>
    }
  }
}
 7cd:	c9                   	leave  
 7ce:	c3                   	ret    

000007cf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7cf:	55                   	push   %ebp
 7d0:	89 e5                	mov    %esp,%ebp
 7d2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	83 e8 08             	sub    $0x8,%eax
 7db:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7de:	a1 00 0d 00 00       	mov    0xd00,%eax
 7e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e6:	eb 24                	jmp    80c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	8b 00                	mov    (%eax),%eax
 7ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f0:	77 12                	ja     804 <free+0x35>
 7f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f8:	77 24                	ja     81e <free+0x4f>
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	8b 00                	mov    (%eax),%eax
 7ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 802:	77 1a                	ja     81e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 00                	mov    (%eax),%eax
 809:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 812:	76 d4                	jbe    7e8 <free+0x19>
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 00                	mov    (%eax),%eax
 819:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 81c:	76 ca                	jbe    7e8 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	01 c2                	add    %eax,%edx
 830:	8b 45 fc             	mov    -0x4(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	39 c2                	cmp    %eax,%edx
 837:	75 24                	jne    85d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 839:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83c:	8b 50 04             	mov    0x4(%eax),%edx
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 00                	mov    (%eax),%eax
 844:	8b 40 04             	mov    0x4(%eax),%eax
 847:	01 c2                	add    %eax,%edx
 849:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 84f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 852:	8b 00                	mov    (%eax),%eax
 854:	8b 10                	mov    (%eax),%edx
 856:	8b 45 f8             	mov    -0x8(%ebp),%eax
 859:	89 10                	mov    %edx,(%eax)
 85b:	eb 0a                	jmp    867 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 860:	8b 10                	mov    (%eax),%edx
 862:	8b 45 f8             	mov    -0x8(%ebp),%eax
 865:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 867:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86a:	8b 40 04             	mov    0x4(%eax),%eax
 86d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	01 d0                	add    %edx,%eax
 879:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 87c:	75 20                	jne    89e <free+0xcf>
    p->s.size += bp->s.size;
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	8b 50 04             	mov    0x4(%eax),%edx
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	01 c2                	add    %eax,%edx
 88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 892:	8b 45 f8             	mov    -0x8(%ebp),%eax
 895:	8b 10                	mov    (%eax),%edx
 897:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89a:	89 10                	mov    %edx,(%eax)
 89c:	eb 08                	jmp    8a6 <free+0xd7>
  } else
    p->s.ptr = bp;
 89e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8a4:	89 10                	mov    %edx,(%eax)
  freep = p;
 8a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a9:	a3 00 0d 00 00       	mov    %eax,0xd00
}
 8ae:	c9                   	leave  
 8af:	c3                   	ret    

000008b0 <morecore>:

static Header*
morecore(uint nu)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8b6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8bd:	77 07                	ja     8c6 <morecore+0x16>
    nu = 4096;
 8bf:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8c6:	8b 45 08             	mov    0x8(%ebp),%eax
 8c9:	c1 e0 03             	shl    $0x3,%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 48 fc ff ff       	call   51c <sbrk>
 8d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8d7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8db:	75 07                	jne    8e4 <morecore+0x34>
    return 0;
 8dd:	b8 00 00 00 00       	mov    $0x0,%eax
 8e2:	eb 22                	jmp    906 <morecore+0x56>
  hp = (Header*)p;
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ed:	8b 55 08             	mov    0x8(%ebp),%edx
 8f0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f6:	83 c0 08             	add    $0x8,%eax
 8f9:	89 04 24             	mov    %eax,(%esp)
 8fc:	e8 ce fe ff ff       	call   7cf <free>
  return freep;
 901:	a1 00 0d 00 00       	mov    0xd00,%eax
}
 906:	c9                   	leave  
 907:	c3                   	ret    

00000908 <malloc>:

void*
malloc(uint nbytes)
{
 908:	55                   	push   %ebp
 909:	89 e5                	mov    %esp,%ebp
 90b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90e:	8b 45 08             	mov    0x8(%ebp),%eax
 911:	83 c0 07             	add    $0x7,%eax
 914:	c1 e8 03             	shr    $0x3,%eax
 917:	83 c0 01             	add    $0x1,%eax
 91a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 91d:	a1 00 0d 00 00       	mov    0xd00,%eax
 922:	89 45 f0             	mov    %eax,-0x10(%ebp)
 925:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 929:	75 23                	jne    94e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 92b:	c7 45 f0 f8 0c 00 00 	movl   $0xcf8,-0x10(%ebp)
 932:	8b 45 f0             	mov    -0x10(%ebp),%eax
 935:	a3 00 0d 00 00       	mov    %eax,0xd00
 93a:	a1 00 0d 00 00       	mov    0xd00,%eax
 93f:	a3 f8 0c 00 00       	mov    %eax,0xcf8
    base.s.size = 0;
 944:	c7 05 fc 0c 00 00 00 	movl   $0x0,0xcfc
 94b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 951:	8b 00                	mov    (%eax),%eax
 953:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 956:	8b 45 f4             	mov    -0xc(%ebp),%eax
 959:	8b 40 04             	mov    0x4(%eax),%eax
 95c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 95f:	72 4d                	jb     9ae <malloc+0xa6>
      if(p->s.size == nunits)
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	8b 40 04             	mov    0x4(%eax),%eax
 967:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 96a:	75 0c                	jne    978 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96f:	8b 10                	mov    (%eax),%edx
 971:	8b 45 f0             	mov    -0x10(%ebp),%eax
 974:	89 10                	mov    %edx,(%eax)
 976:	eb 26                	jmp    99e <malloc+0x96>
      else {
        p->s.size -= nunits;
 978:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97b:	8b 40 04             	mov    0x4(%eax),%eax
 97e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 981:	89 c2                	mov    %eax,%edx
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 989:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	c1 e0 03             	shl    $0x3,%eax
 992:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 995:	8b 45 f4             	mov    -0xc(%ebp),%eax
 998:	8b 55 ec             	mov    -0x14(%ebp),%edx
 99b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 99e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a1:	a3 00 0d 00 00       	mov    %eax,0xd00
      return (void*)(p + 1);
 9a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a9:	83 c0 08             	add    $0x8,%eax
 9ac:	eb 38                	jmp    9e6 <malloc+0xde>
    }
    if(p == freep)
 9ae:	a1 00 0d 00 00       	mov    0xd00,%eax
 9b3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9b6:	75 1b                	jne    9d3 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9bb:	89 04 24             	mov    %eax,(%esp)
 9be:	e8 ed fe ff ff       	call   8b0 <morecore>
 9c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9ca:	75 07                	jne    9d3 <malloc+0xcb>
        return 0;
 9cc:	b8 00 00 00 00       	mov    $0x0,%eax
 9d1:	eb 13                	jmp    9e6 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dc:	8b 00                	mov    (%eax),%eax
 9de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9e1:	e9 70 ff ff ff       	jmp    956 <malloc+0x4e>
}
 9e6:	c9                   	leave  
 9e7:	c3                   	ret    
