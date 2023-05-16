import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { isEven } from 'is-even';

async function bootstrap() {
  console.log(`${isEven(2)}`);
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
