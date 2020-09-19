from diagrams import Cluster, Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.network import ELB
from diagrams.aws.network import Route53
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.onprem.network import Nginx

with Diagram("Architecture", show=False):
    dns = Route53("dns")
    lb = ELB("lb")

    with Cluster("N.Virginia"):

        with Cluster("us-east-1a"):
            with Cluster("us-east-1a Services"):
                usEast1AServices = [
                    EC2("WORDPRESS 2"),
                    EC2("TOMCAT 1")
                ]

        # with Cluster("us-east-1b"):
        #     with Cluster("us-east-1b Services"):
        #         usEast1BServices = [
        #             EC2("TOMCAT 1")
        #         ]

        with Cluster("us-east-1c"):
            with Cluster("us-east-1c Services"):
                usEast1CServices = [
                    EC2("TOMCAT 2"),
                    EC2("WORDPRESS 1")
                ]

        with Cluster("RDS"):
            db_master = RDS("RDS - Multi-AZ")
            db_master - RDS ("RDS - Multi-AZ")
        
    s3_wordpress = S3("WordPress Storage")
    s3_staticPages = S3("Static Web")
    
    dns >> lb
    dns >> s3_staticPages

    lb >> usEast1AServices
    lb >> usEast1CServices

    usEast1AServices[1] >> db_master
    usEast1CServices[1] >> db_master

    usEast1AServices[1] >> s3_wordpress
    usEast1CServices[1] >> s3_wordpress
