import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { OperationModule } from './operation/operation.module';

@Module({
  imports: [OperationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
