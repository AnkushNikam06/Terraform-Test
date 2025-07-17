# 1. Create ECS cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "sample-ecs-cluster"
  tags = var.common_tags
}

# 2. Create security group for ecs
resource "aws_security_group" "ecs_security_group" {
  name = "ecs_sg"
  ingress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_block = var.cidr_block
  }
}

# 3. Create a role for ECS to assume policy
resource "aws_iam_role" "task_execution_policy" {
  name = "ecs_task_execution_role"
  assume_role_policy = jsonencode({
    version = "2012-10-17"
    statement = [
        {
            Action = "sts:AssumeRole"
            Principle = {
                Service = "ecs-task.amazonaws.com"
            }
            Effect = "Allow"
            sid = ""
        }
    ]
  }
  )
}

# 4. Attach the policy to ecs role
resource "aws_iam_policy_attachment" "ecs_task_execution_role" {
  name = "ecs_task_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonECSTaskExecutionRolePolicy"
  roles = [aws_iam_role.task_execution_policy.name]
}
