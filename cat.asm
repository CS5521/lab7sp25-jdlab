
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 bd 04 00 00       	call   4e0 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 14 0a 00 	movl   $0xa14,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 0c 06 00 00       	call   648 <printf>
      exit();
  3c:	e8 7f 04 00 00       	call   4c0 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 7c 04 00 00       	call   4d8 <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 26 0a 00 	movl   $0xa26,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 c9 05 00 00       	call   648 <printf>
    exit();
  7f:	e8 3c 04 00 00       	call   4c0 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 1a 04 00 00       	call   4c0 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 2e 04 00 00       	call   500 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 37 0a 00 	movl   $0xa37,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 41 05 00 00       	call   648 <printf>
      exit();
 107:	e8 b4 03 00 00       	call   4c0 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 c4 03 00 00       	call   4e8 <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 85 03 00 00       	call   4c0 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 61 02 00 00       	call   4d8 <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 24 02 00 00       	call   500 <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 1a 02 00 00       	call   518 <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 dc 01 00 00       	call   4e8 <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:

void
ps(void)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 3a7:	c7 44 24 04 4c 0a 00 	movl   $0xa4c,0x4(%esp)
 3ae:	00 
 3af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b6:	e8 8d 02 00 00       	call   648 <printf>
  getpinfo(&pinfo);
 3bb:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3c1:	89 04 24             	mov    %eax,(%esp)
 3c4:	e8 97 01 00 00       	call   560 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 3c9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3d0:	e9 ce 00 00 00       	jmp    4a3 <ps+0x108>
      if (pinfo[i].inuse) {
 3d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3d8:	89 d0                	mov    %edx,%eax
 3da:	c1 e0 03             	shl    $0x3,%eax
 3dd:	01 d0                	add    %edx,%eax
 3df:	c1 e0 02             	shl    $0x2,%eax
 3e2:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3e5:	01 d8                	add    %ebx,%eax
 3e7:	2d 04 09 00 00       	sub    $0x904,%eax
 3ec:	8b 00                	mov    (%eax),%eax
 3ee:	85 c0                	test   %eax,%eax
 3f0:	0f 84 a9 00 00 00    	je     49f <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 3f6:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ff:	89 d0                	mov    %edx,%eax
 401:	c1 e0 03             	shl    $0x3,%eax
 404:	01 d0                	add    %edx,%eax
 406:	c1 e0 02             	shl    $0x2,%eax
 409:	83 c0 10             	add    $0x10,%eax
 40c:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 40f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 412:	89 d0                	mov    %edx,%eax
 414:	c1 e0 03             	shl    $0x3,%eax
 417:	01 d0                	add    %edx,%eax
 419:	c1 e0 02             	shl    $0x2,%eax
 41c:	8d 75 e8             	lea    -0x18(%ebp),%esi
 41f:	01 f0                	add    %esi,%eax
 421:	2d e4 08 00 00       	sub    $0x8e4,%eax
 426:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 429:	0f be f0             	movsbl %al,%esi
 42c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 42f:	89 d0                	mov    %edx,%eax
 431:	c1 e0 03             	shl    $0x3,%eax
 434:	01 d0                	add    %edx,%eax
 436:	c1 e0 02             	shl    $0x2,%eax
 439:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 43c:	01 c8                	add    %ecx,%eax
 43e:	2d f8 08 00 00       	sub    $0x8f8,%eax
 443:	8b 18                	mov    (%eax),%ebx
 445:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 448:	89 d0                	mov    %edx,%eax
 44a:	c1 e0 03             	shl    $0x3,%eax
 44d:	01 d0                	add    %edx,%eax
 44f:	c1 e0 02             	shl    $0x2,%eax
 452:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 455:	01 c8                	add    %ecx,%eax
 457:	2d 00 09 00 00       	sub    $0x900,%eax
 45c:	8b 08                	mov    (%eax),%ecx
 45e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 461:	89 d0                	mov    %edx,%eax
 463:	c1 e0 03             	shl    $0x3,%eax
 466:	01 d0                	add    %edx,%eax
 468:	c1 e0 02             	shl    $0x2,%eax
 46b:	8d 55 e8             	lea    -0x18(%ebp),%edx
 46e:	01 d0                	add    %edx,%eax
 470:	2d fc 08 00 00       	sub    $0x8fc,%eax
 475:	8b 00                	mov    (%eax),%eax
 477:	89 7c 24 18          	mov    %edi,0x18(%esp)
 47b:	89 74 24 14          	mov    %esi,0x14(%esp)
 47f:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 483:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 487:	89 44 24 08          	mov    %eax,0x8(%esp)
 48b:	c7 44 24 04 65 0a 00 	movl   $0xa65,0x4(%esp)
 492:	00 
 493:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 49a:	e8 a9 01 00 00       	call   648 <printf>
  for (i = 0; i < NPROC; i++) {
 49f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 4a3:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 4a7:	0f 8e 28 ff ff ff    	jle    3d5 <ps+0x3a>
      }
  }

}
 4ad:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b8:	b8 01 00 00 00       	mov    $0x1,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <exit>:
SYSCALL(exit)
 4c0:	b8 02 00 00 00       	mov    $0x2,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <wait>:
SYSCALL(wait)
 4c8:	b8 03 00 00 00       	mov    $0x3,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <pipe>:
SYSCALL(pipe)
 4d0:	b8 04 00 00 00       	mov    $0x4,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <read>:
SYSCALL(read)
 4d8:	b8 05 00 00 00       	mov    $0x5,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <write>:
SYSCALL(write)
 4e0:	b8 10 00 00 00       	mov    $0x10,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <close>:
SYSCALL(close)
 4e8:	b8 15 00 00 00       	mov    $0x15,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <kill>:
SYSCALL(kill)
 4f0:	b8 06 00 00 00       	mov    $0x6,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <exec>:
SYSCALL(exec)
 4f8:	b8 07 00 00 00       	mov    $0x7,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <open>:
SYSCALL(open)
 500:	b8 0f 00 00 00       	mov    $0xf,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <mknod>:
SYSCALL(mknod)
 508:	b8 11 00 00 00       	mov    $0x11,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <unlink>:
SYSCALL(unlink)
 510:	b8 12 00 00 00       	mov    $0x12,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <fstat>:
SYSCALL(fstat)
 518:	b8 08 00 00 00       	mov    $0x8,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <link>:
SYSCALL(link)
 520:	b8 13 00 00 00       	mov    $0x13,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <mkdir>:
SYSCALL(mkdir)
 528:	b8 14 00 00 00       	mov    $0x14,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <chdir>:
SYSCALL(chdir)
 530:	b8 09 00 00 00       	mov    $0x9,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <dup>:
SYSCALL(dup)
 538:	b8 0a 00 00 00       	mov    $0xa,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <getpid>:
SYSCALL(getpid)
 540:	b8 0b 00 00 00       	mov    $0xb,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <sbrk>:
SYSCALL(sbrk)
 548:	b8 0c 00 00 00       	mov    $0xc,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <sleep>:
SYSCALL(sleep)
 550:	b8 0d 00 00 00       	mov    $0xd,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <uptime>:
SYSCALL(uptime)
 558:	b8 0e 00 00 00       	mov    $0xe,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <getpinfo>:
SYSCALL(getpinfo)
 560:	b8 16 00 00 00       	mov    $0x16,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
 56b:	83 ec 18             	sub    $0x18,%esp
 56e:	8b 45 0c             	mov    0xc(%ebp),%eax
 571:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 574:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 57b:	00 
 57c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 57f:	89 44 24 04          	mov    %eax,0x4(%esp)
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	89 04 24             	mov    %eax,(%esp)
 589:	e8 52 ff ff ff       	call   4e0 <write>
}
 58e:	c9                   	leave  
 58f:	c3                   	ret    

00000590 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
 595:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 598:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 59f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5a3:	74 17                	je     5bc <printint+0x2c>
 5a5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5a9:	79 11                	jns    5bc <printint+0x2c>
    neg = 1;
 5ab:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b5:	f7 d8                	neg    %eax
 5b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ba:	eb 06                	jmp    5c2 <printint+0x32>
  } else {
    x = xx;
 5bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5c9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5cc:	8d 41 01             	lea    0x1(%ecx),%eax
 5cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d8:	ba 00 00 00 00       	mov    $0x0,%edx
 5dd:	f7 f3                	div    %ebx
 5df:	89 d0                	mov    %edx,%eax
 5e1:	0f b6 80 10 0d 00 00 	movzbl 0xd10(%eax),%eax
 5e8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5ec:	8b 75 10             	mov    0x10(%ebp),%esi
 5ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f2:	ba 00 00 00 00       	mov    $0x0,%edx
 5f7:	f7 f6                	div    %esi
 5f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 600:	75 c7                	jne    5c9 <printint+0x39>
  if(neg)
 602:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 606:	74 10                	je     618 <printint+0x88>
    buf[i++] = '-';
 608:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60b:	8d 50 01             	lea    0x1(%eax),%edx
 60e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 611:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 616:	eb 1f                	jmp    637 <printint+0xa7>
 618:	eb 1d                	jmp    637 <printint+0xa7>
    putc(fd, buf[i]);
 61a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 61d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 620:	01 d0                	add    %edx,%eax
 622:	0f b6 00             	movzbl (%eax),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	89 44 24 04          	mov    %eax,0x4(%esp)
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	89 04 24             	mov    %eax,(%esp)
 632:	e8 31 ff ff ff       	call   568 <putc>
  while(--i >= 0)
 637:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 63b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 63f:	79 d9                	jns    61a <printint+0x8a>
}
 641:	83 c4 30             	add    $0x30,%esp
 644:	5b                   	pop    %ebx
 645:	5e                   	pop    %esi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    

00000648 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 64e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 655:	8d 45 0c             	lea    0xc(%ebp),%eax
 658:	83 c0 04             	add    $0x4,%eax
 65b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 65e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 665:	e9 7c 01 00 00       	jmp    7e6 <printf+0x19e>
    c = fmt[i] & 0xff;
 66a:	8b 55 0c             	mov    0xc(%ebp),%edx
 66d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 670:	01 d0                	add    %edx,%eax
 672:	0f b6 00             	movzbl (%eax),%eax
 675:	0f be c0             	movsbl %al,%eax
 678:	25 ff 00 00 00       	and    $0xff,%eax
 67d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 680:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 684:	75 2c                	jne    6b2 <printf+0x6a>
      if(c == '%'){
 686:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 68a:	75 0c                	jne    698 <printf+0x50>
        state = '%';
 68c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 693:	e9 4a 01 00 00       	jmp    7e2 <printf+0x19a>
      } else {
        putc(fd, c);
 698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69b:	0f be c0             	movsbl %al,%eax
 69e:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	89 04 24             	mov    %eax,(%esp)
 6a8:	e8 bb fe ff ff       	call   568 <putc>
 6ad:	e9 30 01 00 00       	jmp    7e2 <printf+0x19a>
      }
    } else if(state == '%'){
 6b2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6b6:	0f 85 26 01 00 00    	jne    7e2 <printf+0x19a>
      if(c == 'd'){
 6bc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6c0:	75 2d                	jne    6ef <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c5:	8b 00                	mov    (%eax),%eax
 6c7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6ce:	00 
 6cf:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6d6:	00 
 6d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	89 04 24             	mov    %eax,(%esp)
 6e1:	e8 aa fe ff ff       	call   590 <printint>
        ap++;
 6e6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ea:	e9 ec 00 00 00       	jmp    7db <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6ef:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6f3:	74 06                	je     6fb <printf+0xb3>
 6f5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6f9:	75 2d                	jne    728 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6fe:	8b 00                	mov    (%eax),%eax
 700:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 707:	00 
 708:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 70f:	00 
 710:	89 44 24 04          	mov    %eax,0x4(%esp)
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	89 04 24             	mov    %eax,(%esp)
 71a:	e8 71 fe ff ff       	call   590 <printint>
        ap++;
 71f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 723:	e9 b3 00 00 00       	jmp    7db <printf+0x193>
      } else if(c == 's'){
 728:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 72c:	75 45                	jne    773 <printf+0x12b>
        s = (char*)*ap;
 72e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 731:	8b 00                	mov    (%eax),%eax
 733:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 736:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 73a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 73e:	75 09                	jne    749 <printf+0x101>
          s = "(null)";
 740:	c7 45 f4 75 0a 00 00 	movl   $0xa75,-0xc(%ebp)
        while(*s != 0){
 747:	eb 1e                	jmp    767 <printf+0x11f>
 749:	eb 1c                	jmp    767 <printf+0x11f>
          putc(fd, *s);
 74b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74e:	0f b6 00             	movzbl (%eax),%eax
 751:	0f be c0             	movsbl %al,%eax
 754:	89 44 24 04          	mov    %eax,0x4(%esp)
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	89 04 24             	mov    %eax,(%esp)
 75e:	e8 05 fe ff ff       	call   568 <putc>
          s++;
 763:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 767:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76a:	0f b6 00             	movzbl (%eax),%eax
 76d:	84 c0                	test   %al,%al
 76f:	75 da                	jne    74b <printf+0x103>
 771:	eb 68                	jmp    7db <printf+0x193>
        }
      } else if(c == 'c'){
 773:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 777:	75 1d                	jne    796 <printf+0x14e>
        putc(fd, *ap);
 779:	8b 45 e8             	mov    -0x18(%ebp),%eax
 77c:	8b 00                	mov    (%eax),%eax
 77e:	0f be c0             	movsbl %al,%eax
 781:	89 44 24 04          	mov    %eax,0x4(%esp)
 785:	8b 45 08             	mov    0x8(%ebp),%eax
 788:	89 04 24             	mov    %eax,(%esp)
 78b:	e8 d8 fd ff ff       	call   568 <putc>
        ap++;
 790:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 794:	eb 45                	jmp    7db <printf+0x193>
      } else if(c == '%'){
 796:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 79a:	75 17                	jne    7b3 <printf+0x16b>
        putc(fd, c);
 79c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79f:	0f be c0             	movsbl %al,%eax
 7a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 b7 fd ff ff       	call   568 <putc>
 7b1:	eb 28                	jmp    7db <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7b3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7ba:	00 
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	89 04 24             	mov    %eax,(%esp)
 7c1:	e8 a2 fd ff ff       	call   568 <putc>
        putc(fd, c);
 7c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c9:	0f be c0             	movsbl %al,%eax
 7cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d0:	8b 45 08             	mov    0x8(%ebp),%eax
 7d3:	89 04 24             	mov    %eax,(%esp)
 7d6:	e8 8d fd ff ff       	call   568 <putc>
      }
      state = 0;
 7db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7e6:	8b 55 0c             	mov    0xc(%ebp),%edx
 7e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ec:	01 d0                	add    %edx,%eax
 7ee:	0f b6 00             	movzbl (%eax),%eax
 7f1:	84 c0                	test   %al,%al
 7f3:	0f 85 71 fe ff ff    	jne    66a <printf+0x22>
    }
  }
}
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	83 e8 08             	sub    $0x8,%eax
 807:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80a:	a1 48 0d 00 00       	mov    0xd48,%eax
 80f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 812:	eb 24                	jmp    838 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 00                	mov    (%eax),%eax
 819:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 81c:	77 12                	ja     830 <free+0x35>
 81e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 821:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 824:	77 24                	ja     84a <free+0x4f>
 826:	8b 45 fc             	mov    -0x4(%ebp),%eax
 829:	8b 00                	mov    (%eax),%eax
 82b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82e:	77 1a                	ja     84a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 830:	8b 45 fc             	mov    -0x4(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	89 45 fc             	mov    %eax,-0x4(%ebp)
 838:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 83e:	76 d4                	jbe    814 <free+0x19>
 840:	8b 45 fc             	mov    -0x4(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 848:	76 ca                	jbe    814 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 84a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84d:	8b 40 04             	mov    0x4(%eax),%eax
 850:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 857:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85a:	01 c2                	add    %eax,%edx
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	8b 00                	mov    (%eax),%eax
 861:	39 c2                	cmp    %eax,%edx
 863:	75 24                	jne    889 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 865:	8b 45 f8             	mov    -0x8(%ebp),%eax
 868:	8b 50 04             	mov    0x4(%eax),%edx
 86b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86e:	8b 00                	mov    (%eax),%eax
 870:	8b 40 04             	mov    0x4(%eax),%eax
 873:	01 c2                	add    %eax,%edx
 875:	8b 45 f8             	mov    -0x8(%ebp),%eax
 878:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 00                	mov    (%eax),%eax
 880:	8b 10                	mov    (%eax),%edx
 882:	8b 45 f8             	mov    -0x8(%ebp),%eax
 885:	89 10                	mov    %edx,(%eax)
 887:	eb 0a                	jmp    893 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 889:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88c:	8b 10                	mov    (%eax),%edx
 88e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 891:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 893:	8b 45 fc             	mov    -0x4(%ebp),%eax
 896:	8b 40 04             	mov    0x4(%eax),%eax
 899:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a3:	01 d0                	add    %edx,%eax
 8a5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a8:	75 20                	jne    8ca <free+0xcf>
    p->s.size += bp->s.size;
 8aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b3:	8b 40 04             	mov    0x4(%eax),%eax
 8b6:	01 c2                	add    %eax,%edx
 8b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c1:	8b 10                	mov    (%eax),%edx
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	89 10                	mov    %edx,(%eax)
 8c8:	eb 08                	jmp    8d2 <free+0xd7>
  } else
    p->s.ptr = bp;
 8ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8d0:	89 10                	mov    %edx,(%eax)
  freep = p;
 8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d5:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8da:	c9                   	leave  
 8db:	c3                   	ret    

000008dc <morecore>:

static Header*
morecore(uint nu)
{
 8dc:	55                   	push   %ebp
 8dd:	89 e5                	mov    %esp,%ebp
 8df:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8e2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8e9:	77 07                	ja     8f2 <morecore+0x16>
    nu = 4096;
 8eb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8f2:	8b 45 08             	mov    0x8(%ebp),%eax
 8f5:	c1 e0 03             	shl    $0x3,%eax
 8f8:	89 04 24             	mov    %eax,(%esp)
 8fb:	e8 48 fc ff ff       	call   548 <sbrk>
 900:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 903:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 907:	75 07                	jne    910 <morecore+0x34>
    return 0;
 909:	b8 00 00 00 00       	mov    $0x0,%eax
 90e:	eb 22                	jmp    932 <morecore+0x56>
  hp = (Header*)p;
 910:	8b 45 f4             	mov    -0xc(%ebp),%eax
 913:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 916:	8b 45 f0             	mov    -0x10(%ebp),%eax
 919:	8b 55 08             	mov    0x8(%ebp),%edx
 91c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 91f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 922:	83 c0 08             	add    $0x8,%eax
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 ce fe ff ff       	call   7fb <free>
  return freep;
 92d:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 932:	c9                   	leave  
 933:	c3                   	ret    

00000934 <malloc>:

void*
malloc(uint nbytes)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	83 c0 07             	add    $0x7,%eax
 940:	c1 e8 03             	shr    $0x3,%eax
 943:	83 c0 01             	add    $0x1,%eax
 946:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 949:	a1 48 0d 00 00       	mov    0xd48,%eax
 94e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 951:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 955:	75 23                	jne    97a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 957:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 95e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 961:	a3 48 0d 00 00       	mov    %eax,0xd48
 966:	a1 48 0d 00 00       	mov    0xd48,%eax
 96b:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 970:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 977:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97d:	8b 00                	mov    (%eax),%eax
 97f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 982:	8b 45 f4             	mov    -0xc(%ebp),%eax
 985:	8b 40 04             	mov    0x4(%eax),%eax
 988:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 98b:	72 4d                	jb     9da <malloc+0xa6>
      if(p->s.size == nunits)
 98d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 990:	8b 40 04             	mov    0x4(%eax),%eax
 993:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 996:	75 0c                	jne    9a4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 998:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99b:	8b 10                	mov    (%eax),%edx
 99d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a0:	89 10                	mov    %edx,(%eax)
 9a2:	eb 26                	jmp    9ca <malloc+0x96>
      else {
        p->s.size -= nunits;
 9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a7:	8b 40 04             	mov    0x4(%eax),%eax
 9aa:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9ad:	89 c2                	mov    %eax,%edx
 9af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b8:	8b 40 04             	mov    0x4(%eax),%eax
 9bb:	c1 e0 03             	shl    $0x3,%eax
 9be:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c4:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9c7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cd:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d5:	83 c0 08             	add    $0x8,%eax
 9d8:	eb 38                	jmp    a12 <malloc+0xde>
    }
    if(p == freep)
 9da:	a1 48 0d 00 00       	mov    0xd48,%eax
 9df:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9e2:	75 1b                	jne    9ff <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9e7:	89 04 24             	mov    %eax,(%esp)
 9ea:	e8 ed fe ff ff       	call   8dc <morecore>
 9ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9f6:	75 07                	jne    9ff <malloc+0xcb>
        return 0;
 9f8:	b8 00 00 00 00       	mov    $0x0,%eax
 9fd:	eb 13                	jmp    a12 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a02:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a08:	8b 00                	mov    (%eax),%eax
 a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a0d:	e9 70 ff ff ff       	jmp    982 <malloc+0x4e>
}
 a12:	c9                   	leave  
 a13:	c3                   	ret    
